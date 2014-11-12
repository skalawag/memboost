require 'rails_helper'

describe PacksController do
  describe "GET show" do
    it "sets @pack instance variable" do
      pack = Fabricate(:pack)
      get :show, id: 1
      expect(assigns(:pack).id).to eq(pack.id)
    end

    it "should render show template" do
      Fabricate(:pack)
      get :show, id: 1
      expect(response).to render_template :show
    end
  end

  describe "POST create" do
    it "should redirect to user_path if pack is successfully saved" do
      user = Fabricate(:user)
      session[:user_id] = user.id
      post :create, {pack: {name: "New Pack"}}
      expect(response).to redirect_to user_path(user)
    end

    it "should set flash[:error] if pack fails to save" do
      user = Fabricate(:user)
      session[:user_id] = user.id
      post :create, {pack: {name: nil}}
      expect(flash[:error]).to eq("Something went wrong there. Try again.")
    end
  end
end
