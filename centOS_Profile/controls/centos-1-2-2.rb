control 'centos-1-2-2' do
  impact 1.0
  title 'Ensure GPG keys are configured (Not Scored)'
  desc 'Most packages managers implement GPG key signing to verify package integrity during installation.'
  desc 'rationale', 'It is important to ensure that updates are obtained from a valid source to protect against spoofing that could lead to the inadvertent installation of malware on the system.' # Requires Chef InSpec >=2.3.4
  

  describe command('rpm -q gpg-pubkey --qf "%{name}-%{version}-%{release} --> %{summary}\n"') do
   its('stdout') { should match (/CentOS 7 Official Signing Key/) }
end
end
