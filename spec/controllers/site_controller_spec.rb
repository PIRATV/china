require 'spec_helper'

describe SiteController, :type => :controller do

  describe "GET 'index'" do
    it "returns http success" do
      visit root_path
      expect(response).to be_success
    end
  end

end
