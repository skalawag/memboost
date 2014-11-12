class AddPercentLearnedColumnToPacks < ActiveRecord::Migration
  def change
    add_column :packs, :percent_learned, :decimal, precision: 2, scale: 1
  end
end
