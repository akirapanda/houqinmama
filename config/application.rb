require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(:default, Rails.env)

module Houqinmama
  class Application < Rails::Application
        config.to_prepare do
      # Load application's model / class decorators
      Dir.glob(File.join(File.dirname(__FILE__), "../app/**/*_decorator*.rb")) do |c|
        Rails.configuration.cache_classes ? require(c) : load(c)
      end
    end


    config.autoload_paths += %W(#{config.root}/lib)

    config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    config.i18n.default_locale = :"zh-CN"
    config.time_zone = 'Beijing'
    config.active_record.default_timezone = :local
    config.assets.precompile += %w(mobile.css mobile.js admin.css admin.js shop.js shop.css)    
  end
end
