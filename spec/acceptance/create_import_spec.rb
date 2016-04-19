require_relative 'acceptance_helper'

feature 'Make new import', %q{
As some user I want to be able to  make import form } do

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
    fill_in 'repo', with: 'AVO'
    click_on 'Import'

    expect(current_path).to eq commits_path
    expect(page).to have_content 'Request has successfully completed result is below:'
    expect(page).to have_field 'email'
    expect(page).to have_button 'Search'

    expect(page).to have_content 'Date:'
    expect(page).to have_content 'Name:'
    expect(page).to have_content 'Sha:'
    expect(page).to have_content 'Message:'
    expect(page).to have_content 'Rim-777'
    expect(page).to have_content 'd2ca9be8c1997209e4996575827f4c4949baa37d'
    expect(page).to have_content 'avirbo init commit'
    expect(page).to have_content '34079c48891d6499bbd0e8e9cd6e9a3ff7630f52'
    expect(page).to have_content 'have finished update poster'
  end

end