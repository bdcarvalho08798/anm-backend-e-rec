Rails.application.config.middleware.insert_before 0, Rack::Cors do
    allow do
      origins 'http://localhost:3001', 'http://localhost:4000', 'http://192.168.72.129:4000', 'http://192.168.72.129', 'http://192.168.4.128:4000' # Frontend origin
      resource '*',
      headers: :any,
      methods: [:get, :post, :patch, :put, :delete, :options, :head],
      credentials: true
    end
  end