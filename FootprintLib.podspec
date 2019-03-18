#
# Be sure to run `pod lib lint FootprintLib.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'FootprintLib'
  s.version          = '0.1.4'
  s.summary          = 'A FootprintLib to use'

  s.description      = <<-DESC
                     fuck test a FootprintLib
                       DESC

  s.homepage         = 'https://github.com/dgyiOS/FootprintLib'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'dgyiOS' => 'dengguangyang@mxtrip.cn' }
  s.source           = { :git => 'https://github.com/dgyiOS/FootprintLib.git', :tag => s.version.to_s }

  s.ios.deployment_target = '8.0'

  s.source_files = 'FootprintLib/Classes/**/*'
  
  s.resource_bundles = {
     'FootprintLib' => ['FootprintLib/Assets/*.png']
  }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit'
  s.dependency 'Masonry'
end
