class AddPhotoUrlToItems < ActiveRecord::Migration
  def change
    add_column :items, :photo_url, :string
  end
end
