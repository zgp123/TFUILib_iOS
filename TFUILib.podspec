Pod::Spec.new do |s|
s.name         = 'TFUILib'
s.version      = '0.1'
s.summary      = 'TFUILib'
s.description  = <<-DESC
                 TFUILib description
                 DESC
s.homepage     = 'https://github.com/loverbabyz/TFUILib_iOS'
s.license      = 'MIT'
s.author       = { "xiayiyong" => "xiayiyong@chexiang.com" }
s.source       = {
                 :git => 'https://github.com/loverbabyz/TFUILib_iOS.git',
                 :tag => s.version,
                 :submodules => true
                 }

s.ios.deployment_target = '7.0'
s.requires_arc = true

s.vendored_frameworks = "TFUILib/Output/*.{framework}"

s.dependency  'MJRefresh', '3.1.0'
s.dependency  'Masonry', '1.0.0'
s.dependency  'SDWebImage', '3.7.5'
s.dependency  'IQKeyboardManager', '3.3.6'
s.dependency  'pop', '1.0.8'
s.dependency  'JHChainableAnimations', '1.3.0'

end