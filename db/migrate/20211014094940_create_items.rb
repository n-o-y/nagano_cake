class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.integer :genre_id
      t.string :name
      t.string :image_id
      t.text :introduction
      t.integer :price
      t.boolean :is_active, default: TRUE
      t.datetime :created_at, default: -> { "now" }
      t.datetime :updated_at, default: -> { "now" }

      t.timestamps
    end
  end
end
