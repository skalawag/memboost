class AddDefaultToPercentLearnedPacks < ActiveRecord::Migration
  def change
    change_column_default :packs, :percent_learned, 0.0
  end
end
