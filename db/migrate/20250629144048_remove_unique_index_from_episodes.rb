class RemoveUniqueIndexFromEpisodes < ActiveRecord::Migration[7.2]
  def change
    remove_index :episodes, [:show_id, :season, :number]
  end
end
