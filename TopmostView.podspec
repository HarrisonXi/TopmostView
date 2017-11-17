Pod::Spec.new do |s|
  s.name          = "TopmostView"
  s.version       = "1.0.0"
  s.summary       = "Get topmost view for UIWindow. Supports iOS 7-11."
  s.homepage      = "https://github.com/HarrisonXi/TopmostView"
  s.license       = "MIT"
  s.author        = { "HarrisonXi" => "gpra8764@gmail.com" }
  s.platform      = :ios, "7.0"
  s.source        = { :git => "https://github.com/HarrisonXi/TopmostView.git", :tag => "v1.0.0" }
  s.source_files  = "*.{h,m}"
end
