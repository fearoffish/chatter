# -*- coding: utf-8 -*-
$:.unshift("/Library/RubyMotion/lib")
require 'motion/project/template/ios'

require 'motion/project'
require 'formotion'
require 'sugarcube-repl'
require 'cdq'
require 'motion-calabash'

begin
  require 'bundler'
  Bundler.require
rescue LoadError
end

namespace :fearoffish do
  desc 'Create icons'
  task :icons do
    input = 'Icon-1024.png'
    output_dir_path = 'resources/'

    [
      { name: 'Icon-40.png',          size: 40   },
      { name: 'Icon-40@2x.png',       size: 80   },
      { name: 'Icon-60.png',          size: 60   },
      { name: 'Icon-60@2x.png',       size: 120  },
      { name: 'Icon-72.png',          size: 72   },
      { name: 'Icon-72@2x.png',       size: 144  },
      { name: 'Icon-76.png',          size: 76   },
      { name: 'Icon-72@2x.png',       size: 152  },
      { name: 'Icon-Small-50.png',    size: 50   },
      { name: 'Icon-Small-50@2x.png', size: 100  },
      { name: 'Icon-Small.png',       size: 29   },
      { name: 'Icon-Small@2x.png',    size: 58   },
      { name: 'Icon.png',             size: 57   },
      { name: 'Icon@2x.png',          size: 114  },
      { name: 'iTunesArtwork.png',    size: 512  },
      { name: 'iTunesArtwork@2x.png', size: 1024 },

    ].each do |v|
      output = output_dir_path + v[:name]
      command = "convert -resize #{v[:size]} #{input} #{output}"
      puts command
      system command
    end
  end
end


Motion::Project::App.setup do |app|
  # Use `rake config' to see complete project settings.
  app.name = 'chatter'
  app.identifier = 'com.fearoffish.chatter'

  app.device_family = [:iphone, :ipad]

  app.version = "0.0.1-#{`git log -n 1 --pretty=format:'%h'`}"

  app.files = (app.files - Dir.glob('./app/**/*.rb')) + Dir.glob("./lib/**/*.rb") + Dir.glob("./config/**/*.rb") + Dir.glob("./app/**/*.rb")

  app.frameworks += ['CoreGraphics', 'CoreText', 'Security', 'SystemConfiguration']

  app.detect_dependencies = false
  app.files_dependencies 'app/models/event.rb' => 'app/models/person.rb'

  app.prerendered_icon = true
  app.icons = ["Icon-40.png", "Icon-40@2x.png", "Icon-60.png", "Icon-60@2x.png", "Icon-72.png", "Icon-72@2x.png", "Icon-76.png", "Icon-76@2x.png", "Icon-Small-50.png", "Icon-Small-50@2x.png", "Icon-Small.png", "Icon-Small@2x.png", "Icon.png", "Icon@2x.png", "iTunesArtwork.png", "iTunesArtwork@2x.png"]

  app.spec_mode do
    app.redgreen_style = :full
    require 'motion-redgreen'
    require 'guard/test'
    require 'motion-stump'
  end

  if app.hockeyapp?
    app.hockeyapp do
      set :api_token, ENV['HOCKEYAPP_TOKEN']
      set :beta_id, ENV['HOCKEYAPP_BETA_ID']
      set :live_id, ENV['HOCKEYAPP_LIVE_ID']
      set :status, "2"
      set :notify, "0"
      set :notes_type, "1"
    end
    # optional: do other config changes when in hockeyapp mode
    app.provisioning_profile = "/Users/jamievandyke/Library/MobileDevice/Provisioning Profiles/931C6D60-C66E-4CDC-9C43-8D100CE12FE3.mobileprovision"
  end
end
task :"build:simulator" => :"schema:build"
