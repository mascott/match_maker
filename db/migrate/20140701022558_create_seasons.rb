class CreateSeasons < ActiveRecord::Migration
  def change
    create_table :seasons do |t|
      t.timestamp :start_date
      t.integer :period_duration

      t.timestamps
    end
  end
end
