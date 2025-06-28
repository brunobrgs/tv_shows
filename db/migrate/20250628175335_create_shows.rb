class CreateShows < ActiveRecord::Migration[7.2]
  def change
    create_table :shows do |t|
      t.string :name, null: false
      t.text :summary
      t.string :language
      t.string :status
      t.integer :runtime
      t.date :premiered
      t.date :ended
      t.string :official_site
      t.string :schedule_time
      t.string :schedule_days, array: true, default: []
      t.decimal :rating_average, precision: 3, scale: 1
      t.references :network, foreign_key: true
      t.string :show_type
      t.string :genres, array: true, default: []
      t.string :image_original
      t.string :image_medium

      t.timestamps
    end
  end
end
