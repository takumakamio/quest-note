class CreateQuests < ActiveRecord::Migration[5.2]
  def change
    create_table :quests do |t|
      t.integer :user_id, null: false
      t.integer :list_id, null: false
      t.string :quest_title, null: false
      t.text :quest_details
      t.integer :quest_status
      t.integer :prize_money
      t.integer :rate
      t.date :start_date
      t.date :end_date
      t.timestamps
    end
  end
end
