class CreatePatientCases < ActiveRecord::Migration
  def change
    create_table :patient_cases do |t|
      t.text :comments

      t.timestamps
    end
  end
end
