require "active_support/core_ext/integer/time"

Rails.application.configure do
  # コードがリクエスト間で再読み込みされないようにする
  config.cache_classes = true
  
  # 起動時にコードを事前に読み込む。これにより、スレッドセーフなウェブサーバーがパフォーマンスを向上させる
  config.eager_load = true

  # エラーレポートを完全に無効にし、リクエストに対するキャッシングを有効にする
  config.consider_all_requests_local = false
  config.action_controller.perform_caching = true

  # 静的ファイルを `/public` フォルダから提供するかどうかを設定。環境変数に基づく
  config.public_file_server.enabled = ENV["RAILS_SERVE_STATIC_FILES"].present?

  # アセットのコンパイル時にエラーを出さないように設定。プリコンパイル済みのアセットが利用される
  config.assets.compile = true
  
  # プリコンパイルするアセットのリストを指定
  config.assets.precompile += %w( application.js application.css )
  
  # アセットのダイジェストを有効にし、キャッシュバスティングをサポートする
  config.assets.digest = true
  
  # アセットのデバッグモードを無効にする。これにより、アセットが圧縮される
  config.assets.debug = false

  # アップロードされたファイルをS3に保存
  config.active_storage.service = :amazon

  # ログの出力レベルをデバックに設定
  config.log_level = :debug
  
  # ログにリクエストIDを付加
  config.log_tags = [ :request_id ]
  
  # ログのフォーマットをデフォルトのものに設定
  config.log_formatter = ::Logger::Formatter.new

  # HTTPS のみを許可し、HTTP リクエストを強制的に HTTPS にリダイレクト
  config.force_ssl =  false

  # STDOUT にログを出力するための設定。環境変数に基づく
  if ENV["RAILS_LOG_TO_STDOUT"].present?
    logger           = ActiveSupport::Logger.new(STDOUT)
    logger.formatter = config.log_formatter
    config.logger    = ActiveSupport::TaggedLogging.new(logger)
  end

  # マイグレーション後にスキーマをダンプしない設定
  config.active_record.dump_schema_after_migration = false
  
  # I18nのロケールフォールバックを有効にする
  config.i18n.fallbacks = true
  
  # 非推奨警告のログ出力を無効にする
  config.active_support.report_deprecations = false
end
