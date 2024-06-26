<?php

namespace App\Entity;

use App\Repository\MediaRepository;
use Doctrine\DBAL\Types\Types;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity(repositoryClass: MediaRepository::class)]
class Media
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    private ?int $id = null;

    #[ORM\Column(length: 50)]
    private ?string $type = null;

    #[ORM\Column(type: Types::TEXT, nullable: true)]
    private ?string $urlMedia = null;

    #[ORM\ManyToOne(targetEntity: Figure::class, inversedBy: 'medias')]
    private ?Figure $figure = null;

    #[ORM\Column(type: Types::BOOLEAN)]
    private bool $byDefault = false;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getType(): ?string
    {
        return $this->type;
    }

    public function setType(string $type): static
    {
        $this->type = $type;

        return $this;
    }

    public function getUrlMedia(): ?string
    {
        return $this->urlMedia;
    }

    public function setUrlMedia(?string $urlMedia): static
    {
        $this->urlMedia = $urlMedia;

        return $this;
    }

    public function getFigure(): ?Figure
    {
        return $this->figure;
    }

    public function setFigure(?Figure $figure): static
    {
        $this->figure = $figure;

        return $this;
    }

    public function isByDefault(): bool
    {
        return $this->byDefault;
    }

    public function getByDefault(): bool
    {
        return $this->byDefault;
    }

    public function setByDefault(bool $byDefault): static
    {
        $this->byDefault = $byDefault;

        return $this;
    }
}
