<?php

namespace App\Controller;

use App\Entity\Figure;
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
            $userId = $user->getId();

            $figure->setUserId($userId);

            $now = new DateTime('now');
            $figure->setDateCreation($now->format("d/m/Y"));

            $entityManager->persist($figure);
            $entityManager->flush();

            $this->addFlash('success', 'La figure a été ajoutée avec succès.');

            return $this->redirectToRoute('app_home');
        }

        return $this->render('figure/index.html.twig', [
            'FigureForm' => $form,
        ]);
    }
}
