Pod::Spec.new do |s|

  s.name         = "DockerOS"
  s.version      = "0.0.1"
  s.summary      = "A short description of DockerOS."
  s.homepage     = "https://github.com/dzwicker/DockerOS"
  s.license      = { 
    :type => "Apache License, Version 2.0",
    :file => "LICENSE"
  }
  s.author       = { 
    "Daniel Zwicker" => "email@daniel-zwicker.de"
  }
  s.source       = { 
    :git => "https://github.com/dzwicker/DockerOS.git",
    :tag => s.version.to_s
  }
  s.platform     = :osx, '10.9'
  # s.ios.deployment_target = '5.0'
  s.osx.deployment_target = '10.9'

  s.source_files = 'Classes'
  s.resources = 'Assets/*.png'

  s.ios.exclude_files = 'Classes/osx'
  s.osx.exclude_files = 'Classes/ios'
  # s.public_header_files = 'Classes/**/*.h'
  
  s.requires_arc = true

  s.dependency "CocoaLumberjack", "~> 1.8.1"
  s.dependency "RestKit", "~> 0.23.1"

end
