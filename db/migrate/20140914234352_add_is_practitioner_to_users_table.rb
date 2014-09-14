class AddIsPractitionerToUsersTable < ActiveRecord::Migration
  def change
    add_column :users, :is_practitioner, :boolean, default: false
  end
end
