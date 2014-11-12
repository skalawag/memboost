class RemovePercentageLearnedColumnFromPacks < ActiveRecord::Migration
  def change
    remove_column :packs, :percent_learned
  end
end
