class SimplifyCards < ActiveRecord::Migration
  def change
    remove_column :cards, :unfamiliar_count
    remove_column :cards, :familiar_count
    rename_column :cards, :learned_count, :attempts
  end
end
