class CreatePeriods < ActiveRecord::Migration
  def change
    create_table :periods do |t|
      t.integer :duration
      t.timestamp :start_date
      t.integer :season_id

      t.timestamps
    end
  end
end
