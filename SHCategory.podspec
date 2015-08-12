Pod::Spec.new do |s|
  s.name         = "SHCategory"
  s.version      = "1.0.1"
  s.summary      = "Some useful categories for iOS"

  s.description  = <<-DESC
                   Some useful categories for iOS,such as NSString Md5 in NSString+Utils.
                   DESC

  s.homepage     = "https://github.com/superhayden/SHCategory"
  # s.screenshots  = "www.example.com/screenshots_1.gif", "www.example.com/screenshots_2.gif"

  s.license      = "MIT"
  s.author       = { "SuperHayden" => "admin@yardlan.com" }
  
  s.platform     = :ios, "5.0"

  s.source       = { :git => "ssh://gitolite@wccios.alpha.wochacha.com:65522/SHCategory.git", :tag => "1.0.1" }

  s.source_files  = "Category/**/*.{h,m}"
  s.public_header_files = "Category/**/*.h"

  s.requires_arc = true

end
