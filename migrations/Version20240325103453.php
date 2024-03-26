<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20240325103453 extends AbstractMigration
{
    public function getDescription(): string
    {
        return 'Add photo_profil column to user table';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('DROP INDEX username ON user');
        $this->addSql('ALTER TABLE user CHANGE username username VARCHAR(50) NOT NULL');
        $this->addSql('ALTER TABLE user ADD url_photo_profil VARCHAR(255) DEFAULT \'default_profile.jpg\'');
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE `user` CHANGE username username VARCHAR(100) DEFAULT NULL');
        $this->addSql('CREATE UNIQUE INDEX username ON `user` (username)');
        $this->addSql('ALTER TABLE user DROP url_photo_profil');
    }
}
