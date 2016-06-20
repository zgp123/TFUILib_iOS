Pod::Spec.new do |s|
s.name         = 'TFUILib_iOS'
s.version      = '0.0.31'
s.summary      = 'TFUILib_iOS'
s.description  = <<-DESC
                 TFUILib description
                 DESC
s.homepage     = 'https://github.com/loverbabyz/TFUILib_iOS'
s.license      = 'MIT'
s.author       = { "xiayiyong" => "xiayiyong@chexiang.com" }
s.source       = {
                 :git => 'https://github.com/loverbabyz/TFUILib_iOS.git',
                 :tag => s.version, :submodules => true
                 }

s.ios.deployment_target = '7.0'
s.requires_arc = true

s.public_header_files = 'TFUILib/TFUILib.h'
s.source_files = 'TFUILib/TFUILib.h'

s.subspec 'Core-3rd' do |ss|
ss.platform = :ios
ss.source_files = 'TFUILib/Classes/Core-3rd/*.{h,m}'
ss.public_header_files = 'TFUILib/Classes/Core-3rd/*.h'
ss.source = {:submodules => true}

  ss.subspec 'TFProgressHudView' do |sss|
  sss.platform = :ios
  sss.source_files = 'TFUILib/Classes/Core-3rd/TFProgressHudView/*.{h,m}'
  sss.public_header_files = 'TFUILib/Classes/Core-3rd/TFProgressHudView/*.h'
  sss.source = {:submodules => true}
  end
end

s.subspec 'Core-Category' do |ss|
ss.platform = :ios
ss.source_files = 'TFUILib/Classes/Core-Category/**/*.{h,m}'
ss.public_header_files = 'TFUILib/Classes/Core-Category/**/*.h'
end

s.subspec 'Core-CustomControl' do |ss|
ss.platform = :ios
ss.source_files = 'TFUILib/Classes/Core-CustomControl/**/*.{h,m}'
ss.public_header_files = 'TFUILib/Classes/Core-CustomControl/**/*.h'
end

s.subspec 'Core-Manager' do |ss|
ss.platform = :ios
ss.source_files = 'TFUILib/Classes/Core-Manager/*.{h,m}'
ss.public_header_files = 'TFUILib/Classes/Core-Manager/*.h'
end

s.subspec 'Core-Model' do |ss|
ss.platform = :ios
ss.source_files = 'TFUILib/Classes/Core-Model/*.{h,m}'
ss.public_header_files = 'TFUILib/Classes/Core-Model/*.h'
end

s.subspec 'Core-View' do |ss|
ss.platform = :ios
ss.source_files = 'TFUILib/Classes/Core-View/**/*.{h,m}'
ss.public_header_files = 'TFUILib/Classes/Core-View/**/*.h'
ss.resources = "TFUILib/Classes/Core-View/**/*.{bundle}"
end

s.subspec 'Core-Util' do |ss|
ss.platform = :ios
ss.source_files = 'TFUILib/Classes/Core-Util/**/*.{h,m}'
ss.public_header_files = 'TFUILib/Classes/Core-Util/**/*.h'
end

s.subspec 'Core-ViewController' do |ss|
ss.platform = :ios
ss.source_files = 'TFUILib/Classes/Core-ViewController/**/*.{h,m}'
ss.public_header_files = 'TFUILib/Classes/Core-ViewController/**/*.h'
ss.resources = "TFUILib/Classes/Core-ViewController/**/*.{bundle}"
end

s.subspec 'Core-ViewModel' do |ss|
ss.platform = :ios
ss.source_files = 'TFUILib/Classes/Core-ViewModel/**/*.{h,m}'
ss.public_header_files = 'TFUILib/Classes/Core-ViewModel/**/*.h'
end

s.dependency  'MJRefresh', '3.1.0'
s.dependency  'Masonry', '1.0.0'
s.dependency  'SDWebImage', '3.7.5'
s.dependency  'IQKeyboardManager', '3.3.6'
s.dependency  'pop', '1.0.8'

end