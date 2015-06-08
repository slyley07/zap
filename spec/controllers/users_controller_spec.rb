require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let(:valid_session) { {user_id: 1} }
  let(:user) { FactoryGirl.create(:user) }
  
  describe 'GET #new' do
    it 'assignes a new user as @user' do
      get :new, {}, valid_session
      expect(assigns(:user)).to be_a_new(User)
    end
  end

  describe 'GET #show' do
    it 'assigns requested user as @user' do
      get :show, {id: user.to_param}, valid_session
      expect(assigns(:user)).to eq(user)
    end
  end

  describe 'GET #edit' do
    it 'assigns current_user as @user' do
      get :edit, {id: user.to_param}, valid_session
      expect(assigns(:user)).to eq(user)
    end
  end

  describe 'POST create' do
    context 'with valid params' do
      it 'creates a new User' do
        expect {
          post :create, {user: attributes_for(:user)}, valid_session
        }.to change(User, :count).by(1)
      end

      it 'assigns a newly created user as @user' do
        post :create, {user: attributes_for(:user)}, valid_session
        expect(assigns(:user)).to be_a(User)
        expect(assigns(:user)).to be_persisted
      end

      it 'redirects the created user' do
        post :create, {user: attributes_for(:user)}, valid_session
        expect(response).to redirect_to(User.last)
      end
    end

    context 'with invalid params' do
      # let(:invalid_attrs) { FactoryGirl.create(:user, email: nil, password_confirmation: nil) }
      it 'assigns a newly created but unsaved user as @user' do
        post :create, {user: attributes_for(:user, password: nil)}, valid_session
        expect(assigns(:user)).to be_a_new(User)
      end

      it 're-renders the "new" template' do
        post :create, {user: attributes_for(:user, name: nil, password_confirmation: nil)}, valid_session
        expect(response).to render_template :new
      end
    end
  end

  describe 'PUT update' do
    context 'with valid params' do
      # let(:new_attrs) { FactoryGirl.attributes_for(:user, fname: "Tom") }
      it 'assigns the requested user as @user' do
        put :update, {id: user.to_param, user: attributes_for(:user, email: 'tom@gmail.com')}, valid_session
        expect(assigns(:user)).to eq(user)
      end

      it 'updates the requested dog' do
        put :update, {id: user.to_param, user: attributes_for(:user, email: 'tom@gmail.com')}, valid_session
        user.reload
        expect(user.email).to eq('tom@gmail.com')
      end
    end

    context 'with invalid params' do
      it 'assigns the user as @user' do
        put :update, {id: user.to_param, user: attributes_for(:user, email: nil)}, valid_session
        expect(assigns(:user)).to eq(user)
      end
      
      it 're-renders the "edit" template' do
        put :update, {id: user.to_param, user: attributes_for(:user, email: nil)}, valid_session
        expect(response).to render_template :edit
      end
    end
  end

  describe 'DELETE destroy' do
    it 'destorys the requested user' do
      user
      expect {
        delete :destroy, {id: user.to_param}, valid_session
      }.to change(User, :count).by(-1)
    end

    it 'redirects to the user list' do
      delete :destroy, {id: user.to_param}, valid_session
      expect(response).to redirect_to(root_path)
    end
  end

  describe 'FOLLOW someone' do
    context 'valid relationship' do
      it 'creates a relationship with the current_user and target user id' do
        post :follow, {id: user.to_param}, valid_session
      end
    end
  end

end
