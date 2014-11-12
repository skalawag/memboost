require 'rails_helper'

describe UsersController do
  describe "GET new" do
    it "should assign instance var @user to a new user instance" do
      get :new
      expect(assigns(:user)).to be_a(User)
    end

    it "should render template :new" do
      get :new
      expect(response).to render_template :new
    end
  end

  describe "GET create" do
    it "should assign @user from user_params" do
      post :create, {user:
                       {username: "Mark",
                        email: "blah@blah.com",
                        password: "password"}}
      expect(assigns(:user)).to eq(User.first)
    end

    it "should redirect to user_path for new user when user is valid" do
      post :create, {user:
                       {username: "Mark",
                        email: "blah@blah.com",
                        password: "password"}}
      expect(response).to redirect_to user_path(User.first)
    end

    it "should render new if user creation failed validation" do
      post :create, {user: {username: "Mark", email: "blah@blah.com"}}
      expect(response).to render_template :new
    end
  end

  describe "GET show" do
    it "should set @user to logged in user" do
      user = Fabricate(:user)
      session[:user_id] = user.id
      get :show, id: 1
      expect(assigns(:user)).to eq(user)
    end

    it "should render template :show" do
      user = Fabricate(:user)
      session[:user_id] = user.id
      get :show, id: 1
      expect(response).to render_template :show
    end

    it "should update user progress to 50.0 if user has learned a card" do
      user = Fabricate(:user)
      session[:user_id] = user.id
      new_pack = Fabricate(:pack)
      2.times { new_pack.cards << Fabricate(:card) }
      user.packs << new_pack
      Card.first.update!(learning_stage: 'learned')
      get :show, id: user.id
      expect(Pack.first.percent_learned).to eq(50.0)
    end

    it "should not change user progress if user has no cards" do
      user = Fabricate(:user)
      session[:user_id] = user.id
      new_pack = Fabricate(:pack)
      user.packs << new_pack
      get :show, id: user.id
      expect(Pack.first.percent_learned).to eq(0)
    end
  end
end
