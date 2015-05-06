#! /usr/bin/perl -w
use strict;

# (C) Copyright 2003 Rahul Dhesi, All rights reserved.
#
# "As is" -- No warranty.
#
# Copying, use, and modification are permitted, governed by
# the GNU General Public License, by only those who agree
# to use this program at their own risk.

# Read output from Postfix's 'mailq' command.
#
# Prints it one line per entry.
#
# For convenience you may install a shell script called 'cmailq'
# that does this:
#
#  mailq | cleanq | more
#

# $Source: /mi/maincvs/mail/cleanq,v $
# $Id: cleanq,v 1.3 2003/01/21 02:10:53 dhesi Exp $

my $RCSHEADER = '$Source: /mi/maincvs/mail/cleanq,v $' . "\n" .
	'$Id: cleanq,v 1.3 2003/01/21 02:10:53 dhesi Exp $';

my @lines = ();
my $goteof = 1;
# in the beginning, print all data until we enter a line
while (<>) {
  chomp;
  if (/^[\s(]/) {
    # line begins with blank or left paren, so just print it and
    # continue looping
    print "$_\n";
    next;
  }
  
  # line begins with non-blank; save it and exit this loop
  push(@lines, $_);
  $goteof = 0;
  last;
}

if ($goteof) {
  @lines && print "@lines\n";
  exit(0);
}

# now we have a line loaded into @lines
while (<>) {
  chomp;
  if (/^\s*$/) {
    # line is empty or blank; print accumulated lines and restart loop
    print "@lines\n";
    @lines = ();
  } elsif (s/^\s+//) {
    # line begins with blank; so keep accumulating
    push(@lines, $_);
  } elsif (/^\(/) {
    # line begins with left paren; so keep accumulating
    push(@lines, $_);
  } else {
    # print accumulated lines and restart loop
    @lines && print "@lines\n";
    @lines = ($_);
  }
}
