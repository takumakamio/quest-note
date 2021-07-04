class CreateRecords < ActiveRecord::Migration[5.2]
  def change
    create_table :records do |t|
      t.references :quest, foreign_key: true
      t.integer :total_prize_maoney, null: false
      t.integer :total_quest, null: false
      t.integer :average_rate, null: false
      
      t.timestamps
    end
  end
end
