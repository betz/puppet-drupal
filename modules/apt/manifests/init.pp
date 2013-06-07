include apt

apt::source { "ubuntu_nginx":
        location        => "http://nginx.org/packages/ubuntu/",
        release         => "precise",
        repos           => " nginx",
        include_src     => false
}