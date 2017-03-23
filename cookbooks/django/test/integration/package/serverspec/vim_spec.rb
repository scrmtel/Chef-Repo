require 'spec_helper'
describe package('epel-release-7-9.noarch.rpm') do
  it { should be_installed }
end

describe file("/root/project") do
     it { should exist } # the configuration file should exist
   end
