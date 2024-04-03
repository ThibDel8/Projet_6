<?php

namespace App\Controller;

use App\Entity\Comment;
use App\Entity\Figure;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;

class CommentController extends AbstractController
{
    #[Route('/figure/{id}/comment', name: 'app_figure_comment')]
    public function sendComment($id, EntityManagerInterface $entityManager, Request $request): Response
    {
        $commentText = $request->get('comment');

        $now = new \DateTime();

        $figure = $entityManager->getRepository(Figure::class)->find($id);

        if (!$figure) {
            throw $this->createNotFoundException('Figure non trouvée');
        }

        $user = $this->getUser();

        $comment = new Comment();
        $comment->setCommentaire($commentText);
        $comment->setDate($now->format('Y-m-d H:i:s'));
        $comment->setFigure($figure);
        $comment->setUsername($user);

        $entityManager->persist($comment);
        $entityManager->flush();

        return $this->redirectToRoute('app_figure_details', ['id' => $id]);
    }
}
