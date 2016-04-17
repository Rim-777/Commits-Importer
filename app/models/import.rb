class Import
  attr_reader :username, :repo

  def initialize(username, repo)
    @username = username
    @repo = repo
  end

  def import!
    result = JSON.parse(RestClient.get "https://api.github.com/repos/#{username}/#{repo}/commits")
    clear_data!
    create_data(result)
  end


  private

  def create_data(result)
    result.map! do |record|
      user = define_user_by(record)
      create_commit_for!(user, record)
    end
  end

  def define_user_by(record)
    User.find_or_create_by(email: record['commit']['author']['email']) do |user|
      user.name = record['commit']['author']['name']
    end
  end

  def create_commit_for!(user, commit_params)
    user.commits.create(
        sha: commit_params['sha'],
        date: commit_params['commit']['author']['date'],
        message: commit_params['commit']['message']
    )
  end

  def clear_data!
    User.destroy_all
  end

end