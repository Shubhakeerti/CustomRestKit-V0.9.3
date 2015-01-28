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
  s.license      = { :type => "New BDS license", :file => "LICENSE" }
  s.author             = { "Shubhakeerti" => "shubhakeerti.alagundagi@gmail.com" }
  s.platform     = :ios, "6.0"
  s.source       = { :git => "http://github.com/Shubhakeerti/CustomRestKit-V0.9.3.git", :tag => "s.version.to_s" }
  s.source_files  = "*.{h,m}"
  s.requires_arc = true
  # Exclude optional Search and Testing modules
  s.default_subspec = 'Core'

  # Add Core Data to the PCH if the Core Data subspec is imported. This enables conditional compilation to kick in.
  s.prefix_header_contents = <<-EOS
  #if __has_include("CoreData.h")
  #import <CoreData/CoreData.h>
  #endif
  EOS

  # Preserve the layout of headers in the Code directory
  s.header_mappings_dir = 'Code'

  ### Subspecs

  s.subspec 'Core' do |cs|
  cs.dependency 'RestKit/ObjectMapping'
  cs.dependency 'RestKit/Network'
  cs.dependency 'RestKit/CoreData'
  end

  s.subspec 'ObjectMapping' do |os|
  os.source_files   = 'Code/ObjectMapping.h', 'Code/ObjectMapping'
os.dependency       'RestKit/Support'
os.dependency       'RKValueTransformers', '~> 1.1.0'
os.dependency       'ISO8601DateFormatterValueTransformer', '~> 0.6.0'
end

s.subspec 'Network' do |ns|
ns.source_files   = 'Code/Network.h', 'Code/Network'
ns.ios.frameworks = 'CFNetwork', 'Security', 'MobileCoreServices', 'SystemConfiguration'
ns.osx.frameworks = 'CoreServices', 'Security', 'SystemConfiguration'
ns.dependency       'SOCKit'
ns.dependency       'RestKit/ObjectMapping'
ns.dependency       'RestKit/Support'

ns.prefix_header_contents = <<-EOS
#import <Availability.h>
#define _AFNETWORKING_PIN_SSL_CERTIFICATES_
#if __IPHONE_OS_VERSION_MIN_REQUIRED
#import <SystemConfiguration/SystemConfiguration.h>
#import <MobileCoreServices/MobileCoreServices.h>
#import <Security/Security.h>
#else
#import <SystemConfiguration/SystemConfiguration.h>
#import <CoreServices/CoreServices.h>
#import <Security/Security.h>
#endif
EOS
end

s.subspec 'CoreData' do |cdos|
cdos.source_files = 'Code/CoreData.h', 'Code/CoreData'
cdos.frameworks   = 'CoreData'
cdos.dependency 'RestKit/ObjectMapping'
end

s.subspec 'Testing' do |ts|
ts.source_files = 'Code/Testing.h', 'Code/Testing'
ts.dependency 'RestKit/Network'
ts.prefix_header_contents = <<-EOS
#import <Availability.h>
#define _AFNETWORKING_PIN_SSL_CERTIFICATES_
#if __IPHONE_OS_VERSION_MIN_REQUIRED
#import <SystemConfiguration/SystemConfiguration.h>
#import <MobileCoreServices/MobileCoreServices.h>
#import <Security/Security.h>
#else
#import <SystemConfiguration/SystemConfiguration.h>
#import <CoreServices/CoreServices.h>
#import <Security/Security.h>
#endif
EOS
end

s.subspec 'Search' do |ss|
ss.source_files   = 'Code/Search.h', 'Code/Search'
ss.dependency 'RestKit/CoreData'
end

s.subspec 'Support' do |ss|
ss.source_files   = 'Code/RestKit.h', 'Code/Support.h', 'Code/Support', 'Vendor/LibComponentLogging/Core'
ss.dependency 'TransitionKit', '~> 2.1.0'
end

end
