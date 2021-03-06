require 'rails_helper'

RSpec.describe Menu, :type => :model do
  let(:menu) { FactoryGirl.create(:menu) }

  describe 'Fixtures' do
    it 'should have valid fixture factory' do
      expect(FactoryGirl.create(:menu)).to be_valid
    end
  end

  describe 'Associations' do
    it { is_expected.to have_many :menu_items_menus }
    it { is_expected.to have_many(:menu_items).through :menu_items_menus }

    it 'join table should have unique index' do
      ActiveRecord::Migration.index_exists?(:menu_items_menus, [:menu_id, :menu_item_id], unique: true)
    end
  end

  describe 'Database schema' do
    it { is_expected.to have_db_column :show_category }
    it { is_expected.to have_db_column :title }
    it { is_expected.to have_db_column(:start_date).of_type(:date) }
    it { is_expected.to have_db_column(:end_date).of_type(:date) }
    # Timestamps
    it { is_expected.to have_db_column :created_at }
    it { is_expected.to have_db_column :updated_at }

  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of :title }
    it { is_expected.to validate_presence_of :start_date }
    it { is_expected.to validate_presence_of :end_date }
  end

  describe 'Class methods' do
    before(:each) do
      Timecop.freeze(Date.today.at_beginning_of_week)
      @menu1 = FactoryGirl.create(:menu, start_date: 1.week.ago.to_date)
      @menu2 = FactoryGirl.create(:menu, start_date: 2.weeks.ago.to_date)
      @menu3 = FactoryGirl.create(:menu, start_date: Date.today)
      @menu4 = FactoryGirl.create(:menu, start_date: 2.days.from_now)
      @menu5 = FactoryGirl.create(:menu, start_date: 1.week.from_now)
    end

    after(:each) do
      Timecop.return
    end

    it 'includes current weeks menus on #this_week' do
      expect(Menu.this_week).to include @menu3, @menu4
    end

    it 'excludes other current weeks menus on #this_week' do
      expect(Menu.this_week).to_not include @menu1, @menu2, @menu5
    end
  end
end
