class CreateQuests < ActiveRecord::Migration[5.2]
  def change
    create_table :quests do |t|
      t.references :user, foreign_key: true
      t.references :list, foreign_key: true
      t.string :quest_title, null: false
      t.text :quest_detail
      t.integer :quest_status
      t.integer :prize_money
      t.boolean :is_paid
      t.integer :contractor_id
      t.string :contractor_name
      t.integer :rate
      t.date :start_date
      t.date :end_date
      t.timestamps
    end
  end
end
