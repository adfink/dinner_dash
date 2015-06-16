class SetDefaultValueForUserDisplayName < ActiveRecord::Migration
  def change
    change_column :users, :display_name, :string, :default => ""
  end
end
