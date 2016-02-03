Pod::Spec.new do |s|
  s.name         = "SHCategory"
  s.version      = "0.1.0"
  s.summary      = "Some useful categories for iOS"
  s.description  = <<-DESC
                   Some useful categories for iOS,such as NSString Md5 in NSString+Utils.
                   DESC
  s.homepage     = "https://github.com/superhayden/SHCategory"
  s.license      = "MIT"
  s.author       = { "SuperHayden" => "admin@yardlan.com" }
  s.platform     = :ios, "7.0"
  s.source       = { :git => "https://github.com/superhayden/SHCategory.git", :tag => s.version }
  s.source_files  = "Category/**/*.{h,m}"
  s.public_header_files = "Category/**/*.h"
  s.requires_arc = true
end
