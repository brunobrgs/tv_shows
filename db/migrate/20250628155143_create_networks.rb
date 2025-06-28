class CreateNetworks < ActiveRecord::Migration[7.2]
  def change
    create_table :networks do |t|
      t.string :name, null: false
      t.references :country, null: false, foreign_key: true
      t.string :official_site

      t.timestamps
    end
  end
end
