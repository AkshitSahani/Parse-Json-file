class PatientsController < ApplicationController
require 'json'
before_action :parse_json

  def index
    @patient = Patient.first
  end

  def show

    # I included the block below for the app to be able to respond to XHR requests with different different data types.
    if request.xhr?
      respond_to do |format|
        format.html
        format.json { render json: @patient }
      end
    end
  end

  private

  def patient_params
    params.require(:patient).permit(:name, :organization_name, :gender, :number_of_conditions)
  end

  def parse_json
    file = File.read('patient.json')
    @patient_info = JSON.parse(file)
  end

end
