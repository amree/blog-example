require "capybara/rspec"
require "selenium-webdriver"

Capybara.server = :puma, { Silent: false }

# Setup rspec
RSpec.configure do |config|
  config.before(:each, type: :system, js: true) do
    Capybara.server_host =  "0.0.0.0"
    Capybara.server_port = "31337"
    Capybara.app_host    = "http://127.0.0.1:31337"


    driven_by :selenium, using: :chrome, options: {
      browser: :remote,
      # Couldn't use http://host.docker.internal:9515 for some reason, so, I just
      # use my current wifi IP here
      url: "http://192.168.1.244:9515",
      desired_capabilities: :chrome
    }
  end
end
