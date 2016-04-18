require_relative 'acceptance_helper'

feature 'Make new search', %q{
As some user I want to be able to make search commit by user-email} do
  given!(:user) { create(:user, name: 'SomeUser', email: 'some@email.test') }
  given!(:other_user) { create(:user, name: 'SomeOtherUser', email: 'someother@email.test') }
  given!(:commit) { create(:commit, user_id: user.id, date: "2015-11-15 19:48:47 UTC",
                           sha: 'someHash', message: 'SomeCommit') }

  before { visit commits_path }

  scenario 'User is trying to search existed commit' do

    fill_in 'email', with: 'some@email.test'
    click_on 'Search'

    expect(page).to have_content 'Date:'
    expect(page).to have_content 'Name:'
    expect(page).to have_content 'Sha:'
    expect(page).to have_content 'Message:'
    expect(page).to have_content 'Action has successfully completed'
    expect(page).to have_content "2015-11-15 19:48:47 UTC"
    expect(page).to have_content 'SomeUser'
    expect(page).to have_content 'someHash'
    expect(page).to have_content 'SomeCommit'
  end

  scenario 'User is trying to search unexisted commit' do

    fill_in 'email', with: 'someother@email.test'
    click_on 'Search'

    expect(page).to have_content 'Date:'
    expect(page).to have_content 'Name:'
    expect(page).to have_content 'Sha:'
    expect(page).to have_content 'Message:'
    expect(page).to have_content 'Action has successfully completed'
    expect(page).to_not have_content "2015-11-15 19:48:47 UTC"
    expect(page).to_not have_content 'SomeUser'
    expect(page).to_not have_content 'someHash'
    expect(page).to_not have_content 'SomeCommit'
  end



end