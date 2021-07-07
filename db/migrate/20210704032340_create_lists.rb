class CreateLists < ActiveRecord::Migration[5.2]
  def change
    create_table :lists do |t|
      t.references :group, foreign_key: true
      t.references :user, foreign_key: true
      t.string :title, null: false
      t.timestamps
    end
  end
end
