class AddUserIdToCases < ActiveRecord::Migration
  def change
    add_belongs_to :patient_cases, :user 
  end
end
