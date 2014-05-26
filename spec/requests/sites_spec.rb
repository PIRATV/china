require 'spec_helper'

describe "Sites", :type => :request do
  describe "GET root" do
    it "works! (now write some real specs)" do
      get '/'
      expect(response.status).to be(200)
    end
  end
end
