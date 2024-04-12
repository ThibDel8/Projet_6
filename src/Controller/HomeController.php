<?php

namespace App\Controller;

use App\Entity\Figure;
use App\Entity\Media;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;

class HomeController extends AbstractController
{
    private $entityManager;

    public function __construct(EntityManagerInterface $entityManager)
    {
        $this->entityManager = $entityManager;
    }

    #[Route('/', name: 'app_home')]
    public function index(): Response
    {
        $figures = $this->entityManager->getRepository(Figure::class)->findAll();

        $imagesByFigure = [];

        foreach ($figures as $figure) {

            $images = $figure->getMedias()->filter(function ($media) {
                return $media->getType() === 'image';
            });

            $firstImage = $images->first();
            if ($firstImage) {
                $imagesByFigure[$figure->getId()] = $firstImage;
            }
        }

        return $this->render('home/index.html.twig', [
            'controller_name' => 'HomeController',
            'figures' => $figures,
            'imagesByFigure' => $imagesByFigure,
        ]);
    }
}
