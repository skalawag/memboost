require 'rails_helper'

describe CardsController do
  describe "GET new" do
    it "should have a new card object" do
      get :new
      expect(assigns(:card)).to be_a(Card)
    end
  end

  describe "POST create" do
    it "should have a new card instance assigned to @card"
  end

  describe "GET show" do
    it "should assign a @card given id of card"
    it "should increment the card's attempts counter"
  end

  describe "GET answer" do
    it "should have the card whose front was shown to user"
    it "should change the card's learned_status if needed"
  end

  describe "GET learned" do
    it "should have the same card as was marked learned by user"
    it "should mark the card learned"
  end
end
