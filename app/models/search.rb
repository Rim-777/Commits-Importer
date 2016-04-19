class Search
  def self.search!(email)
    # Commit.joins(:user).where("users.email = ?", email)
    User.find_by(email: email).commits
  end
end