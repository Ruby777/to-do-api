require 'rails_helper'

RSpec.describe UsersController, type: :controller do
    let(:new_user_attributes) do
        {
            username: "janedoe@example.com",
            password: "helloworld"
        }
    end

    describe "Get new" do
        it "returns http success" do
            get :new
            expect(response).to have_http_status(:success)
        end

        it "instantiates a new user" do
            get :new
            expect(assigns(:user)).to_not be_nil
        end
    end

    describe "POST create" do
        it "returns an http redirect" do
            post :create, params: { user: new_user_attributes }
            expect(response).to have_http_status(:redirect)
        end

        it "creates a new user" do
            expect{
                post :create, params: { user: new_user_attributes }
        }.to change(User, :count).by(1)
        end

        it "sets username properly" do
            post :create, params: { user: new_user_attributes }
            expect(assigns(:user).email).to eq new_user_attributes[:email]
        end

        it "sets user password properly" do
            post :create, params: { user: new_user_attributes }
            expect(assigns(:user).password).to eq new_user_attributes[:password]
        end

        it "logs the user in after sign up" do
            post :create, params: { user: new_user_attributes }
            expect(session[:user_id]).to eq assigns(:user).user_id
        end
    end

    describes "not signed in" do
        let(:factory_user){ create(:user) }

        before do
            post :create, params: { user: new_user_attributes }
        end

        it "returns http success" do
            get :show, params: { id: factory_user.id }
            expect(response).to have_http_status(:success)
        end

        it "assigns factory_user to user" do
            get :show, params: { id: factory_user.id }
            expect(assigns(:user)).to eq(factory_user)
        end
    end
end
