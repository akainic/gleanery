require 'spec_helper'

describe User do
  
  it { should have_valid(:username).when('kalequeen','braggboy') }
  it { should_not have_valid(:username).when(nil,'') }

  it { should have_valid(:email).when('kalequeen@example.com','bragg.boy@example.com') }
  it { should_not have_valid(:email).when(nil,'','foo') }

  it { should have_valid(:password).when('Greens101','16Aminos') }
  it { should_not have_valid(:password).when(nil,'','foo','123') }

end
