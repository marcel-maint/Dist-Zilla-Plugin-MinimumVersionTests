use 5.008;
use strict;
use warnings;

package Dist::Zilla::Plugin::MinimumVersionTests;
# ABSTRACT: Release tests for minimum required versions
use Moose;
extends 'Dist::Zilla::Plugin::InlineFiles';

__PACKAGE__->meta->make_immutable;
no Moose;
1;

=begin :prelude

=for test_synopsis
1;
__END__

=end :prelude

=head1 SYNOPSIS

In C<dist.ini>:

    [MinimumVersionTests]

=head1 DESCRIPTION

This is an extension of L<Dist::Zilla::Plugin::InlineFiles>, providing the
following file:

  xt/release/minimum-version.t - a standard Test::MinimumVersion test

=cut

__DATA__
___[ xt/release/minimum-version.t ]___
#!perl

use Test::More;

eval "use Test::MinimumVersion";
plan skip_all => "Test::MinimumVersion required for testing minimum versions"
  if $@;
all_minimum_version_from_metayml_ok();
