require 'spec_helper'

describe Comment do

  it { should have_valid(:comment).when("Love this restaurant","Great vegan options") }
  it { should_not have_valid(:comment).when(nil,"","foo") }

  it { should belong_to(:user) }
  it { should belong_to(:restaurant) }

end
