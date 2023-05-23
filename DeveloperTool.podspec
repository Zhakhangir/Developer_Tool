Pod::Spec.new do |s|
  s.name             = 'DeveloperTool'
  s.version          = '0.4.0'
  s.summary          = 'UI tools'
  s.description      = 'Developer Tool for Berekebank BBusiness'
  s.homepage         = 'https://github.com/Zhakhangir'
  s.license          = { :type => 'MIT' }
  s.author           = { 'Таиров Жахангир Захирович' => 'Zhakhangir.Tairov@berekebank.kz' }
  s.source           = { :git => 'https://github.com/Zhakhangir/Developer_Tool.git', :tag => s.version.to_s }
  s.swift_versions   = '5.0'
  s.ios.deployment_target = '12.0'
  
  s.source_files = 'DeveloperTool/**/*.{swift,h,m}'
end