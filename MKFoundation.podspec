
Pod::Spec.new do |s|
  s.name         = "MKFoundation"
  s.version      = "0.3.3"
  s.summary      = "Collection of categories for NSFoundation classes to accelerate development."
  s.homepage     = "https://github.com/michalkonturek/MKFoundation"
  s.license      = 'MIT'

  s.author       = { 
    "Michal Konturek" => "michal.konturek@gmail.com" 
  }

  s.ios.deployment_target = '6.0'
  s.osx.deployment_target = '10.7'

  s.source       = {
    :git => "https://github.com/michalkonturek/MKFoundation.git",
    :tag => "0.3.3"
  }

  s.source_files = 'MKFoundation/Source/**/*.{h,m}'
  s.requires_arc = true
end
