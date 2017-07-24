require File.expand_path("../../Abstract/abstract-php-phar", __FILE__)

class Drupalconsole < AbstractPhpPhar
  init
  desc "CLI tool for Drupal 8"
  homepage "https://drupalconsole.com/"
  url "https://github.com/hechoendrupal/drupal-console-launcher/releases/download/1.0.0-rc25/drupal.phar"
  sha256 "efffc682778f3526e67e2c4e7330130f4a7ea6fe0da37b2fcf44ef070db4e076"

  bottle do
    cellar :any_skip_relocation
    rebuild 5
    sha256 "8c12377ebdfae6fbac8b9e61dc35117f59cc388a8b7a74a662b45b404b3dda2f" => :sierra
    sha256 "8c12377ebdfae6fbac8b9e61dc35117f59cc388a8b7a74a662b45b404b3dda2f" => :el_capitan
    sha256 "8c12377ebdfae6fbac8b9e61dc35117f59cc388a8b7a74a662b45b404b3dda2f" => :yosemite
  end

  def install
    bin.install "drupal.phar" => "drupal"
  end

  test do
    system "#{bin}/drupal", "--version"
  end
end
