require 'rails_helper'

describe Card do
  it { should belong_to :pack }
  it { should validate_presence_of :front }
  it { should validate_uniqueness_of :front }
  it { should validate_presence_of :back }
  it { should validate_numericality_of :attempts }

  it "should validate format of learning_stage" do
    card = Card.create(front: "H", back: "B", attempts: 0, learning_stage: "")
    expect(card.valid?).to eq(false)
  end

  it "learning_stage should always be unfamiliar, familiar or learned" do
    card = Fabricate(:card)
    card.learning_stage = "funny"
    expect(card.valid?).to eq(false)
  end

  it "should have number of attempts >= 0" do
    card = Fabricate(:card)
    card.attempts = -1
    expect(card.valid?).to be(false)
  end
end
