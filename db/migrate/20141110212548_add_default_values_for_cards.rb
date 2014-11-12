class AddDefaultValuesForCards < ActiveRecord::Migration
  def change
    change_column_default :cards, :learning_stage, 'unfamiliar'
    change_column_default :cards, :attempts, 0
  end
end
