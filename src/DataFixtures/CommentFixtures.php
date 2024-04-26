<?php

namespace App\DataFixtures;

use App\Entity\Comment;
use Doctrine\Bundle\FixturesBundle\Fixture;
use Doctrine\Common\DataFixtures\OrderedFixtureInterface;
use Doctrine\Persistence\ObjectManager;

class CommentFixtures extends Fixture implements OrderedFixtureInterface
{
    public function load(ObjectManager $manager): void
    {
        for ($i = 1; $i <= 20; $i++) {
            $figure = $this->getReference('figure-' . $i);
            for ($o = 1; $o <= 22; $o++) {
                $comment = new Comment();
                $comment->setFigure($figure);
                $comment->setUser($this->getReference('user=test'));
                $comment->setCommentaire('Je suis le commentaire numero ' . $o);

                $manager->persist($comment);
            }
        }

        $manager->flush();
    }

    public function getOrder(): int
    {
        return 3;
    }
}
