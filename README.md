# Vagrant file for deploy MC Server and Evolve API

## Description

This repository is part of the Evolve project. It is oriented to deploy a Minecraft server with the Evolve API to which the middleware will be connected to act as an intermediary between the web application and the API.

## Requirements

To run this project, you will need to have the following installed on your system:

- Vagrant
- VirtualBox

## Installation

1. Clone this repository on your local machine:

    ```bash
    git clone https://github.com/PazitoPazos/evolve-vagrant.git
    ```

2. Enter the project directory:

    ```bash
    cd evolve-vagrant
    ```

3. Start the virtual machine with Vagrant:

    ```bash
    vagrant up
    ```

4. Connect to the virtual machine via SSH:

    ```bash
    vagrant ssh
    ```

## Usage

Once you are connected to the virtual machine, you have to run the API:
1. Move to `evolve-api` directory:

    ```bash
    cd evolve-api
    ```

2. Start the API with `npm`:

    ```bash
    npm run start
    ```

Now if you have the middleware and the application up you will see in the console that messages will be displayed when the user connects and goes to the dashboard, console or log.

### Stopping the virtual machine
When you have finished working, you can stop the virtual machine:
    ```bash
    vagrant halt
    ```

### Deleting the virtual machine
If you no longer need the virtual machine, you can delete it:
    ```bash
    vagrant destroy
    ```

## Vagrantfile

The `Vagrantfile` defines the configuration of the virtual machine. You can adjust this configuration according to your needs. Here is a basic example of a `Vagrantfile`:

```ruby
Vagrant.configure("2") do |config|

  config.vm.box = "ubuntu/focal64"
  config.vm.hostname = "mcserver"
  config.vm.define "mcserver"
  config.vm.network "public_network", ip: "192.168.1.200" # Change the IP according to your needs

  # Provisions
  config.vm.provision "shell", path: "provision/provision-for-openssh.sh"
  config.vm.provision "shell", path: "provision/provision-for-openjdk.sh"
  config.vm.provision "shell", path: "provision/provision-for-node.sh"
  config.vm.provision "shell", path: "provision/deploy-evolve-api.sh"
  config.vm.provision "shell", path: "provision/deploy-mcserver.sh"

  config.vm.provider "virtualbox" do |vb|
    # Display the VirtualBox GUI when booting the machine
    vb.gui = true
  
    # Customize the amount of memory on the VM:
    vb.memory = "4096"
  end
end

## Contributions
Contributions are welcome! If you encounter any problems or have suggestions to improve this project, feel free to open an issue or send a pull request.

## License
This project is licensed under the MIT License. See the LICENSE file for more details.
