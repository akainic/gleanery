require 'spec_helper'

describe Restaurant do

  it { should have_valid(:name).when('Life Alive','True Bistro') }
  it { should_not have_valid(:name).when(nil,'') }

  it { should have_valid(:street_address).when('765 Massachusetts Ave') }
  it { should_not have_valid(:street_address).when(nil,'') }

  it { should have_valid(:city).when('Cambridge','Somerville') }
  it { should_not have_valid(:city).when(nil,'') }

  describe 'vegan_rating' do

    let(:restaurant) { FactoryGirl.create(:restaurant) }

    it 'calculates all of the vegan ratings for the restaurant' do
      FactoryGirl.create(:rating, vegan: 1, restaurant: restaurant)
      FactoryGirl.create(:rating, vegan: 1, restaurant: restaurant)
      FactoryGirl.create(:rating, vegan: 0, restaurant: restaurant)

      expect(restaurant.vegan_rating).to eql('67%')
    end
  end

end
