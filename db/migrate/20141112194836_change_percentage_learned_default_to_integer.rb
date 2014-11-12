class ChangePercentageLearnedDefaultToInteger < ActiveRecord::Migration
  def change
    change_column :packs, :percent_learned, :integer, :default => 0
  end
end
