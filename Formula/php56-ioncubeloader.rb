require File.expand_path("../../Abstract/abstract-php-extension", __FILE__)

class Php56Ioncubeloader < AbstractPhp56Extension
  init
  desc "Loader for ionCube Secured Files"
  homepage "http://www.ioncube.com/loaders.php"
  url "http://downloads3.ioncube.com/loader_downloads/ioncube_loaders_dar_x86-64.tar.gz"
  sha256 "1c9b17a4750578299277cc69631769ecc63708da0b12253cb333434add10332a"
  version "6.0.9"

  bottle do
    cellar :any_skip_relocation
    sha256 "894b6c361c9ff84bb0008c2a93dee28e39ee96642c81fdbaf8e060e79ddf023b" => :sierra
    sha256 "894b6c361c9ff84bb0008c2a93dee28e39ee96642c81fdbaf8e060e79ddf023b" => :el_capitan
    sha256 "6b742bba0f283636f16914e00e2bb2756158a4ca5e71824794f657f75d0daf56" => :yosemite
  end

  def extension_type
    "zend_extension"
  end

  def install
    prefix.install "ioncube_loader_dar_5.6.so" => "ioncubeloader.so"
    write_config_file if build.with? "config-file"
  end

  test do
    shell_output("php -m").include?("ionCube")
  end
end
