class AddIndexToNetworksName < ActiveRecord::Migration[7.2]
  def change
    add_index :networks, :name
  end
end
