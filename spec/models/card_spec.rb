require 'rails_helper'

describe Card do
  it { should belong_to :pack }
  it { should validate_presence_of :front }
  it { should validate_presence_of :back }
  it { should validate_numericality_of :attempts }

  context "-- with new Card," do
    before do
      Fabricate(:card)
    end

    let(:card) { Card.first }

    it "learning_stage should always be unfamiliar, familiar or learned" do
      card.learning_stage = "funny"
      expect(card.valid?).to eq(false)
    end

    it "should be valid if learning stage is 'unfamiliar'" do
      card.learning_stage = "unfamiliar"
      expect(card.valid?).to eq(true)
    end

    it "should be valid if learning stage is 'familiar'" do
      card.learning_stage = "familiar"
      expect(card.valid?).to eq(true)
    end

    it "should be valid if learning stage is 'learned'" do
      card.learning_stage = "learned"
      expect(card.valid?).to eq(true)
    end

    it "should have number of attempts >= 0" do
      card.attempts = -1
      expect(card.valid?).to be(false)
    end
  end
end
