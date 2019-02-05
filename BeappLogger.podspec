Pod::Spec.new do |s|
  s.name             = 'BeappLogger'
  s.version          = '0.1.0'
  s.summary          = 'A short description of BeappLogger.'

  s.homepage         = 'https://bitbucket.org/beappers/beapp.logger.ios'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Beapp' => 'contact@beapp.fr' }
  s.source           = { :git => 'https://bitbucket.org/beappers/beapp.logger.ios.git', :tag => s.version.to_s }

  s.ios.deployment_target = '9.0'
  s.source_files = 'BeappLogger/Classes/**/*'
  
  s.frameworks = 'Foundation'
end
