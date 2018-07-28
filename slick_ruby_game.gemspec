# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "Slick Ruby Game Engine"
  spec.version       = '1.0'
  spec.authors       = ["Joe Johnston"]
  spec.email         = ["joe.a.johnston@gmail.com"]

  spec.files         = ['lib/slick_ruby_game.rb']
  spec.executables   = ['bin/slick_ruby_game']
  spec.test_files    = ['tests/test_slick_ruby_game.rb']
  spec.require_paths = ["lib"]
end
