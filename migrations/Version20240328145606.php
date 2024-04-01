<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20240328145606 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE comment DROP FOREIGN KEY FK_9474526C60BB6FE6');
        $this->addSql('DROP INDEX IDX_9474526C60BB6FE6 ON comment');
        $this->addSql('ALTER TABLE comment CHANGE auteur_id username_id INT NOT NULL');
        $this->addSql('ALTER TABLE comment ADD CONSTRAINT FK_9474526CED766068 FOREIGN KEY (username_id) REFERENCES `user` (id)');
        $this->addSql('CREATE INDEX IDX_9474526CED766068 ON comment (username_id)');
        $this->addSql('DROP INDEX uc_nom_unique ON figure');
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE comment DROP FOREIGN KEY FK_9474526CED766068');
        $this->addSql('DROP INDEX IDX_9474526CED766068 ON comment');
        $this->addSql('ALTER TABLE comment CHANGE username_id auteur_id INT NOT NULL');
        $this->addSql('ALTER TABLE comment ADD CONSTRAINT FK_9474526C60BB6FE6 FOREIGN KEY (auteur_id) REFERENCES user (id) ON UPDATE NO ACTION ON DELETE NO ACTION');
        $this->addSql('CREATE INDEX IDX_9474526C60BB6FE6 ON comment (auteur_id)');
        $this->addSql('CREATE UNIQUE INDEX uc_nom_unique ON figure (nom)');
    }
}
