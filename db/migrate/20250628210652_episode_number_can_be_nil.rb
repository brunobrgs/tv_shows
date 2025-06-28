class EpisodeNumberCanBeNil < ActiveRecord::Migration[7.2]
  def change
    change_column_null :episodes, :number, true
  end
end
