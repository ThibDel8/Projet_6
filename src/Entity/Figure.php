<?php

namespace App\Entity;

use App\Repository\FigureRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\DBAL\Types\Types;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity(repositoryClass: FigureRepository::class)]
class Figure
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    private ?int $id = null;

    #[ORM\Column(length: 100)]
    private ?string $nom = null;

    #[ORM\Column(type: Types::TEXT)]
    private ?string $description = null;

    #[ORM\Column(length: 100)]
    private ?string $groupe = null;

    #[ORM\Column]
    private ?int $user_id = null;

    #[ORM\Column(length: 19)]
    private ?string $date_creation = null;

    #[ORM\Column(length: 19, nullable: true)]
    private ?string $date_maj = null;

    #[ORM\OneToMany(targetEntity: Comment::class, mappedBy: 'figure')]
    private Collection $commentaires;

    #[ORM\OneToMany(targetEntity: Media::class, mappedBy: 'figure', orphanRemoval: true)]
    private Collection $medias;

    public function __construct()
    {
        $this->commentaires = new ArrayCollection();
        $this->medias = new ArrayCollection();
    }

    /**
     * @return Collection<int, Comment>
     */
    public function getCommentaires(): Collection
    {
        return $this->commentaires;
    }

    public function addCommentaire(Comment $commentaire): static
    {
        if (!$this->commentaires->contains($commentaire)) {
            $this->commentaires->add($commentaire);
            $commentaire->setFigure($this);
        }

        return $this;
    }

    public function removeCommentaire(Comment $commentaire): static
    {
        if ($this->commentaires->removeElement($commentaire)) {
            // set the owning side to null (unless already changed)
            if ($commentaire->getFigure() === $this) {
                $commentaire->setFigure(null);
            }
        }

        return $this;
    }

    /**
     * @return Collection<int, Media>
     */
    public function getMedias(): Collection
    {
        return $this->medias;
    }

    public function addMedia(Media $media): static
    {
        if (!$this->medias->contains($media)) {
            $this->medias->add($media);
            $media->setFigure($this);
        }

        return $this;
    }

    public function removeMedia(Media $media): static
    {
        if ($this->medias->removeElement($media)) {
            // set the owning side to null (unless already changed)
            if ($media->getFigure() === $this) {
                $media->setFigure(null);
            }
        }

        return $this;
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getNom(): ?string
    {
        return $this->nom;
    }

    public function setNom(string $nom): static
    {
        $this->nom = $nom;

        return $this;
    }

    public function getDescription(): ?string
    {
        return $this->description;
    }

    public function setDescription(string $description): static
    {
        $this->description = $description;

        return $this;
    }

    public function getGroupe(): ?string
    {
        return $this->groupe;
    }

    public function setGroupe(string $groupe): static
    {
        $this->groupe = $groupe;

        return $this;
    }

    public function getUserId(): ?int
    {
        return $this->user_id;
    }

    public function setUserId(int $user_id): static
    {
        $this->user_id = $user_id;

        return $this;
    }

    public function getDateCreation(): ?string
    {
        return $this->date_creation;
    }

    public function setDateCreation(string $date_creation): static
    {
        $this->date_creation = $date_creation;

        return $this;
    }

    public function getDateMaj(): ?string
    {
        return $this->date_maj;
    }

    public function setDateMaj(?string $date_maj): static
    {
        $this->date_maj = $date_maj;

        return $this;
    }
}
