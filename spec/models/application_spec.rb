require 'rails_helper'

RSpec.describe Application, type: :model do
  describe 'relationships' do
    it { should have_many(:application_pets) }
    it { should have_many(:pets).through(:application_pets)}
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:street_address) }
    it { should validate_presence_of(:city) }
    it { should validate_presence_of(:state) }
    it { should validate_presence_of(:zip_code) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:status) }
  end

  before(:each) do
    @app_1 = Application.create!(name: "Amy", street_address: "5223 Lovely Ln.", city: "Starfield", state: "TX", zip_code: "78230", description: "I want to take care of a pet who needs help.", status: "In Progress")
    @app_2 = Application.create!(name: "Yuvia", street_address: "9234 Country Rd.", city: "Galaxy Bay", state: "TX", zip_code: "79651", description: "description", status: "Pending")
  end

  describe 'class methods' do
    describe '#pending' do
      it 'returns applications with pending status' do
        expect(Application.pending).to eq([@app_2])
        expect(Application.pending).to_not eq([@app_1])
      end
    end
  end

  describe 'instance methods' do
  end
end
