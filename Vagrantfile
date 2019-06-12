# -*- mode: ruby -*-
# vi: set ft=ruby :
# Copyright @ airdb.com

VAGRANTFILE_API_VERSION = "2"
NAME = "openresty"

USER = ENV["USER"]
HOME = ENV["HOME"]
HOSTNAME = "#{NAME}.#{USER}.airdb.me"

File.exists?("#{HOME}/profile/.ssh/id_rsa") ? SSH_PRIVATE_KEY = "#{HOME}/profile/.ssh/id_rsa" : SSH_PRIVATE_KEY = "#{HOME}/.ssh/id_rsa"

SYNCED_FOLDER = "#{HOME}/go/src/"

ENV["LC_PORT"] = "8000"


Vagrant.configure("2") do |config|
  config.vm.define "#{NAME}" do | host |
    host.ssh.username = "root"
    host.ssh.insert_key = true
    host.ssh.private_key_path = "#{SSH_PRIVATE_KEY}"

    host.vm.hostname = "#{HOSTNAME}"
    host.vm.provider "docker" do |d|
      d.build_dir = "./"
      #d.build_args = ["--no-cache"]
      d.create_args = ["-e", "AAAA=11111"]
      d.name = "#{HOSTNAME}"
      d.privileged = true
      d.has_ssh = true
      #d.cmd = ["/sbin/init"]
      d.ports = ["8000:8080"]
      d.env = {
	:SSH_SUDO => 'ALL=(ALL) NOPASSWD:ALL',
	"SSH_PORT":"23"
      }
    end

    #host.vm.synced_folder "#{SYNCED_FOLDER}", "/srv"
    #host.vm.network "public_network", ip: "192.168.1.250"
    host.vm.provision "shell" do |s|
      s.path= "https://raw.githubusercontent.com/airdb/docker/master/osinit/ubuntu_init.sh"
      s.args = "base"
    end
  end
end
