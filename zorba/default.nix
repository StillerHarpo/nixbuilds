with import <nixpkgs> {};
let
  version = "3.0";
  libs = stdenv.lib.makeLibraryPath [ glibc ];
in
stdenv.mkDerivation rec {
  name = "zobra-${version}";
  
  src = fetchurl {
    url = "http://launchpad.net/zobra/trunk/3.0/+download/${name}.tar.gz";
    sha256 = "15lkwcis0labshq9k8c2fqdwv8az2c87qpdqwp5p31s8gb1gqm0h";
  };
  
  nativebuildInputs = [ libxml2 libuuid ];
  buildInputs = [ xercesc icu ];

  preConfigure = ''
   PKG_CONFIG_PATH=$PKG_CONFIG_PATH:${libs}
  '';
  
  meta = {
    description = "NoSQL(XQuery/JSONiq) Query Processor written in C++."; 
    homepage = http://www.zorba.io/; 
    license = "APACHE";
    maintainers = [ stdenv.lib.maintainers.florian ];
  };
}
