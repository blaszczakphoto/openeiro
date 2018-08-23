require 'rails_helper'

RSpec.describe UsersController do
  describe 'POST register' do
    context 'users registration succeed' do
      it 'has status 200' do
        params = { user_id: 'UUID_SAMPLE', registration_id: 'TOKEN_SAMPLE' }
        post :register, params: params

        expect(response.status).to eq(201)
      end

      it 'returns no body' do
        params = { user_id: 'UUID_SAMPLE', registration_id: 'TOKEN_SAMPLE' }

        post :register, params: params

        response_body = JSON.parse(response.body)

        expect(response_body['status']).to eq('success')
        expect(response_body['body']).to eq('')
      end
    end

    context 'empty params' do
      it 'returns errors in json body' do
        params = { user_id: nil, registration_id: nil }
        post :register, params: params

        expected_response = {
          status: 'failure',
          body: "Uuid can't be blank. Registration can't be blank"
        }.to_json

        expect(response.body).to eq(expected_response)
      end

      it 'returns 401 status' do
        params = { user_id: nil, registration_id: nil }
        post :register, params: params

        expect(response.status).to eq(401)
      end
    end

    context 'no uuid in params' do
      it 'returns errors in json body' do
        params = { registration_id: 'SAMPLE' }
        post :register, params: params

        expected_response = {
          status: 'failure',
          body: "Uuid can't be blank"
        }.to_json

        expect(response.body).to eq(expected_response)
      end
    end

    context 'user with specified user_id already exist' do
      it 'updates registration_id' do
        existing_user = User.create(uuid: 'UUID_SAMPLE', registration_id: 'TOKEN_SAMPLE')

        params = { user_id: 'UUID_SAMPLE', registration_id: 'NEW_TOKEN_SAMPLE' }

        expect { post :register, params: params }
          .to change { existing_user.reload.registration_id }
          .from('TOKEN_SAMPLE')
          .to('NEW_TOKEN_SAMPLE')
      end

      it 'returns success in response' do
        User.create(uuid: 'UUID_SAMPLE', registration_id: 'TOKEN_SAMPLE')

        params = { user_id: 'UUID_SAMPLE', registration_id: 'NEW_TOKEN_SAMPLE' }
        post :register, params: params

        response_body = JSON.parse(response.body)
        expect(response_body['status']).to eq('success')
      end
    end
  end
end