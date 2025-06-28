class CreateCountries < ActiveRecord::Migration[7.2]
  def change
    create_table :countries do |t|
      t.string :name, null: false
      t.string :code, null: false, limit: 2
      t.string :timezone, null: false

      t.timestamps

      t.index :code, unique: true
    end
  end
end
