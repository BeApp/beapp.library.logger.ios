#
# Be sure to run `pod lib lint BeappLogger.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'BeappLogger'
  s.version          = '0.1.0'
  s.summary          = 'A short description of BeappLogger.'

  s.homepage         = 'https://github.com/BeappXX/BeappLogger'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Beapp' => 'contact@beapp.fr' }
  s.source           = { :git => '../', :tag => s.version.to_s }

  s.ios.deployment_target = '9.0'
  s.source_files = 'BeappLogger/Classes/**/*'
  
  s.frameworks = 'Foundation'
end
