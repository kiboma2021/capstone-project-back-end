require 'rails_helper'

RSpec.describe FavoriteBook, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:user_id) }
    it { should validate_presence_of(:book_id) }
  end
end
RSpec.describe FavoriteBook, type: :model do
  describe 'associations' do
    it { should belong_to(:user) }
    it { should belong_to(:book) }
  end
end
