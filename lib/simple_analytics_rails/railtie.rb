# This is the class which injects our Middleware into Rails apps.
# If `Rails` isn't defined this class isn't included. If you're using other Rack apps you can include the Middleware classes manually.
class SimpleAnalyticsRails::Railtie < Rails::Railtie
  initializer "simple_analytics_rails.configure_rails_initialization" do |app|
    app.config.middleware.insert_after(ActionDispatch::DebugExceptions, SimpleAnalyticsRails::Middleware::JavascriptInjection)
  end
end
