require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  let!(:user){create(:user)}

  describe 'PATCH #update' do
    context 'User is trying to update username' do
      it 'assigns the requested user to @user' do
        patch :update,  id: user, user: attributes_for(:user), format: :js
        expect(assigns(:user)).to eq user
      end

      it 'change username body' do
        patch :update,  id: user, user: {name: 'NewName'}, format: :js
        user.reload
        expect(user.name).to eq 'NewName'
      end
    end
  end
end
