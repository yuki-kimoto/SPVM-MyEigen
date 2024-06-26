use 5.032001;
use ExtUtils::MakeMaker;
# See lib/ExtUtils/MakeMaker.pm for details of how to influence
# the contents of the Makefile that is written.
WriteMakefile(
    NAME              => 'SPVM::MyEigen',
    VERSION_FROM      => 'lib/SPVM/MyEigen.pm', # finds $VERSION, requires EU::MM from perl >= 5.5
    PREREQ_PM         => {}, # e.g., Module::Name => 1.1
    ABSTRACT_FROM     => 'lib/SPVM/MyEigen.pm', # retrieve abstract from module
    AUTHOR            => 'Yuki Kimoto <kimoto.yuki@gmail.com>',
    clean => {FILES => ".spvm_build"},
);
sub MY::postamble {
  
  use SPVM::Builder::Util::API;
  
  my $make_rule = "";
  
  # Native compile make rule
  $make_rule .= SPVM::Builder::Util::API::create_make_rule_native("MyEigen");

  return $make_rule;
}
