require "active_support/core_ext/integer/time"

Rails.application.configure do
  # コードのリクエスト間での再読み込みを有効にする（開発環境では通常必要）
  config.cache_classes = false

  # 起動時にコードを事前に読み込まない（開発環境では通常必要）
  config.eager_load = false

  # 完全なエラーレポートを表示
  config.consider_all_requests_local = true

  # サーバータイミングを有効にする（開発中のパフォーマンス測定などに使用）
  config.server_timing = true

  # キャッシングを条件付きで有効にする
  if Rails.root.join("tmp/caching-dev.txt").exist?
    config.action_controller.perform_caching = true
    config.action_controller.enable_fragment_cache_logging = true
    config.cache_store = :memory_store
    config.public_file_server.headers = {
      "Cache-Control" => "public, max-age=#{2.days.to_i}"
    }
  else
    config.action_controller.perform_caching = false
    config.cache_store = :null_store
  end

  # アップロードされたファイルをS3に保存
  config.active_storage.service = :local

  # メール送信に関するエラーを無視
  config.action_mailer.raise_delivery_errors = false
  config.action_mailer.perform_caching = false

  # 非推奨警告をログに出力
  config.active_support.deprecation = :log

  # 非推奨のエラーを発生させる
  config.active_support.disallowed_deprecation = :raise

  # 非推奨メッセージを許可する設定（空の場合、全てのメッセージを許可）
  config.active_support.disallowed_deprecation_warnings = []

  # マイグレーションが未実行の状態でページが読み込まれた場合にエラーを発生させる
  config.active_record.migration_error = :page_load

  # データベースクエリをログに表示する（開発中のデバッグ用）
  config.active_record.verbose_query_logs = true

  # アセットリクエストのログ出力を抑制する
  config.assets.quiet = true

  # アセットのデバッグモードを有効にする（開発環境で通常有効）
  config.assets.debug = true

  # アセットのコンパイルを有効にする（開発環境で通常有効）
  config.assets.compile = true

  # プリコンパイルするアセットのリストを指定
  config.assets.precompile += %w( application.js application.css )
end
