require 'rails_helper'

RSpec.describe Patient, type: :model do
  describe "relationships" do
    it {should have_many :doctor_patients}
    it {should have_many(:doctors).through(:doctor_patients)}
  end 
  describe "class method tests" do 
    it "knows patients by age" do 
      hospital = Hospital.create!(
        name: "Weenie Hut General"
      )
      doctor = hospital.doctors.create!(
        name: "Dr. Manowar",
        specialty: "Jellyfish stings",
        university: "Rock Bottom University"
      )
      patient1 = doctor.patients.create!(
        name: "Spongebob Squarepants",
        age: "22"
      )
      patient2 = doctor.patients.create!(
        name: "Patrick Star",
        age: "24"
      )
      patient3 = doctor.patients.create!(
        name: "Squidward Tenticles",
        age: "26"
      )

      expect(Patient.patients_by_age).to eq([patient3, patient2, patient1])
    end
  end
end
