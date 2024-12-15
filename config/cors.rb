Rails.application.config.middleware.insert_before 0, Rack::Cors do
    allow do
      origins 'http://localhost:3001', 'http://localhost:4000', 'http://192.168.72.129:4000', 'http://192.168.72.129' # Frontend origin
      resource '*',
        headers: :any,
        methods: [:get, :post, :put, :patch, :delete, :options, :head]
    end
  end