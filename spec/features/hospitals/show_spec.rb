require 'rails_helper'

RSpec.describe 'As a visitor' do
  describe "When I visit a hospital's show page" do
    it "I see that hospitals information and info. about doctors" do
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

      visit "/hospitals/#{hospital.id}"

      expect(page).to have_content(hospital.name)
      expect(page).to have_content("Number of doctors on staff: #{hospital.doctor_count}")
      expect(page).to have_content("Univerities attended by doctors on staff: #{hospital.doctor_universities}")
    end
  end
end