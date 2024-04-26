<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;
use Symfony\Component\Security\Core\User\UserInterface;

class ProfilController extends AbstractController
{
    #[Route(path: '/profil', name: 'app_profil')]
    public function profil(UserInterface $user): Response
    {
        if (!$user) {
            return $this->redirectToRoute('app_login');
        } else {
            $user = $this->getUser();

            return $this->render('security/profil.html.twig', [
                'user' => $user,
            ]);
        }
    }
}
