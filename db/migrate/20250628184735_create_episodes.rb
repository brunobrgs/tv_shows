class CreateEpisodes < ActiveRecord::Migration[7.2]
  def change
    create_table :episodes do |t|
      t.string :name, null: false
      t.integer :season, null: false
      t.integer :number, null: false
      t.text :summary
      t.integer :runtime
      t.string :image_original
      t.string :image_medium
      t.string :url, null: false
      t.decimal :rating_average, precision: 3, scale: 1
      t.references :show, null: false, foreign_key: true

      t.timestamps
    end

    add_index :episodes, [:show_id, :season, :number], unique: true
  end
end
