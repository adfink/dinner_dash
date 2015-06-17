class SetItemPhotoUrlDefault < ActiveRecord::Migration
  def change
    change_column :items,
                  :photo_url,
                  :string,
                  :default => "http://jnafarm.locallygrown.net/files/grower/image/5860/original/Farm_to_Table.jpg"
  end
end
