#
# Be sure to run `pod lib lint JasonetteDemoAction.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'JasonetteDemoAction'
  s.version          = '0.1.5'
  s.summary          = 'A example action plug-in for Jasonette.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
This is an example plugin for the Jasonette iOS app framework.
See http://jasonette.com/
                       DESC

  s.homepage         = 'https://github.com/seletz/JasonetteDemoAction'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Stefan Eletzhofer' => 'se@nexiles.de' }
  s.source           = { :git => 'https://github.com/seletz/JasonetteDemoAction.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/seletz'

  s.ios.deployment_target = '8.0'

  s.source_files = 'JasonetteDemoAction/Classes/**/*'
  
  # s.resource_bundles = {
  #   'JasonetteDemoAction' => ['JasonetteDemoAction/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
