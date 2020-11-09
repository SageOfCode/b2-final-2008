require 'rails_helper'

RSpec.describe 'As a visitor', type: :feature do
  describe "When I visit a patient index page" do
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

    it 'I see patients listed from oldest to youngest' do
      visit "/patients/index"
      save_and_open_page
      expect(@patient3.name).to appear_before(@patient2.name)
      expect(@patient2.name).to appear_before(@patient1.name)
      expect(@patient1.name).to_not appear_before(@patient3.name)
    end 
  end
end