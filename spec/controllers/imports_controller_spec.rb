require 'rails_helper'

RSpec.describe ImportsController, type: :controller do


  describe 'Get #new' do
      it 'render  template view new' do
        get :new
        expect(response).to render_template :new
      end
  end

  describe 'POST #create' do
      it 'redirect to template view Index' do
        post :create, username: 'Rim-777', repo: 'AVO'
        expect(response).to redirect_to commits_path
    end
  end
end
