class RemovePhotoUrlFromItemsTable < ActiveRecord::Migration
  def change
    remove_column :items, :photo_url
  end
end
