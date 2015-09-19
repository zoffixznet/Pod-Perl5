use Test;
use lib 'lib';

plan 5;

use Pod::Perl5::Grammar; pass "Import Pod::Perl5::Grammar";

ok my $match = Pod::Perl5::Grammar.parsefile('test-corpus/paragraphs_advanced.pod'), 'parse paragraphs with verbatim example';

is $match<pod-section>[0]<paragraph>.elems, 2,
  'Parser extracted two paragraphs';

is $match<pod-section>[0]<verbatim-paragraph>.elems, 1,
  'Parser extracted one verbatim paragraph';

is $match<pod-section>[0]<verbatim-paragraph>.Str,
  qq/  use strict;\n  print "Hello, World!\\n";\n\n  some more code\n/,
  'Parser extracted the verbatim text';