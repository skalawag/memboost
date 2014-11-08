class AddRatingsToCards < ActiveRecord::Migration
  def change
    add_column :cards, :learning_stage, :string
    add_column :cards, :unfamiliar, :integer
    add_column :cards, :familiar, :integer
    add_column :cards, :learned, :integer
  end
end
