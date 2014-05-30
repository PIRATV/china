class Portfolio < ActiveRecord::Base
  mount_uploader :image, PortfolioUploader
end
