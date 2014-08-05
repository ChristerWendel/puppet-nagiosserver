require 'spec_helper'

describe 'nagiosserver', :type => :class do
  let(:title) { 'nagiosserver::configure' }

  context 'with default params' do
    it { should contain_file('/etc/nagios3/conf.d/contacts_nagios2.cfg')
        .with_ensure('absent')
    }

    it { should contain_file('/etc/nagios3/conf.d/extinfo_nagios2.cfg')
        .with_ensure('absent')
    }

    it { should contain_file('/etc/nagios3/conf.d/hostgroups_nagios2.cfg')
        .with_ensure('absent')
    }

    it { should contain_file('/etc/nagios3/conf.d/localhost_nagios2.cfg')
        .with_ensure('absent')
    }

    it { should contain_file('/etc/nagios3/conf.d/services_nagios2.cfg')
        .with_ensure('absent')
    }
  end
end
