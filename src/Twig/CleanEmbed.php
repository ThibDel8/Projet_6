<?php

namespace App\Twig;

use Twig\Extension\AbstractExtension;
use Twig\TwigFilter;

class CleanEmbed extends AbstractExtension
{
    public function getFilters(): array
    {
        return [new TwigFilter('embed', [$this, 'clean'], ['is_safe' => ['html']])];
    }

    public function clean(string $embed): string
    {
        $embed = strip_tags($embed, '<iframe>');

        return $embed;
    }
}
