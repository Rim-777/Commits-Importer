require 'rails_helper'

RSpec.describe CommitsController, type: :controller do

  describe 'GET #index' do
    let(:user) { create(:user) }
    let(:commits) { create_list(:commit, 2, user: user) }
    let(:other_user) { create(:user) }
    let(:other_user_commits) { create_list(:commit, 2, user: other_user) }
    describe 'simple index ' do

      before { get :index }

      it 'populates an array of all commits' do
        expect(assigns(:commits)).to match_array(commits)
      end

      it 'render index view' do
        expect(response).to render_template :index
      end

    end

    describe 'search index ' do

      before{ get :index, email: other_user.email}

      it 'should  receive find_by_email for User' do
        expect(User).to receive(:find_by).with(email: user.email)
        get :index, email: user.email
      end

      it 'assigns only user commits to @commits if email is given in params' do
        expect(assigns(:commits)).to match_array(other_user_commits)
      end

      it 'render index view' do
        expect(response).to render_template :index
      end
    end

  end
end
