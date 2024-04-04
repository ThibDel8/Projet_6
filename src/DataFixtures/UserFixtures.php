<?php

namespace App\DataFixtures;

use App\Entity\User;
use DateTime;
use Doctrine\Bundle\FixturesBundle\Fixture;
use Doctrine\Common\DataFixtures\OrderedFixtureInterface;
use Doctrine\Persistence\ObjectManager;
use Symfony\Component\PasswordHasher\Hasher\UserPasswordHasherInterface;

class UserFixtures extends Fixture implements OrderedFixtureInterface
{
    public function __construct(private readonly UserPasswordHasherInterface $passwordHasher)
    {
    }

    public function load(ObjectManager $manager): void
    {
        $user = new User();
        $user->setEmail('test@snowtricks.fr');
        $user->setIsVerified(true);
        $user->setPassword($this->passwordHasher->hashPassword($user, 'test1234'));
        $user->setUsername('test');
        $user->setUrlPhotoProfil('default_profile.jpg');
        $user->setDateInscription(new DateTime('now'));

        $this->setReference('user=test', $user);

        $manager->persist($user);
        $manager->flush();
    }

    public function getOrder(): int
    {
        return 1;
    }
}
