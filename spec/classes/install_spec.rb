require 'spec_helper'

describe 'nagiosserver', :type => :class do
  let(:title) { 'nagiosserver::install' }

  context 'with default parameters' do
    it { should contain_package('nagios-nrpe-plugin')
        .with_ensure('present')
    }

    it { should contain_package('nagios3-core')
        .with_ensure('present')
    }

    it { should contain_package('nagios3-cgi')
        .with_ensure('present')
    }
  end

  context 'version => present' do
    let(:params) { {:version => 'present'} }

    it { should contain_package('nagios-nrpe-plugin')
        .with_ensure('present')
    }

    it { should contain_package('nagios3-core')
        .with_ensure('present')
    }

    it { should contain_package('nagios3-cgi')
        .with_ensure('present')
    }
  end

  context 'version => latest' do
    let(:params) { {:version => 'latest'} }

    it { should contain_package('nagios-nrpe-plugin')
        .with_ensure('latest')
    }

    it { should contain_package('nagios3-core')
        .with_ensure('latest')
    }

    it { should contain_package('nagios3-cgi')
        .with_ensure('latest')
    }
  end

  context 'icinga => true' do
    let(:params) do
      {
        'icinga' => true,
      }
    end

    it { should contain_package('nagios-nrpe-plugin')
        .with_ensure('present')
    }

    it { should contain_package('icinga-core')
        .with_ensure('present')
    }

    it { should contain_package('icinga-cgi')
        .with_ensure('present')
    }
  end
end
