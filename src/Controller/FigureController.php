<?php

namespace App\Controller;

use App\Entity\Comment;
use App\Entity\Figure;
use App\Entity\Media;
use App\Form\CommentFormType;
use App\Form\FigureFormType;
use App\Repository\CommentRepository;
use DateTime;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bridge\Doctrine\Attribute\MapEntity;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Bundle\SecurityBundle\Security;
use Symfony\Component\HttpFoundation\File\Exception\FileException;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;

class FigureController extends AbstractController
{
    #[Route('/create_figure', name: 'app_create_figure')]
    public function nouvelleFigure(Request $request, EntityManagerInterface $entityManager, Security $security): Response
    {
        $figure = new Figure();
        $form = $this->createForm(FigureFormType::class, $figure);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $this->processVideos($figure, $form->get('embeds')->getData());
            $this->processImages($figure, $form->get('images')->getData());

            $user = $security->getUser();
            $nom = $form->get('nom')->getData();
            $description = $form->get('description')->getData();
            $groupe = $form->get('groupe')->getData();


            $figure->setUser($user);
            $figure->setNom($nom);
            $figure->setDescription($description);
            $figure->setGroupe($groupe);


            $entityManager->persist($figure);
            $entityManager->flush();

            $this->addFlash('success', 'La figure a été ajoutée avec succès.');

            return $this->redirect($this->generateUrl('app_home') . '#tricks_list');
        }

        return $this->render('figure/create.html.twig', [
            'form' => $form,
        ]);
    }

    private function processVideos(Figure $figure, ?string $embeds = ''): void
    {
        foreach (preg_split('/\n|\r\n?/', $embeds) as $embed) {
            if (false === empty($embed)) {
                $media = new Media();
                $media->setUrlMedia($embed);
                $media->setType('video');
                $figure->addMedia($media);
            }
        }
    }

    private function processImages(Figure $figure, ?array $mediaFiles = []): void
    {
        foreach ($mediaFiles as $mediaFile) {
            $newFileName = uniqid() . '.' . $mediaFile->guessExtension();

            try {
                $mediaFile->move('medias/', $newFileName);

                $media = new Media();
                $media->setUrlMedia($newFileName);
                $media->setType('image');
                $figure->addMedia($media);
            } catch (FileException $e) {
            }
        }
    }

    #[Route('/figure/{slug}', name: 'app_figure_details', requirements: ['slug' => '[aA0-zZ9\-]+'])]
    public function show(string $slug, Figure $figure, EntityManagerInterface $entityManager, CommentRepository $commentRepository, Request $request): Response
    {
        $user = $this->getUser();

        $comment = new Comment();
        $comment->setFigure($figure);
        $comment->setUser($user);

        $form = $this->createForm(CommentFormType::class, $comment);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $entityManager->persist($comment);
            $entityManager->flush();

            $this->addFlash('success', 'Votre commentaire a été enoyé !');

            return $this->redirectToRoute('app_figure_details', ['slug' => $slug]);
        }

        $figureId = $figure->getId();
        $page = $request->query->getInt('page', 1);
        $limit = 10;

        $paginator = $commentRepository->paginateComment($figureId, $page, $limit);
        $comments = $paginator->getIterator();
        $maxPage = ceil($paginator->count() / $limit);

        return $this->render('figure/show.html.twig', [
            'figure' => $figure,
            'images' => $figure->getMedias()->filter(fn (Media $media) => $media->getType() === 'image'),
            'videos' => $figure->getMedias()->filter(fn (Media $media) => $media->getType() === 'video'),
            'comments' => $comments,
            'page' => $page,
            'maxPage' => $maxPage,
            'form' => $form->createView(),
        ]);
    }

    #[Route('/figure/{slug}/edit', name: 'app_figure_edit', requirements: ['slug' => '[aA0-zZ9\-]+'])]
    public function edit(string $slug, Request $request, Figure $figure, EntityManagerInterface $entityManager, Security $security): Response
    {
        $form = $this->createForm(FigureFormType::class, $figure);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $this->processVideos($figure, $form->get('embeds')?->getData());
            $this->processImages($figure, $form->get('images')?->getData());


            $user = $security->getUser();
            $nom = $form->get('nom')->getData();
            $description = $form->get('description')->getData();
            $groupe = $form->get('groupe')->getData();


            $figure->setUser($user);
            $figure->setNom($nom);
            $figure->setDescription($description);
            $figure->setGroupe($groupe);

            $now = new DateTime('now');
            $figure->setDateMaj($now);

            $entityManager->persist($figure);
            $entityManager->flush();

            $this->addFlash('success', 'La figure a été modifiée avec succès !');
            return $this->redirectToRoute('app_figure_details', ['slug' => $figure->getSlug()]);
        }

        return $this->render('figure/edit.html.twig', [
            'slug' => $slug,
            'form' => $form->createView(),
            'figure' => $figure,
            'images' => $figure->getMedias()->filter(fn (Media $media) => $media->getType() === 'image')->toArray(),
            'videos' => $figure->getMedias()->filter(fn (Media $media) => $media->getType() === 'video')->toArray(),
        ]);
    }

    #[Route('/figure/{slug}/delete', name: 'app_figure_delete', requirements: ['slug' => '[aA0-zZ9\-]+'])]
    public function delete(Figure $figure, EntityManagerInterface $entityManager): Response
    {
        $entityManager->remove($figure);
        $entityManager->flush();

        $this->addFlash('success', 'La figure a été suprimée avec succès !');
        return $this->redirectToRoute('app_home');
    }

    #[Route('/figure/{slug}/media/{id}/delete', name: 'app_figure_delete_media', requirements: ['id' => '\d+', 'slug' => '[aA0-zZ9\-]+'])]
    public function deleteMedia(string $slug, int $id, EntityManagerInterface $entityManager): Response
    {
        $media = $entityManager->getRepository(Media::class)->find($id);

        $entityManager->remove($media);
        $entityManager->flush();

        return $this->redirectToRoute('app_figure_edit', ['slug' => $slug]);
    }

    #[Route('/figure/{slug}/edit/media/{id}/default', name: 'app_figure_edit_media_default', requirements: ['id' => '\d+', 'slug' => '[aA0-zZ9\-]+'])]
    public function updateDefaultMedia(#[MapEntity(mapping: ['slug' => 'slug'])] Figure $figure, Media $media, EntityManagerInterface $entityManager): Response
    {
        $figure->getDefaultImage()?->setByDefault(false);

        $media->setByDefault(true);

        $entityManager->flush();

        return $this->redirectToRoute('app_figure_edit', ['slug' => $figure->getSlug()]);
    }
}
