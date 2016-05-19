require_relative 'acceptance_helper'

feature 'Make new search', %q{
As some user I want to be able to update username} do
  given!(:user) { create(:user, name: 'SomeUser', email: 'some@email.test') }
  given!(:other_user) { create(:user, name: 'SomeOtherUser', email: 'someother@email.test') }
  given!(:one_commit) { create(:commit, user_id: user.id, date: "2015-11-15 19:48:47 UTC",
                               sha: 'someHash', message: 'SomeCommit') }
  given!(:one_more_commit) { create(:commit, user_id: user.id, date: "2015-11-15 19:48:47 UTC", sha: 'oneMoresomeHash',
                                    message: 'oneMoreSomeCommit') }
  given!(:two_commit) { create(:commit, user_id: user.id, date: "2015-11-15 19:48:47 UTC", sha: 'someMoreHash',
                               message: 'SomeMoreCommit') }

  scenario 'User is trying to search change username for commit', js: true do
    visit commits_path
    click_on "edit_link_#{user.id}_0"
    fill_in 'user_name', with: 'NewName'
    click_on 'Apply'
    expect(page).to_not have_content 'SomeUser'
    expect(page).to have_content 'NewName'
    expect(page).to_not have_content 'SomeOtherUser'
  end
end
