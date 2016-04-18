require 'rails_helper'

RSpec.describe ImportsController, type: :controller do

  describe 'Get #new' do
      it 'render  template view new' do
        get :new
        expect(response).to render_template :new
      end
  end

  describe 'POST #create' do
    it 'it change number of commots in database' do
      expect { post :create, username: 'Rim-777', repo: 'AVO'}.to change(User, :count).by(1)
    end

    it 'it change number of commots in database' do
      expect { post :create, username: 'Rim-777', repo: 'AVO'}.to change(Commit, :count).by(18)
    end

    it 'redirect to template view Index' do
      post :create, username: 'Rim-777', repo: 'AVO'
      expect(response).to redirect_to commits_path
    end
  end
end
