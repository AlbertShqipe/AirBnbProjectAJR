class AddReferenceKeyToPlayers < ActiveRecord::Migration[7.1]
  def change
    add_foreign_key :players, :users, column: :owner_id
  end
end
