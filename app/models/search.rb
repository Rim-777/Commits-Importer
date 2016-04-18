class Search
  def self.search!(email)
    Commit.where(user_id: User.find_by_email(email))
  end
end