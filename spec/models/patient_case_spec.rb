require 'rails_helper'

describe PatientCase do
  it 'is invalid without a tongue attachment' do
    expect { create(:patient_case, tongue: nil) }.to raise_error(ActiveRecord::RecordInvalid)
  end

  it 'is invalid with an attachment bigger than 2MB' do
    expect { create(:patient_case, :large_image) }.to raise_error(ActiveRecord::RecordInvalid)
  end
end
