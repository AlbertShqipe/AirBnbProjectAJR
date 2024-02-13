class CreatePlayers < ActiveRecord::Migration[7.1]
  def change
    create_table :players do |t|
      t.string :name
      t.string :position
      t.integer :age
      t.string :address
      t.string :nationality
      t.string :height
      t.string :foot
      t.string :club
      t.integer :market_value
      t.integer :price_per_day
      t.string :photo
      t.integer :owner_id

      t.timestamps
    end
  end
end
