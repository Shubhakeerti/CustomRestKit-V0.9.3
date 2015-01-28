#
#  Be sure to run `pod spec lint CustomRestKit-V0.9.3.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  s.name         = "CustomRestKit-V0.9.3"
  s.version      = "0.0.1"
  s.summary      = "A short description of CustomRestKit-V0.9.3."
  s.homepage     = "http://github.come/Shubhakeerti/CustomRestKit-V0.9.3"
  s.license      = { :type => "BDS", :file => "LICENSE" }
  s.author             = { "Shubhakeerti" => "shubhakeerti.alagundagi@gmail.com" }
  s.platform     = :ios, "5.0"
  s.source       = { :git => "http://github.com/Shubhakeerti/CustomRestKit-V0.9.3.git", :tag => "0.9.3" }
  s.source_files  = "*.{h,m}"
  s.requires_arc = true
end
