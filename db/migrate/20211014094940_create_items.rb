class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name
      t.text :introduction
      t.integer :price
      t.boolean :is_active, default: TRUE
      t.datetime :created_at, default: now
      t.datetime :updated_at, default: now
      t.integer :genre_id
      t.string :image_id

      t.timestamps
    end
  end
end
