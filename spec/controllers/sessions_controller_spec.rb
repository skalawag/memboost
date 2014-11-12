require 'rails_helper'

describe SessionsController do
  describe "GET new" do
    it "renders :new" do
      get :new
      expect(response).to render_template :new
    end
  end

  describe "POST create" do
    it "redirects to user_path on successful authentication" do
      user = Fabricate(:user, email: "joe@joe.com", password: "password")
      post :create, {email: "joe@joe.com", password: "password"}
      expect(response).to redirect_to user_path(user)
    end

    it "renders :new if user doesn't exist" do
      post :create, {email: "joe@joe.com", password: "password"}
      expect(response).to render_template :new
    end

    it "renders :new if user exists but auth fails" do
      Fabricate(:user, email: "joe@joe.com", password: "passw")
      post :create, {email: "joe@joe.com", password: "password"}
      expect(response).to render_template :new
    end

  end
end
