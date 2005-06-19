use strict;
use warnings;
use Module::Build;

my $builder = Module::Build->new(
    module_name         => 'Gtk2Fu',
    license             => 'perl',
    dist_author         => 'dams <dams@gentoo.org>',
    dist_version_from   => 'lib/Gtk2Fu.pm',
    requires => {
        'Test::More' => 0,
    },
    add_to_cleanup      => [ 'Gtk2Fu-*' ],
);

$builder->create_build_script();
