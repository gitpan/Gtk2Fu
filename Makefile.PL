#!/usr/bin/perl

require 5.008;
use ExtUtils::MakeMaker;

WriteMakefile(
    AUTHOR => 'dams <dams@gentoo.org>',
    NAME => 'Gtk2Fu',
    PREREQ_PM => {
	'Gtk2' => 0,
    },
    VERSION_FROM => 'Gtk2Fu.pm',
);
