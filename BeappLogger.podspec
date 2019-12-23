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
    s.requires_arc    = true
    s.static_framework = true
    s.default_subspec = 'Log'
    
    s.subspec 'Log' do |log|
        log.source_files = 'BeappLogger/Classes/**/*'
        log.exclude_files = 'BeappLogger/Classes/Crashlytics/*'
    end
    
    s.subspec 'Crashlytics' do |crashlytics|
        crashlytics.xcconfig =
        { 'OTHER_CFLAGS' => '$(inherited) -DKITE_OFFER_CRASHLYTICS' }
        crashlytics.dependency 'Crashlytics', '3.14.0'
        crashlytics.dependency 'Firebase/Analytics'
        crashlytics.source_files = 'BeappLogger/Classes/Crashlytics/*'
    end
end
