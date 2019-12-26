Pod::Spec.new do |s|

# 1
s.platform = :ios
s.ios.deployment_target = '12.0'
s.name = "MessagingApp"
s.summary = "MessagingApp lets you add messaging support for your app."
s.requires_arc = true

# 2
s.version = "0.1.0"

# 3
s.license = { :type => "MIT", :file => "LICENSE" }

# 4 - Replace with your name and e-mail address
s.author = { "Hector Alvarado" => "hectoraklvaradochapa@gmail.com" }

# 5 - Replace this URL with your own GitHub page's URL (from the address bar)
s.homepage = "https://github.com/Pepiiux/Messaging"

# 6 - Replace this URL with your own Git URL from "Quick Setup"
s.source = { :git => "https://github.com/Pepiiux/Messaging.git",
             :tag => "#{s.version}" }

# 7
s.static_framework = true
s.framework = 'Foundation'
s.dependency 'Firebase/Database'
s.dependency 'Firebase/Auth'

# 8
s.source_files = "HTMessaging/**/*.{h,m,swift}"

# 9
#s.resources = "HTMessaging/**/*.{png,jpeg,jpg,storyboard,xib,xcassets}"

# 10
s.swift_version = "5"

end
