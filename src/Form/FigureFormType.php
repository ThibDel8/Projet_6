<?php

namespace App\Form;

use App\Entity\Figure;
use Symfony\Component\Form\AbstractType;
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
                'constraints' => [
                    new NotBlank(),
                ]
            ])
            ->add('description', TextareaType::class, [
                'label' => 'Déscription de la figure'
            ])
            ->add('groupe', TextType::class, [
                'label' => 'Groupe de la figure'
            ])
            ->add('files', FileType::class, [
                'label' => 'Médias de la figure',
                'multiple' => true,
                'mapped' => false,
                'constraints' => [
                    new All(constraints: [
                        new File([
                            'mimeTypes' => [
                                'image/*',
                                'video/mp4',
                                'video/avi'
                            ],
                            'mimeTypesMessage' => 'Veuillez télécharger une image (jpg, jpeg, png) ou une vidéo (mp4, avi).',
                            'maxSize' => '20M',
                            'maxSizeMessage' => 'La taille du fichier ne doit pas dépasser 20 Mo.',
                        ])
                    ]),
                ],
            ]);
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'data_class' => Figure::class,
        ]);
    }
}
