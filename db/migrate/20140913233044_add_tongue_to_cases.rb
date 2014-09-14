class AddTongueToCases < ActiveRecord::Migration
  def self.up
    add_attachment :patient_cases, :tongue
  end

  def self.down
    remove_attachment :patient_cases, :tongue
  end
end
