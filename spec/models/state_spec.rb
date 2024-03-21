require 'rails_helper'

RSpec.describe State, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:acronym) }
  end

  describe 'associations' do
    it { should have_many(:cities) }
  end
end

# == Schema Information
#
# Table name: states
#
#  id         :bigint           not null, primary key
#  acronym    :string
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
