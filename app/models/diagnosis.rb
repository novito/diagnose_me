class Diagnosis < ActiveRecord::Base
  belongs_to :practitioner, class_name: 'User', foreign_key: 'practitioner_id'
  belongs_to :patient_case

  validates :practitioner, presence: true
  validates :patient_case, presence: true
end
