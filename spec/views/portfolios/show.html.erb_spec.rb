require 'spec_helper'

describe "portfolios/show", :type => :view do
  before(:each) do
    @portfolio = assign(:portfolio, Portfolio.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
