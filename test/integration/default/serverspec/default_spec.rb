require 'spec_helper'

describe yumrepo('epel') do
  it { should exist }
  it { should be_enabled }
end

describe service('nginx') do
  it { should be_enabled }
  it { should be_running }
end

describe port(80) do
  it { should be_listening.with('tcp') }
end

describe command('curl -L localhost') do
  its(:stdout) { should contain('Hello World!') }
end
