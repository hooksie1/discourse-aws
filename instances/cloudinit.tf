data "template_cloudinit_config" "cloudprepared-init" {
  part {
    content = <<EOF


#cloud-config
repo_update: true
repo_upgrade: all

packages:
 - wget

runcmd:
 - [ sh, -c, "sudo -u root git clone https://github.com/joelradon/wordpress-with-naxsi-waf.git  /tmp/waf" ]
 - [ sh, -c, "sudo -u root sh /tmp/waf/install_script_with_geoip.sh" ]
EOF
  }
}
