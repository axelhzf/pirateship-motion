# -*- coding: utf-8 -*-
$:.unshift("/Library/RubyMotion/lib")
require 'motion/project/template/ios'

begin
  require 'bundler'
  Bundler.require
rescue LoadError
end

Motion::Project::App.setup do |app|
  # Use `rake config' to see complete project settings.
  app.name = 'Pirateship'
  app.identifier = 'com.langproving.timestables'
  app.codesign_certificate = "iPhone Developer: Axel Hernández Ferrera (948XTP75R8)"
  app.provisioning_profile = "/Users/axelhzf/Library/MobileDevice/Provisioning\ Profiles/DD307A34-AEAC-40B6-B86A-8CBC4F1D9BBC.mobileprovision"

  app.pods do
    pod 'SVProgressHUD'
    pod 'SDWebImage'
  end

end
