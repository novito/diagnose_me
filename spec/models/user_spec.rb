require 'rails_helper'

describe User do
  it 'is invalid without a first name' do
    expect { create(:user, first_name: nil) }.to raise_error(ActiveRecord::RecordInvalid)
  end

  it 'is invalid with an empty name' do
    empty_names = ['', '   ']
    empty_names.each do |empty_name|
      expect { create(:user, first_name: empty_name) }.to raise_error(ActiveRecord::RecordInvalid)
    end
  end

  it 'is invalid without a last name' do
    expect { create(:user, last_name: nil) }.to raise_error(ActiveRecord::RecordInvalid)
  end

  it 'is invalid with an empty last name' do
    empty_names = ['', '   ']
    empty_names.each do |empty_name|
      expect { create(:user, last_name: empty_name) }.to raise_error(ActiveRecord::RecordInvalid)
    end
  end
end
