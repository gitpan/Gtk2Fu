use strict;
use warnings;
use ExtUtils::MakeMaker;

WriteMakefile(
    NAME                => 'Gtk2Fu',
    AUTHOR              => 'dams <dams@gentoo.org>',
    VERSION_FROM        => 'lib/Gtk2Fu.pm',
    ABSTRACT_FROM       => 'lib/Gtk2Fu.pm',
    PL_FILES            => {},
    PREREQ_PM => {
        'Test::More' => 0,
    },
    dist                => { COMPRESS => 'gzip -9f', SUFFIX => 'gz', },
    clean               => { FILES => 'Gtk2Fu-*' },
);
