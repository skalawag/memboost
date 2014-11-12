class AddPercentageLearnedColumnToPacks < ActiveRecord::Migration
  def change
    add_column :packs, :percent_learned, :integer, :default => 0
  end
end
