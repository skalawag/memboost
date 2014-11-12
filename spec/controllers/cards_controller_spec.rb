require 'rails_helper'

describe CardsController do

  describe "GET new" do
    it "should assign @card to a new card object" do
      Fabricate(:pack)
      get :new, {data: {pack_id: 1}}
      expect(assigns(:card)).to be_a(Card)
    end

    it "should assign @pack to the pack with id params[:data][:pack_id]" do
      3.times { Fabricate(:pack) }
      get :new, {data: {pack_id: 2}}
      expect(assigns(:pack)).to eq(Pack.second)
    end

    it "should render the new card form" do
      Fabricate(:pack)
      get :new, {data: {pack_id: 1}}
      expect(response).to render_template :new
    end
  end

  describe "POST create" do
    it "should have a new card instance assigned to @card" do
      Fabricate(:pack)
      user = Fabricate(:user)
      session[:user_id] = user.id
      post :create, {pack_id: 1, card: {front: "Hello",
                                        back: "World"}}

      expect(assigns(:card)).to be_a(Card)
    end

    it "should redirect to user_path for logged in user if card is valid" do
      Fabricate(:pack)
      user = Fabricate(:user)
      session[:user_id] = user.id
      post :create, {pack_id: 1, card: {front: "Hello",
                                        back: "World"}}
      expect(response).to redirect_to user_path(user.id)
    end

    it "should render :new if something went wrong" do
      Fabricate(:pack)
      user = Fabricate(:user)
      session[:user_id] = user.id
      post :create, {pack_id: 1, card: {front: "Hello"}}
      expect(response).to render_template :new
    end
  end

  describe "GET show" do
    it "should assign a @card given id of card" do
      Fabricate(:card)
      get :show, {id: 1}
      expect(assigns(:card)).to eq(Card.first)
    end

    it "should increment the card's attempts counter" do
      card = Fabricate(:card)
      card_attempts_counter = card.attempts
      get :show, {id: 1}
      expect(Card.first.attempts).to eq(1)
    end

    it "should render template :show" do
      card = Fabricate(:card)
      get :show, {id: 1}
      expect(response).to render_template :show
    end
  end

  describe "GET answer" do
    it "should assign @card to a card instance" do
      card = Fabricate(:card)
      get :answer, {card_id: 1}
      expect(assigns(:card)).to eq(card)
    end

    it "should render template :answer" do
      card = Fabricate(:card)
      get :answer, {card_id: 1}
      expect(response).to render_template :answer
    end
  end

  describe "GET learned" do
    it "should mark the card learned" do
      Fabricate(:card)
      get :learned, {card_id: 1}
      expect(Card.first.learning_stage).to eq('learned')
    end

    it "should render template :learned" do
      card = Fabricate(:card)
      get :learned, {card_id: 1}
      expect(response).to render_template :learned
    end
  end
end
