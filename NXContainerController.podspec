Pod::Spec.new do |s|

s.name          = 'NXContainerController'
s.version       = '0.2.0'
s.summary       = 'A custom ContainerController has present and dismiss animation'
s.homepage      = 'https://github.com/qufeng33/NXContainerController'
s.license       = 'MIT'
s.author        = { 'nightx' => 'qufeng33@hotmail.com' }
s.source        = { :git => 'https://github.com/qufeng33/NXContainerController.git', :tag => s.version.to_s }
s.frameworks    = 'UIKit', 'Foundation'
s.source_files  = 'NXContainerController/*.{h,m}'
s.platform      = :ios, '8.0'
s.requires_arc  = true

end