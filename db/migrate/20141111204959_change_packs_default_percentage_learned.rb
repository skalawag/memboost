class ChangePacksDefaultPercentageLearned < ActiveRecord::Migration
  def change
    change_column_default :packs, :percent_learned, 0.1
  end
end
