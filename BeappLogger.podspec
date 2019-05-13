Pod::Spec.new do |s|
  s.name             = 'BeappLogger'
  s.version          = '0.1.1'
  s.summary          = 'This Pod allows you to centralize the logs of your app, and distribute them wherever you want.'

  s.homepage         = 'https://github.com/BeApp/beapp.library.logger.ios.git'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Beapp' => 'dev@beapp.fr' }
  s.source           = { :git => 'https://github.com/BeApp/beapp.library.logger.ios.git', :tag => s.version.to_s }

  s.ios.deployment_target = '9.0'
  s.source_files = 'BeappLogger/Classes/**/*'
  s.swift_version = '5.0'

  s.frameworks = 'Foundation'
end
