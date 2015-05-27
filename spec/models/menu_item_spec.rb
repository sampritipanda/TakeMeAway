require 'rails_helper'

RSpec.describe MenuItem, type: :model do
    let(:menu_item) { FactoryGirl.create(:menu_item) }

    describe 'Fixtures' do
      it 'should have valid fixture factory' do
        expect(FactoryGirl.create(:menu_item)).to be_valid
      end
    end

    describe 'Associations' do
      it { is_expected.to have_and_belong_to_many :orders }
      it { is_expected.to have_and_belong_to_many :menus }
      it { is_expected.to have_and_belong_to_many :menu_categories }
      it { should have_attached_file(:image) }
    end
    
    describe 'Database schema' do
      it { is_expected.to have_db_column :name }
      it { is_expected.to have_db_column :price }
      it { is_expected.to have_db_column :description }
      it { is_expected.to have_db_column :ingredients }
      # Timestamps
      it { is_expected.to have_db_column :created_at }
      it { is_expected.to have_db_column :updated_at }

    end

    describe 'Validations' do
      it { is_expected.to validate_presence_of :name }
      it { is_expected.to validate_presence_of :price }
      it { should validate_attachment_presence(:image)}
      it { should validate_attachment_content_type(:image).
                        allowing('image/jpg', 'image/png').
                        rejecting('text/plain', 'text/xml') }
    end

end
