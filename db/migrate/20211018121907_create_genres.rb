class CreateGenres < ActiveRecord::Migration[5.2]
  def change
    create_table :genres do |t|
      t.string :name
      t.datetime :created_at, default: -> { "now" }
      t.datetime :updated_at, default: -> { "now" }
    end
  end
end
