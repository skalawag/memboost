class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.timestamps
      t.string :front
      t.string :back
    end
  end
end
