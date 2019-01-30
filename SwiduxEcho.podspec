Pod::Spec.new do |s|
  s.name         = "SwiduxEcho"
  s.version      = "0.2.0"
  s.summary      = "Logger middleware for Swidux."

  s.homepage     = "https://github.com/clmntcrl/swidux-echo"

  s.license      =  { :type => "MIT", :file => "LICENSE" }

  s.author             = { "Clément Cyril" => "cyril@clmntcrl.io" }
  s.social_media_url   = "http://twitter.com/clmntcrl"

  s.swift_version = "4.2"

  s.ios.deployment_target = "10.0"
  s.osx.deployment_target = "10.10"
  s.tvos.deployment_target = "10.0"

  s.source = {
    :git => "https://github.com/clmntcrl/swidux-echo.git",
    :tag => s.version
  }

  s.frameworks = "XCTest"

  s.source_files  = "Sources", "Sources/**/*.swift"

  s.dependency 'Swidux', '~> 1.0.0'
end
