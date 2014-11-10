require 'rails_helper'

describe PacksController do
  describe "GET show" do
    it "sets @pack instance variable" do
      pack = Fabricate(:pack)
      get :show, id: 1
      expect(assigns(:pack).id).to eq(pack.id)
    end
  end
end
