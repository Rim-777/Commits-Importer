class User < ActiveRecord::Base
  validates :name, :email, presence: true
  has_many :commits, dependent: :destroy
end
