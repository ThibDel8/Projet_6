<?php

namespace App\Form;

use App\Entity\Figure;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\ChoiceType;
use Symfony\Component\Form\Extension\Core\Type\FileType;
use Symfony\Component\Form\Extension\Core\Type\TextareaType;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\Validator\Constraints\File;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\Validator\Constraints\All;
use Symfony\Component\Validator\Constraints\NotBlank;

class FigureFormType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
            ->add('nom', TextType::class, [
                'label' => 'Nom de la figure',
                'required' => true,
                'constraints' => [
                    new NotBlank(),
                ]
            ])
            ->add('description', TextareaType::class, [
                'label' => 'Déscription de la figure',
                'required' => true,
            ])
            ->add('groupe', ChoiceType::class, [
                'label' => 'Groupe de la figure',
                'placeholder' => 'Sélectionnez un groupe...',
                'required' => true,
                'choices' => [
                    'Grabs' => 'Grabs',
                    'Rotations' => 'Rotations',
                    'Flips' => 'Flips',
                    'Rotations désaxées' => 'Rotations désaxées',
                    'Slides' => 'Slides',
                    'Old school' => 'Old school',
                ],
            ])
            ->add('images', FileType::class, [
                'label' => 'Médias de la figure',
                'multiple' => true,
                'mapped' => false,
                'required' => false,
                'constraints' => [
                    new All(constraints: [
                        new File([
                            'mimeTypes' => [
                                'image/*'
                            ],
                            'mimeTypesMessage' => 'Veuillez télécharger une image (jpg, jpeg, png)',
                            'maxSize' => '20M',
                            'maxSizeMessage' => 'La taille de votre image ne doit pas dépasser 20 Mo.',
                        ])
                    ]),
                ],
            ])
            ->add('embeds', TextareaType::class, [
                'label' => 'Balises embed (une par ligne)',
                'mapped' => false,
                'required' => false,
            ]);
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'data_class' => Figure::class,
        ]);
    }
}
