class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :terms_and_conditions, acceptance: true

  has_many :patient_cases

  # Returns the concatenation of first name and last name
  def complete_name
    "#{first_name} #{last_name}"
  end
end
