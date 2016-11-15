require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'relations' do
    it { is_expected.to have_many(:product_categories_products).dependent(:destroy) }

    it { is_expected.to have_many(:product_categories).through(:product_categories_products) }

  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name)}

    it { is_expected.to validate_presence_of(:price)}

    it { is_expected.to validate_numericality_of(:price)}

    it { is_expected.to validate_length_of(:name).is_at_least(3)}

    it { is_expected.to validate_length_of(:description).is_at_least(4).is_at_most(500)}
  end

  describe 'paperclip attachment' do
    it { is_expected.to have_attached_file(:photo) }

    it { is_expected.to validate_attachment_content_type(:photo).
        allowing('image/png', 'image/gif').
        rejecting('text/plain', 'text/xml') }
  end

end