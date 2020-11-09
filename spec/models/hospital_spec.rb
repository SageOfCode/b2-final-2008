require 'rails_helper'

RSpec.describe Hospital, type: :model do
  describe "relationships" do
    it {should have_many :doctors}
  end 

  describe "instance method tests" do 
    it 'knows doctor count' do
      hospital = Hospital.create!(
        name: "Weenie Hut General"
      )
      doctor1 = hospital.doctors.create!(
        name: "Dr. Manowar",
        specialty: "Jellyfish stings",
        university: "Rock Bottom University"
      )
      doctor2 = hospital.doctors.create!(
        name: "Dr. Manowar",
        specialty: "Cooking related injuries",
        university: "Bikini Bottom University"
      )
      doctor3 = hospital.doctors.create!(
        name: "Patrick Star",
        specialty: "Injuries from sitting too long",
        university: "Bikini Bottom University"
      )

      expect(hospital.doctor_count).to eq(3)
    end

    it 'knows doctor universities' do
      hospital = Hospital.create!(
        name: "Weenie Hut General"
      )
      doctor1 = hospital.doctors.create!(
        name: "Dr. Manowar",
        specialty: "Jellyfish stings",
        university: "Rock Bottom University"
      )
      doctor2 = hospital.doctors.create!(
        name: "Dr. Manowar",
        specialty: "Cooking related injuries",
        university: "Bikini Bottom University"
      )
      doctor3 = hospital.doctors.create!(
        name: "Patrick Star",
        specialty: "Injuries from sitting too long",
        university: "Bikini Bottom University"
      )

      expect(hospital.doctor_universities).to eq("Rock Bottom University, Bikini Bottom University")
    end

  end
end
