source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.2.0"

# 最新のRailsを使用する場合: gem "rails", github: "rails/rails", branch: "main"
gem 'rails', '7.2.1'

# Railsの元々のアセットパイプライン [https://github.com/rails/sprockets-rails]
gem "sprockets-rails"

# Active RecordでMySQLを使用する
gem "mysql2", "~> 0.5"

# Pumaウェブサーバーを使用 [https://github.com/puma/puma]
gem 'puma', '~> 6.0'

# JavaScriptをESM import mapsで使用 [https://github.com/rails/importmap-rails]
gem "importmap-rails"

# HotwireによるSPAライクなページ加速 [https://turbo.hotwired.dev]
gem "turbo-rails"

# Hotwireの簡素なJavaScriptフレームワーク [https://stimulus.hotwired.dev]
gem "stimulus-rails"

# JSON APIを簡単に構築 [https://github.com/rails/jbuilder]
gem "jbuilder"

# 本番環境でAction Cableを実行するためにRedisアダプターを使用
# gem "redis", "~> 4.0"

# Redisで高レベルのデータ型を使用するためにKredisを使用 [https://github.com/rails/kredis]
# gem "kredis"

# Active Modelのhas_secure_passwordを使用 [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
# gem "bcrypt", "~> 3.1.7"

# Windowsにはzoneinfoファイルが含まれていないため、tzinfo-data gemをバンドルする
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]

# キャッシュを通じて起動時間を短縮する; config/boot.rbに必要
gem "bootsnap", require: false

# SassでCSSを処理する
gem "sassc-rails"

# Active Storageで画像の変換を行う [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
# gem "image_processing", "~> 1.2"

group :development, :test do
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
  gem 'capistrano'
  gem 'capistrano-rbenv'
  gem 'capistrano-bundler'
  gem 'capistrano-rails'
  gem 'capistrano3-unicorn'
end

group :development do
  # 例外ページでコンソールを使用する [https://github.com/rails/web-console]
  gem "web-console"

  # スピードバッジを追加 [https://github.com/MiniProfiler/rack-mini-profiler]
  # gem "rack-mini-profiler"

  # コマンドの実行を高速化 [https://github.com/rails/spring]
  # gem "spring"
end

group :test do
  # システムテストを使用する [https://guides.rubyonrails.org/testing.html#system-testing]
  gem "capybara"
  gem "webdrivers"
  gem 'selenium-webdriver'
end

group :development do
  gem 'rubocop', require: false
end

group :production do
  gem 'unicorn', '6.1.0'
end

gem 'friendly_id', '~> 5.4'
gem 'bootstrap', '~> 5.2.3'
gem 'jquery-rails'
gem 'active_hash'
gem 'mini_magick'
gem 'image_processing', '~> 1.2'
gem 'aws-sdk-s3'
gem 'httparty'
gem 'dotenv-rails', groups: [:development, :test]