<?php

namespace App\Controller;

use App\Entity\Comment;
use App\Entity\Figure;
use App\Form\CommentFormType;
use App\Repository\CommentRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;

class CommentController extends AbstractController
{
    #[Route('/figure/{slug}/comment', name: 'app_figure_comment')]
    public function sendComment($slug, EntityManagerInterface $entityManager, Request $request, CommentRepository $commentRepository): Response
    {
        $figure = $entityManager->getRepository(Figure::class)->findOneBy(['slug' => $slug]);

        $comment = new Comment();
        $form = $this->createForm(CommentFormType::class, $comment);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $user = $this->getUser();
            $comment->setUser($user);
            $comment->setFigure($figure);

            $entityManager->persist($comment);
            $entityManager->flush();

            $this->addFlash('success', 'Votre commentaire a été envoyé !');
            return $this->redirectToRoute('app_figure_details', ['slug' => $slug]);
        }

        $comments = $commentRepository->findBy(['figure' => $figure]);

        return $this->render('figure/details.html.twig', [
            'form' => $form->createView(),
            'figure' => $figure,
            'comments' => $comments
        ]);
    }
}
