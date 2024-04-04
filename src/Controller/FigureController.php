<?php

namespace App\Controller;

use App\Entity\Figure;
use App\Entity\User;
use App\Form\FigureFormType;
use DateTime;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Bundle\SecurityBundle\Security;
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

            /** 
             * @var User $user 
             */
            $user = $security->getUser();

            $figure->setUser($user);

            $entityManager->persist($figure);
            $entityManager->flush();

            $this->addFlash('success', 'La figure a été ajoutée avec succès.');

            return $this->redirectToRoute('app_home');
        }

        return $this->render('figure/index.html.twig', [
            'FigureForm' => $form,
        ]);
    }

    #[Route('/figure/{id}', name: 'app_figure_details')]
    public function show($id, EntityManagerInterface $entityManager): Response
    {

        $figure = $entityManager->getRepository(Figure::class)->find($id);

        if (!$figure) {
            throw $this->createNotFoundException('Figure non trouvée');
        }

        $comments = $figure->getCommentaires();

        return $this->render('figure/show.html.twig', [
            'figure' => $figure,
            'comments' => $comments,
        ]);
    }

    #[Route('/figure/{id}/edit', name: 'app_figure_edit')]
    public function edit($id, Request $request, Figure $figure, EntityManagerInterface $entityManager): Response
    {
        $form = $this->createForm(FigureFormType::class, $figure);

        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $now = new DateTime('now');
            $figure->setDateMaj($now);

            $entityManager->persist($figure);
            $entityManager->flush();

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
