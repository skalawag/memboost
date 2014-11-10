require 'rails_helper'

describe UsersController do
  describe "GET index" do
    it "sets @user to logged in user" do
      user = Fabricate(:user)
      get :index
      expect(assigns(:user)).to eq(user)
    end
  end
end
