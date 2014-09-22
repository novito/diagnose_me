class AddAcceptTosToUser < ActiveRecord::Migration
  def change
    add_column :users, :terms_and_conditions, :boolean, default: false
  end
end
