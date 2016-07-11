  class linux::default {
    class { 'ntp':
      servers => ['0.pool.ntp.org','1.pool.ntp.org','2.pool.ntp.org','3.pool.ntp.org']
    }

    file { '/etc/localtime':
      ensure => link,
      target => '/usr/share/zoneinfo/Europe/London',
    }

    ssh_authorized_key { 'jenkins@ip-172-31-17-106.eu-west-1.compute.internal':
      user => 'root',
      type => 'ssh-rsa',
      key  => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQCy9xJNqFu3V5Wl0Nu7s18beCMBLSSozJI1i+WFKDic1WycxJsC78xsCMEPFAFmndwn/HRThNYF8OLhhyrlcEoQr1pzFWSMUgfxtxu6Rg2mAgJFK4X2wAz0IwU9sTe66j9flAy5it26ecwPw91cHLMFJIl8xnGEAkjcoeWq+isi8t6xq3kRmXrRGhW2B1GgOLdkjof6LCwCADjayXSaBFLiWbQK3yIHVBCisY89cS7Eghd+OGhuzfch5PS8HFZip+pQzSHbghweuhFxc6DkdmlBuXV7izn19SF/Bq3FctA+rmGqC23dOfWI0p14EmLVQaIoBxzkwZ+HOO4FvVXPk/kr',
    }

    ssh_authorized_key { 'Digital_RTB_Ireland':
      user => 'root',
      type => 'ssh-rsa',
      key  => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQCjc6hIm4zqY5NxKeN2MObNbnMi7DBvgf5O/FFBrVfoQoA7R2Nidb+MzR3wplYJeRLWiLhO3+hHUPBprIyryERjzpP/s1oZ8hFO7S7KTqHrhxOa4xLXxnAEcMMEjekzKJa7Mm6diWv3zIWf4EYOWZJ92tThsbjCnthpw51Qi1PQuQKtL57WCFVTCP9qYkdOHccAbc1JmhWXrKm2Mfst59tAykyVM59X5Y2uzeTMbpsMKSO9SOLsJmzV1CGsWrBPvIfqGZki47Wgkyq8X6VOU/5GssxAxnWvvzgiAPjIXWiKcf4vCByVnZowPKSR6iLTNv7oUyjozuwJUtW7ZPd3ja8x',
    }


  }
