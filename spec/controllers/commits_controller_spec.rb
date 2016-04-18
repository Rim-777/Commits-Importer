require 'rails_helper'

RSpec.describe CommitsController, type: :controller do

  describe 'GET #index' do
    let(:user){create(:user)}
    let(:commits) { create_list(:commit, 2, user: user) }

    before {get :index}

    it 'populates an array of all commits' do
      expect(assigns(:commits)).to match_array(commits)
    end

    it 'render index view' do
      expect(response).to render_template :index
    end
  end
end
