require 'test_helper'

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  if ENV['CAPYBARA_SERVER_PORT']
    served_by host: 'rails-app', port: ENV['CAPYBARA_SERVER_PORT']

    driven_by :selenium, using: :headless_chrome, screen_size: [1400, 1400], options: {
      browser: :remote,
      url: "http://#{ENV.fetch('SELENIUM_HOST', nil)}:4444"
    }
  else
    driven_by :selenium, using: :headless_chrome, screen_size: [1400, 1400]
  end

  def log_in(user)
    visit new_auth_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: 'password123456'
    click_on 'Log in'
  end
end
