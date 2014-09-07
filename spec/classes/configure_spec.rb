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

    it { should contain_nagios_contact('nagiosadmin')
        .with_email('root@localhost')
        .with_service_notification_commands('notify-service-by-email')
        .with_host_notification_commands('notify-host-by-email')
        .with_service_notification_period('24x7')
        .with_host_notification_period('24x7')
        .with_service_notification_options('w,u,c,r')
        .with_host_notification_options('d,r')
    }
  end
end
