require 'spec_helper'

describe 'Devises', :type => :request do
  describe 'Register' do
    it 'should have successfully register' do
      visit '/user/register'
      fill_in 'user_firm', with: 'My firm'
      fill_in 'user_phone', with: ''
      fill_in 'user_site', with: ''
      fill_in 'user_email', with: 'foo@bar.lol'
      fill_in 'user_password', with: 'My pass'
      fill_in 'user_password_confirmation', with: 'My pass'
      have_checked_field('input')
      click_button 'btn'
      puts page.html
      expect(page).not_to have_css('#error_explanation')
      expect(page).not_to have_content('translation missing')
      expect(page).to have_css('.alert-info')
    end
  end
end
