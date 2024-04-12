<?php

namespace App\DataFixtures;

use App\Entity\Figure;
use App\Entity\Media;
use App\Entity\User;
use DateTime;
use Doctrine\Bundle\FixturesBundle\Fixture;
use Doctrine\Common\DataFixtures\OrderedFixtureInterface;
use Doctrine\Persistence\ObjectManager;

class FigureFixtures extends Fixture implements OrderedFixtureInterface
{
    public function load(ObjectManager $manager): void
    {
        for ($i = 1; $i <= 20; $i++) {
            $figure = new Figure();

            $media = new Media();
            $media
                ->setUrlMedia('mon_image_test.jpg')
                ->setType('image')
                ->setFigure($figure);

            $figure
                ->setDateCreation(new DateTime('-5 days'))
                ->setDateMaj(new DateTime('now'))
                ->setUser($this->getReference('user=test'))
                ->setNom('Figure ' . $i)
                ->setGroupe('Groupe ' . $i)
                ->setDescription('Description blahblah')
                ->addMedia($media);

            $manager->persist($figure);
        }

        $manager->flush();
    }

    public function getOrder(): int
    {
        return 2;
    }
}
