class AddAirtimeToEpisodes < ActiveRecord::Migration[7.2]
  def change
    add_column :episodes, :airdate, :date, null: false
    add_column :episodes, :airtime, :string, null: false
    add_column :episodes, :airstamp, :datetime, null: false

    add_index :episodes, :airstamp
  end
end
