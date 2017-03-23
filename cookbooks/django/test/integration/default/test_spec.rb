 describe package("vim") do
     it { should be_installed } # the rpm_package package should be installed
   end

   describe package("django") do
     it { should be_installed } # the django package should be installed
   end


   describe file("/root/project") do
     it { should exist } # the configuration folder /root/project should exist
   end


