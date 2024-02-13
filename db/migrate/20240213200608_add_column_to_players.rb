class AddColumnToPlayers < ActiveRecord::Migration[7.1]
  def change
    add_column :players, :availabilty, :boolean, default: true
  end
end
