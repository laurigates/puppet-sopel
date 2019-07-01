# frozen_string_literal: true

require 'spec_helper'

describe 'sopel' do
  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }

      it { is_expected.to compile.with_all_deps }
      it { is_expected.to contain_class('python') }
      it { is_expected.to contain_package('python-enchant') }
      it { is_expected.to contain_python__pip('sopel') }
      it { is_expected.to contain_user('sopel') }
      it { is_expected.to contain_file('/etc/sopel') }
      it { is_expected.to contain_file('/var/lib/sopel') }
      it { is_expected.to contain_file('/etc/sopel/sopel.cfg') }
      it { is_expected.to contain_file('/etc/systemd/system/sopel.service') }
      it { is_expected.to contain_service('sopel') }
    end
  end
end
