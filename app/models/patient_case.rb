class PatientCase < ActiveRecord::Base
  belongs_to :user
  has_attached_file :tongue, styles: {small: "150x150#"} 
  has_many :diagnoses

  validates :tongue, :attachment_presence => true
  validates_attachment_content_type :tongue, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
  validates_with AttachmentSizeValidator, :attributes => :tongue, :in => [0.megabytes..2.megabytes]
end
