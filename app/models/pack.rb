class Pack < ActiveRecord::Base
  belongs_to :user
  has_many :cards
  validates_presence_of :name

  def unlearned_cards
    self.cards.map.select { |c| c if c.learning_stage != "learned" }
  end
end
