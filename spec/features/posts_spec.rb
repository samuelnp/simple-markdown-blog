require 'spec_helper'

feature "Manage posts" do

  before { FactoryGirl.create(:user) }

  scenario "GET root" do
    visit root_path
    sign_in_with('user@example.com', 'example.password')
    expect(page).to have_content('Logout')
  end

  scenario "New post" do
    visit root_path
    sign_in_with('user@example.com', 'example.password')
    visit new_post_path
    fill_in 'post[title]', with: "Example Title for Post"
    fill_in 'post[body]', with: "Description for post"
    fill_in 'post[tag_list]', with: "example"
    click_button "Save"
    expect(page).to have_content('Example Title for Post')
  end

  def sign_in_with(email, password)
    visit user_session_path
    fill_in 'user[email]', with: email
    fill_in 'user[password]', with: password
    click_button 'Login'
  end
end