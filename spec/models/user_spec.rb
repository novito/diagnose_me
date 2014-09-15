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

  describe '#complete_name' do
    it 'returns a concat of first_name and last_name' do
      user = create(:user, first_name: 'Johnny', last_name: 'Melavo')
      expect(user.complete_name).to eq("#{user.first_name} #{user.last_name}")
    end
  end
end
