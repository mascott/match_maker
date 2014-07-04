class CreateParings < ActiveRecord::Migration
  def change
    create_table :parings do |t|
      t.integer :period_id

      t.timestamps
    end
  end
end
