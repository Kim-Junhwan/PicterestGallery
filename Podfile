# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'PircterestGallery' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for PircterestGallery
  pod 'RxSwift'
  pod 'RxCocoa'
  pod 'Kingfisher', '~> 7.0'
  pod 'KakaoSDK'
  pod 'GoogleSignIn'
post_install do |installer|
  installer.pods_project.targets.each do |target|
      target.build_configurations.each do |config|
        config.build_settings['BUILD_LIBRARY_FOR_DISTRIBUTION'] = 'YES'
      end
  end
end
end
