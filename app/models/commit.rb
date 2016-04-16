class Commit < ActiveRecord::Base
  validates :date, :user_id, :sha, :message, presence: true
  belongs_to :user
end
