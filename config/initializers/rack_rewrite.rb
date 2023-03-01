if ENV['RACK_ENV'] == 'production'
  Karoyaka::Application.config.middleware.insert_before(Rack::Runtime, Rack::Rewrite) do
    r301 %r{.*}, 'https://karoyaka.site$&', :if => Proc.new {|rack_env|
      rack_env['SERVER_NAME'] != 'karoyaka.site'
    }
  end
end