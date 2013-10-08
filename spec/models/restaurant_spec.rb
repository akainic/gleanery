require 'spec_helper'

describe Restaurant do
  
  it { should have_valid(:name).when('Life Alive','True Bistro') }
  it { should_not have_valid(:name).when(nil,'') }

  it { should have_valid(:street_address).when('765 Massachusetts Ave') }
  it { should_not have_valid(:street_address).when(nil,'') }

  it { should have_valid(:city).when('Cambridge','Somerville') }
  it { should_not have_valid(:city).when(nil,'') }

end
