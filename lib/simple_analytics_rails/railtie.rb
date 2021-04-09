class SimpleAnalyticsRails::Railtie < Rails::Railtie
  initializer "simple_analytics_rails.configure_rails_initialization" do |app|
    app.config.middleware.insert_after(ActionDispatch::DebugExceptions, SimpleAnalyticsRails::Middleware::JavascriptInjection)
  end

  rake_tasks do
    # load "tasks/simple_analytics_rails.tasks"
  end
end
