# This lets us use a Node-like .env syntax to get our variables.
# This is also maybe the only thing I enjoy about writing Node.
require 'dotenv/load'

Rails.application.configure do
  config.cache_classes = false
  config.eager_load = false
  config.consider_all_requests_local = true

  if Rails.root.join('tmp/caching-dev.txt').exist?
    config.action_controller.perform_caching = true

    config.cache_store = :memory_store
    config.public_file_server.headers = {
      'Cache-Control' => "public, max-age=#{2.days.seconds.to_i}"
    }
  else
    config.action_controller.perform_caching = false
    config.cache_store = :null_store
  end

  config.action_mailer.raise_delivery_errors = false
  config.action_mailer.perform_caching = false

  config.active_support.deprecation = :log
  config.active_record.migration_error = :page_load

  config.assets.debug = true
  config.assets.quiet = true

  config.file_watcher = ActiveSupport::EventedFileUpdateChecker
end
