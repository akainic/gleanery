require 'spec_helper'

describe Rating do

  it { should have_valid(:restaurant_id).when(1,2) }
  it { should_not have_valid(:restaurant_id).when(nil,'') }

  it { should have_valid(:user_id).when(1,2) }
  it { should_not have_valid(:user_id).when(nil,'') }
  
end
