require 'rails_helper'

describe Diagnosis do
  it 'is invalid without a practitioner' do
    expect { create(:diagnosis, practitioner: nil) }.to raise_error(ActiveRecord::RecordInvalid)
  end

  it 'is invalid without a patient case' do
    expect { create(:diagnosis, patient_case: nil) }.to raise_error(ActiveRecord::RecordInvalid)
  end
end
