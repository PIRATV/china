require 'spec_helper'

describe ContactsController, :type => :controller do

  describe 'Send e-mail' do
    it 'should have success message' do
      visit '/contacts'

      fill_in 'contact_name',     with: 'My name'
      fill_in 'contact_email',    with: 'foo@bar.lol'
      fill_in 'contact_message',  with: 'ilovegrapes'
      click_button 'btn'

      expect(page).to have_css('.alert-info')

    end
  end

end
