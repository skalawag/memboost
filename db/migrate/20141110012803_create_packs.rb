class CreatePacks < ActiveRecord::Migration
  def change
    create_table :packs do |t|
      t.timestamps
      t.string :user_id
      t.string :name
    end
  end
end
