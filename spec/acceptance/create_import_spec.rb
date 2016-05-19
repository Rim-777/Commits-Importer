require_relative 'acceptance_helper'

feature 'Make new import', %q{
As some user I want to be able to make import form } do
  before { visit root_path}

  scenario 'User is trying to  browse import form' do
    expect(current_path).to eq root_path
    expect(page).to have_content 'Deer'
    within '.border-form-div' do
      expect(page).to have_content 'Commits'
      expect(page).to have_field 'username'
      expect(page).to have_field 'repo'
      expect(page).to have_button 'Import'
    end
  end

  scenario 'User is trying to make import with correct data' do
    fill_in 'username', with: 'Rim-777'
    fill_in 'repo', with: 'AskmeHow'
    click_on 'Import'
    expect(current_path).to eq commits_path
    expect(page).to have_content 'Request has successfully completed result is below:'
    expect(page).to have_field 'email'
    expect(page).to have_button 'Search'
    expect(page).to have_content 'Date:'
    expect(page).to have_content 'Name:'
    expect(page).to have_content 'Sha:'
    expect(page).to have_content 'Message:'
    expect(page).to have_content 'javatimomoss@gmail.com'
    expect(page).to have_content '8cf68754ba78aa11f3d1f745caf2c2edb6360766'
    expect(page).to have_content 'Initial commit'
    expect(page).to have_content 'c3f216971bac07b5a40c8369b841b67cf362d928'
    expect(page).to have_content 'Fix'
    expect(page).to have_content '1 2 3 4 5 … Next › Last »'
  end

  scenario 'User is trying to make import with invalid data' do
    fill_in 'username', with: 'Rim-777'
    fill_in 'repo', with: 'SomeWrongRepositoryName'
    click_on 'Import'
    expect(page).to have_content 'Wrong Name or Repository'
  end
end
