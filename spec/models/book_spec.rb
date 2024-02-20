require 'rails_helper'

RSpec.describe Book, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:price) }
    it { should validate_numericality_of(:price).is_greater_than_or_equal_to(0) }
    it { should validate_presence_of(:author) }
    it { should validate_presence_of(:year) }
    it { should validate_numericality_of(:year).only_integer.is_greater_than(1950) }
    it { should validate_numericality_of(:rating).only_integer.is_greater_than_or_equal_to(0).is_less_than_or_equal_to(5).allow_nil }
  end
end
