class Search
  def self.search!(email)
    # Commit.joins(:user).where("users.email = ?", email)
    User.find_by(email: params[:email]).commits
  end
end