#
# Cookbook Name:: nginx-helloworld-m
# Spec:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

require 'spec_helper'

describe 'nginx-helloworld-m::default' do
  context 'When all attributes are default, on an unspecified platform' do
    let(:chef_run) do
      runner = ChefSpec::ServerRunner.new
      runner.converge(described_recipe)
    end

    it 'installs epel repository' do
      expect(chef_run).to install_package('epel-release')
    end

    it 'installs nginx package' do
      expect(chef_run).to install_package('nginx')
    end

    it 'enables and starts nginx' do
      expect(chef_run).to enable_service('nginx')
      expect(chef_run).to start_service('nginx')
    end

    it 'applies helloworld html page' do
      expect(chef_run).to create_template('/usr/share/nginx/html/index.html').with(
        user: 'root',
        group: 'root'
      )
    end

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end
  end
end
