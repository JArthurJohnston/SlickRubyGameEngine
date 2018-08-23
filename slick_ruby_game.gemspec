# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|

  spec.name          = "srge"
  spec.version       = '1.0.1'
  spec.authors       = ["Joe Johnston"]
  spec.email         = ["joe.a.johnston@gmail.com"]
  spec.platform      = 'java'
  spec.summary       = 'A library for creating games using ruby'

  spec.require_paths = ["lib"]
  spec.files         = Dir.glob("{bin,lib}/**/*")
end

# to compile run 'warble compiled jar'
