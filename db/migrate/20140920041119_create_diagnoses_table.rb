class CreateDiagnosesTable < ActiveRecord::Migration
  def change
    create_table :diagnoses do |t|
      t.integer :practitioner_id, null: false
      t.integer :patient_case_id, null: false
      t.text :comments

      t.timestamps
    end
  end
end
