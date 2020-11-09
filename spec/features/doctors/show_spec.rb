require 'rails_helper'

RSpec.describe 'As a visitor', type: :feature do
  describe "When I visit a doctor's show page" do
    before(:each) do
      @hospital = Hospital.create!(
        name: "Weenie Hut General"
      )
      @doctor = @hospital.doctors.create!(
        name: "Dr. Manowar",
        specialty: "Jellyfish stings",
        university: "Rock Bottom University"
      )
      @patient1 = @doctor.patients.create!(
        name: "Spongebob Squarepants",
        age: "22"
      )
      @patient2 = @doctor.patients.create!(
        name: "Patrick Star",
        age: "24"
      )
      @patient3 = @doctor.patients.create!(
        name: "Squidward Tenticles",
        age: "26"
      )
    end

    it 'I see their information along with their hospital and patients' do
      visit "/doctors/#{@doctor.id}"

      expect(page).to have_content(@doctor.name)
      expect(page).to have_content(@doctor.specialty)
      expect(page).to have_content(@doctor.university)
      expect(page).to have_content(@hospital.name)
      expect(page).to have_content(@patient1.name)
      expect(page).to have_content(@patient2.name)
    end
    
    it 'I see a button to remove a patient from a doctor' do
      visit "/doctors/#{@doctor.id}"

      expect(page).to have_button("Remove Patient")

      within "#patient-#{@patient3.id}" do
        click_button("Remove Patient")
      end

      expect(page).to have_css("section#patient-#{@patient1.id}")
      expect(page).to have_css("section#patient-#{@patient2.id}")
      expect(page).to_not have_css("section#patient-#{@patient3.id}")

    end
  end
end