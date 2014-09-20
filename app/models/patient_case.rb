class PatientCase < ActiveRecord::Base
  belongs_to :user
  has_attached_file :tongue
  has_many :diagnoses

  validates :tongue, :attachment_presence => true
  validates_attachment_content_type :tongue, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
end
