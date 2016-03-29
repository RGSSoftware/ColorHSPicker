#
# Be sure to run `pod lib lint ColorHSPicker.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "ColorHSPicker"
  s.version          = "0.1.6"
  s.summary          = "An HS color-picker for the iOS."

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!  
  s.description      = <<-DESC
                        reusable, simple color picker for iOS.
                        * Works on iPhone
                        * Works on iPad
                       DESC

  s.homepage         = "https://github.com/RGSSoftware/ColorHSPicker"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "Randel Smith" => "rs@randelsmith.com" }
  s.source           = { :git => "https://github.com/RGSSoftware/ColorHSPicker.git", :tag => s.version.to_s }
  

  s.platform     = :ios, '8.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
  s.resource_bundles = {
    'ColorHSPicker' => ['Pod/Assets/*.{png, jpg}', 'Pod/Assets/Media.xcassets']
  }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
