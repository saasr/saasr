require 'application_system_test_case'

class AuthenticationTest < ApplicationSystemTestCase
  test 'authenticating as an admin' do
    user = create(:admin)

    visit new_auth_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: 'password123456'
    click_on 'Log in'

    assert_text user.name
  end

  test 'authenticating as a non-admin' do
    user = create(:user)

    visit new_auth_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: 'password123456'
    click_on 'Log in'

    assert_text user.name
  end
end
