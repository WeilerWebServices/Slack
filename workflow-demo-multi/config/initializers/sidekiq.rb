Sidekiq.configure_server do |config|
  if ! ENV["REDIS_URL"].blank?
    url = URI.parse(ENV["REDIS_URL"])

    if url.password
      config.redis = { password: url.password }
    end
  end
end
