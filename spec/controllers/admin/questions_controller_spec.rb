require 'rails_helper'

RSpec.describe Admin::QuestionsController, type: :controller do

  let(:user) { FactoryBot.create(:user) }

  let(:valid_attributes) {
    attributes_for(:question,
                   options_attributes: { 0 => attributes_for(:option) },
                   reviews_attributes: { 0 => attributes_for(:review) }
    ).merge(user: user)
  }

  let(:invalid_attributes) {
    { content: nil }
  }

  let(:valid_session) { {} }

  describe 'try to access as a logged user' do
    before { sign_in user }
    it 'does not authorize current user without admin role' do
      get :index
      expect(response).to redirect_to(root_path)
    end

    it 'authorizes current user with admin role' do
      user.admin!
      get :index
      expect(response.status).to eql(200)
    end
  end

  describe 'try to access without logging in' do
    it 'does not authenticate user' do
      get :index
      expect(response).to redirect_to(new_user_session_path)
    end
  end

  describe 'as logged admin user' do
    before do
      sign_in user
      user.admin!
    end

    describe 'GET #index' do
      it 'returns a success response' do
        question = Question.create! valid_attributes
        get :index, params: {}, session: valid_session
        expect(response).to be_success
      end
    end

    describe 'GET #edit' do
      it 'returns a success response' do
        question = Question.create! valid_attributes
        get :edit, params: {id: question.to_param}, session: valid_session
        expect(response).to be_success
      end
    end

    describe 'PUT #update' do
      context 'with valid params' do
        let(:new_attributes) {
          attributes_for(:question)
        }

        it 'updates the requested question' do
          question = Question.create! valid_attributes
          put :update, params: {id: question.to_param, question: new_attributes}, session: valid_session
          question.reload
        end

        it 'redirects to the question' do
          question = Question.create! valid_attributes
          put :update, params: {id: question.to_param, question: valid_attributes}, session: valid_session
          expect(response).to redirect_to(admin_questions_path)
        end
      end
    end
  end
end