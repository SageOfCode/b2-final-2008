class Patient < ApplicationRecord
  validates_presence_of :name, :age

  has_many :doctor_patients, dependent: :destroy
  has_many :doctors, through: :doctor_patients

  def self.patients_by_age
    self.all.order(age: :desc)
  end
  
end
