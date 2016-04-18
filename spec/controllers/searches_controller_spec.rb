require 'rails_helper'

RSpec.describe SearchesController, type: :controller do
  describe 'POST #create' do

    let(:user) { create(:user) }
    let(:commits) { create_list(:commit, 2, user: user) }

    before { post :create, email: user.email }

    it 'populates an array of commits' do
      expect(assigns(:commits)).to match_array(commits)
    end

    it 'assigns the requested commits to @commits' do
      expect(assigns(:commits)).to eq commits
    end

    it 'render template view Show' do
      expect(response).to render_template :show
    end

    it 'should not receive search to Search' do
      expect(Search).to receive(:search!).with(user.email)
      post :create, email: user.email
    end
  end

  describe 'GET #show' do
    it 'render show view' do
      get :show, id: Search.new
      expect(response).to render_template :show
    end
  end
end
