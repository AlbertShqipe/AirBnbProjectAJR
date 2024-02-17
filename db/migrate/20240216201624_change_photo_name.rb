class ChangePhotoName < ActiveRecord::Migration[7.1]
  def change
    rename_column :players, :photo, :img
  end
end
