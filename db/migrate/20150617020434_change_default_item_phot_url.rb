class ChangeDefaultItemPhotUrl < ActiveRecord::Migration
  def change
    change_column :items,
      :photo_url,
      :string,
      :default => "http://cornucopia.org/cereal-scorecard/images/profiles/farm_to_table_logo.jpg"
  end
end
