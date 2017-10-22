with import <nixpkgs> {};

stdenv.mkDerivation {
  name = "ktikz-0.10";
  
  src = fetchurl {
    url = https://launchpad.net/ubuntu/+archive/primary/+files/ktikz_0.10.orig.tar.gz;
    sha256 = "15lkwcis0labshq9k8c2fqdwv8az2c87qpdqwp5p31s8gb1gqm0h";
  };
  
  nativeBuildInputs = [ poppler_qt4 kdeApplications.kdelibs ];

  buildInputs = [ automoc4 cmake docbook_xml_dtd_412 ilbc ];

  preBuild = "cmake -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix`";

  meta = {
    description = "A small application helping you to create TikZ diagrams (from the LaTeX pgf package)";
    homepage = http://www.hackenberger.at/blog/ktikz-editor-for-the-tikz-language/;
    license = "GPL";
    maintainers = [ stdenv.lib.maintainers.florian ];
  };
}
