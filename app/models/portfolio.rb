class Portfolio < ActiveRecord::Base
  mount_uploader :image, PortfolioUploader
  belongs_to :user
end
