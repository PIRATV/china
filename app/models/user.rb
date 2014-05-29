class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates_presence_of :firm
  validates_uniqueness_of :firm, :site, :email
  has_many :portfolios
  belongs_to :category

  def online?
    updated_at > 10.minutes.ago
  end
end
