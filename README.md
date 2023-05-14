# Entorn for WSL / Ubuntu 22.04

- Modify ``c:\Users\MyUser\.wslconfig`` adding:

```
[wsl2]
guiApplications=false
```

- Make your user as [passwordless sudoer](https://timonweb.com/devops/how-to-enable-passwordless-sudo-for-a-specific-user-in-linux/)
- Run install-1.sh
- Log out and log in again (restarting your system or WSL)
- Run install-2.sh
- Run install-kernels.sh

> Running ``jupyterlab`` from the terminal will fire up the jupyterlab web server. 

### MySQL installation

_This section is meant to be run after the previous scripts_.

Move inside the mysql directory and run ``install.sh``: it will install scripts to start, stop and check status of a mysql service based on docker (you need to have docker installed and up and running).

The provided scripts are:

- ``my start`` > it builds the docker images and starts the docker container, plus docker volume.
- ``my status`` > executes a docker ps
- ``my stop`` > it stops and removes the docker based mysql container.

> The mysql image built automatically adds the ``calendar``schema.

Other sql scripts are provided for training.

> Credentials are your system user ($USER) with password ``pluralcamp``.

The ``install.sh`` script will also install the mysql cli client. You may additionally install the GUI MySQLWorkbench client in your system.

## GUI clients for WSL

- X Server
- VNC client (port 5900)

## GUI clients for your system

- Visual Studio Code with Java, Spring, docker, python, MySQL and any other extension you may consider useful.

> If you are installing this dev entorn in WSL, you can install VS Code in Windows but always with the WSL extension to connect to WSL.

- MySQLWorkbench



