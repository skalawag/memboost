require 'rails_helper'

describe CardsController do
  describe "GET new" do
    it "should have a new card object" do
      get :new
      expect(assigns(:card)).to be_a(Card)
    end
  end
end
