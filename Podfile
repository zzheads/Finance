source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '12'
use_frameworks!

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings["ONLY_ACTIVE_ARCH"] = "YES"
    end
  end
end

target 'Finance' do
    pod 'Alamofire'
    pod 'SnapKit'
    pod 'Swinject'
    pod 'Firebase/Analytics'
    pod 'Firebase/Auth'
    pod 'Nuke'
end
