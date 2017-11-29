Vagrant.configure("2") do |config|
  config.vm.box = "unibe/centos7_rhce"

  config.vm.define "router" do |router|
  	router.vm.provision "shell", path: "scripts/router.sh"
	router.vm.hostname = "router"
	router.vm.network "private_network", ip: "192.168.0.2"
	router.vm.network "private_network", ip: "192.168.1.2" 
  end

  config.vm.define "server" do |server|
  	server.vm.provision "shell", path: "scripts/dns.sh"
	  server.vm.hostname = "server"
	  server.vm.network "private_network", ip: "192.168.0.3"
  end

  config.vm.define "client01" do |client01|
  	client01.vm.provision "shell", path: "scripts/route_0.sh"
	  client01.vm.hostname = "client01"
	  client01.vm.network "private_network", ip: "192.168.0.10"
  end

  config.vm.define "client02" do |client02|
  	client02.vm.provision "shell", path: "scripts/route_1.sh"
	client02.vm.hostname = "client02"
	client02.vm.network "private_network", ip: "192.168.1.10"
  end

  config.vm.define "client03" do |client03|
	client03.vm.provision "shell", path: "scripts/route_1.sh"
	client03.vm.hostname = "client03"
	client03.vm.network "private_network", ip: "192.168.1.11"
	client03.vm.network "private_network", ip: "192.168.1.12"
  end
	
  config.vm.define "client04" do |client04|
	client04.vm.provision "shell", path: "scripts/route_1.sh"
	client04.vm.hostname = "client04"
	client04.vm.network "private_network", ip: "192.168.1.13", auto_config: false
  end

end
