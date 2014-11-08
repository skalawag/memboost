class ChangeCardTableColumnNames < ActiveRecord::Migration
  def change
    rename_column :cards, :unfamiliar, :unfamiliar_count
    rename_column :cards, :familiar, :familiar_count
    rename_column :cards, :learned, :learned_count
  end
end
