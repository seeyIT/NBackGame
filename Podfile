# Uncomment the next line to define a global platform for your project
platform :ios, '14.0'

target 'NBackGame' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!
  pod 'RealmSwift'

  target 'NBackGameTests' do
#    inherit! :search_paths
    # Pods for testing
    use_frameworks!
  end

  target 'NBackGameUITests' do
    # Pods for testing
    use_frameworks!
  end
  
  post_install do |installer|
    installer.pods_project.build_configurations.each do |config|
      config.build_settings["EXCLUDED_ARCHS[sdk=iphonesimulator*]"] = "arm64"
    end
  end

end
