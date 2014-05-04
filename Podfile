platform :osx, '10.9'
workspace 'DockerOS'
xcodeproj 'DockerOS.xcodeproj', 'Debug+AdHoc' => :debug

podspec

target :app, :exclusive => true do

  link_with 'DockerOS'
end

target :test, :exclusive => true do
  pod 'RestKit/Testing'

  link_with 'DockerOSTests'
end

# Fix RestKit/Testing Pod after installation
post_install do |installer|
  print "Fixing RestKit/Testing Pod\n"
  system "sed -ie '/RKManagedObjectStore\+RKSearchAdditions/d' ./Pods/RestKit/Code/Testing/RKTestFactory.m"
end
