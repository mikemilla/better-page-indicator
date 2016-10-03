#
# Be sure to run `pod lib lint BetterPagingIndicator.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'BetterPagingIndicator'
  s.version          = '0.1.0'
  s.summary          = 'A better paging indicator based on UIView that allows for IBDesignables'
  s.description      = 'A simple solution to making a more intersting paging indicator that can easily be setup to work with a UICollectionView'

  s.homepage         = 'https://github.com/mikemilla/better-page-indicator'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Michael Miller' => 'mail@mikemilla.com' }
  s.source           = { :git => 'https://github.com/mikemilla/better-page-indicator.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/killamikemilla'

  s.ios.deployment_target = '8.0'

  s.source_files = 'BetterPagingIndicator/Classes/**/*'
  
  # s.resource_bundles = {
  #   'BetterPagingIndicator' => ['BetterPagingIndicator/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
