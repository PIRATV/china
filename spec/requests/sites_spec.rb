require 'spec_helper'

describe "Sites", :type => :request do
  describe "GET root" do
    it "works! (now write some real specs)" do
      get '/'
      expect(response.status).to be(200)
    end
  end
  describe 'GET organizations' do
    it 'should have "Not found"' do
      visit '/organizations/2'
      expect(page).to have_text('не найдено..')
    end
  end
end
