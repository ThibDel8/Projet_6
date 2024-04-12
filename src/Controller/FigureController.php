<?php

namespace App\Controller;

use App\Entity\Figure;
use App\Entity\Media;
use App\Entity\User;
use App\Form\FigureFormType;
use DateTime;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Bundle\SecurityBundle\Security;
use Symfony\Component\HttpFoundation\File\Exception\FileException;
use Symfony\Component\HttpFoundation\File\UploadedFile;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;
use Symfony\Component\String\Slugger\AsciiSlugger;
use Symfony\Component\String\Slugger\SluggerInterface;

class FigureController extends AbstractController
{
    #[Route('/create_figure', name: 'app_create_figure')]
    public function nouvelleFigure(Request $request, EntityManagerInterface $entityManager, Security $security): Response
    {
        $figure = new Figure();
        $form = $this->createForm(FigureFormType::class, $figure);

        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {

            /** 
             * @var User $user 
             */
            $user = $security->getUser();
            $figure->setUser($user);

            $mediaFiles = $form->get('files')->getData();
            foreach ($mediaFiles as $mediaFile) {
                if ($mediaFile instanceof UploadedFile) {
                    $newFileName = uniqid() . '.' . $mediaFile->guessExtension();

                    $extension = strtolower($mediaFile->guessExtension());
                    $mediaType = 'image';
                    if (in_array($extension, ['mp4', 'avi'])) {
                        $mediaType = 'video';
                    }

                    try {
                        $mediaFile->move('medias/', $newFileName);
                    } catch (FileException $e) {
                    }
                    $media = new Media();
                    $media->setUrlMedia($newFileName);
                    $media->setType($mediaType);
                    $figure->addMedia($media);
                }
            }

            $entityManager->persist($figure);
            $entityManager->flush();

            $this->addFlash('success', 'La figure a été ajoutée avec succès.');

            return $this->redirectToRoute('app_home');
        }

        return $this->render('figure/index.html.twig', [
            'FigureForm' => $form,
        ]);
    }

    #[Route('/figure/{slug}', name: 'app_figure_details')]
    public function show(Figure $figure, EntityManagerInterface $entityManager): Response
    {
        $comments = $figure->getCommentaires();

        return $this->render('figure/show.html.twig', [
            'figure' => $figure,
            'images' => $figure->getMedias()->filter(fn (Media $media) => $media->getType() === 'image')->toArray(),
            'videos' => $figure->getMedias()->filter(fn (Media $media) => $media->getType() === 'video')->toArray(),
            'comments' => $comments,
        ]);
    }

    #[Route('/figure/{id}/edit', name: 'app_figure_edit')]
    public function edit($id, Request $request, Figure $figure, EntityManagerInterface $entityManager): Response
    {
        $form = $this->createForm(FigureFormType::class, $figure);

        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {

            $mediaFiles = $form->get('files')->getData();
            foreach ($mediaFiles as $mediaFile) {
                if ($mediaFile instanceof UploadedFile) {
                    $newFileName = uniqid() . '.' . $mediaFile->guessExtension();

                    $extension = strtolower($mediaFile->guessExtension());
                    $mediaType = 'image';
                    if (in_array($extension, ['mp4', 'avi'])) {
                        $mediaType = 'video';
                    }

                    try {
                        $mediaFile->move('medias/', $newFileName);
                    } catch (FileException $e) {
                    }
                }
                $media = new Media();
                $media->setUrlMedia($newFileName);
                $media->setType($mediaType);
                $figure->addMedia($media);

                $now = new DateTime('now');
                $figure->setDateMaj($now);

                $entityManager->persist($figure);
                $entityManager->flush();
            }

            return $this->redirectToRoute('app_figure_details', ['id' => $id]);
        }

        return $this->render('figure/edit.html.twig', [
            'FigureForm' => $form->createView(),
        ]);
    }

    #[Route('/figure/{id}/delete', name: 'app_figure_delete')]
    public function delete($id, Figure $figure, EntityManagerInterface $entityManager): Response
    {
        $entityManager->remove($figure);
        $entityManager->flush();

        return $this->redirectToRoute('app_home');
    }
}
