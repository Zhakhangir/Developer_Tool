Pod::Spec.new do |s|
  s.name             = 'DeveloperTool'
  s.version          = '0.1.0'
  s.summary          = 'UI tools'
  s.description      = 'Developer Tool for Berekebank BBusiness'
  s.homepage         = 'https://sbtatlas.sigma.sbrf.ru/stash/scm/sbi_sbol_ios/sbiuikit.git'
  s.license          = { :type => 'MIT' }
  s.author           = { 'Таиров Жахангир Захирович' => 'Zhakhangir.Tairov@berekebank.kz' }
  s.source           = { :git => 'https://github.com/Zhakhangir/Developer_Tool.git', :tag => s.version.to_s }
  s.ios.deployment_target = '12.0'

  s.source_files = 'SbiUIKit/Core/**/*.{swift,h,m}'
  s.dependency 'SbiLogger'

end