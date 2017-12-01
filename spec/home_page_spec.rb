require 'rails_helper'

feature 'home page' do
  scenario 'welcome message' do
    visit('/')
    expect(page).to have_content('AlloAnim')
  end
end

feature 'animateur profile' do
  scenario 'log in as animateur with valid data' do
    user = FactoryBot.create(:user)
    login_as(user, :scope => :user)
    visit(user_path(user))
    expect(page).to have_content(user.first_name, user.last_name, user.phone_number, user.soi_number, user.circonscription, user.diploma)
  end
end

