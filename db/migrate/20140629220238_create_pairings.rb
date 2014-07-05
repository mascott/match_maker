class CreatePairings < ActiveRecord::Migration
  def change
    create_table :pairings do |t|
      t.belongs_to :period
      t.belongs_to :hosting_user
      t.belongs_to :visiting_user

      t.timestamps
    end
  end
end
