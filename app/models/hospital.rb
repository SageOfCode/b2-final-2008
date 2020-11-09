class Hospital < ApplicationRecord
  validates_presence_of :name
  has_many :doctors

  def doctor_count
    doctors.count
  end

  def doctor_universities
    doctors.pluck(:university).uniq.join(", ")
  end
end
