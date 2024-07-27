require_relative 'boot'

require 'rails/all'
# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module SUQApp
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0

    # lib ディレクトリを autoload_path に追加
    config.autoload_paths << Rails.root.join('lib')

    # Other configuration settings can go here
    # config.active_storage.variant_processor = :mini_magick
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
  end
end

