class PatientsController < ApplicationController
 def destroy
    patient = Patient.find(params[:patient_id])
    patient.destroy
    doctor = Doctor.find(params[:doctor_id])
    redirect_to "/doctors/#{doctor.id}"
  end
end 