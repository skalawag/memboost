class RemoveUserIdFromCardAndAddPackId < ActiveRecord::Migration
  def change
    rename_column :cards, :user_id, :pack_id
  end
end
