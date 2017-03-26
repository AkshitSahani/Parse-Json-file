class PatientsController < ApplicationController
require 'json'
before_action :parse_json

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
    @patient = JSON.parse(file)
  end

end


# Name of patient: patient.name[0]['given'][0]   patient.name[0]['family'][0]
# Name of organization: patient.managingOrganization['display']
# Gender: patient.gender
# Number of conditions: patient.conditions.count
# List of all the conditions: patient.conditions.each do |condition| condition end
