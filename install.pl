#!/usr/bin/env perl
use strict; use warnings; use feature qw/say/;

# Install Script for dotfiles
# ===========================
#
# author:   Alister West <http://alisterwest.com>
# licence:  http://creativecommons.org/licenses/by/3.0/
#        :  Include link to original author.

use File::Basename          qw/dirname basename/;
use File::Copy              qw/copy move/;
use File::Copy::Recursive   qw/rcopy/;
use File::Path              qw/remove_tree/;
use FindBin                 qw/$Bin/;
use List::Util              qw/max/;

die "No home found!" unless $ENV{HOME};

my $CLEANUP = grep { /^--cleanup$/ } @ARGV;

my @clobbered;
my @dotfiles = grep { !/\/\.git$/ }     # ignore .git project
               grep { !/^$Bin\/\.+$/ }  # ignore . and ..
               grep { !/\.swp$/ }       # ignore dev files
               glob ("$Bin/.*");

say "Installing dotfiles to $ENV{HOME}";

#
# Loop through all dotfiles in git repo and copy to ~/
# Create backups at ~/$dotfile.dotold
#
for my $path (@dotfiles) {

    my $dir = dirname($path);
    my $file = basename($path);
    my $new_path = "$ENV{HOME}/$file";

    # Only backup once.
    if (-e $new_path) {
        push @clobbered, "$new_path.dotold";
        move $new_path, "$new_path.dotold" if !-e "$new_path.dotold";
    }
    rcopy $path, $new_path or die $!;
}

# Notify of clobbers
if (@clobbered && !$CLEANUP) {
    say "The following files avoided clobbering:";
    say " .. $_" for @clobbered;
}

# Remove clobbered backups
if (@clobbered && $CLEANUP) {
    for (@clobbered) {
        my $max = max map { length } @clobbered;
        say sprintf " ... %-${max}s   [removed]", $_;
        remove_tree( $_ );
    }
}

say "done!";
