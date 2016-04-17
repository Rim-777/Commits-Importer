class Search

  def search!(email)
    Commit.where(user_id: User.find_by_email(email)).all
  end
end