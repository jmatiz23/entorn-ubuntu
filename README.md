# Entorn for WSL / Ubuntu 22.04

## WSL configuration

- Modify ``c:\Users\MyUser\.wslconfig`` adding:

```
[wsl2]
guiApplications=false
```

## Ubuntu configuration

- Make your user as [passwordless sudoer](https://timonweb.com/devops/how-to-enable-passwordless-sudo-for-a-specific-user-in-linux/)

## Entorn installation

- Run install-1.sh
- Log out and log in again (restarting your system or WSL)
- Run install-2.sh
- Run install-kernels.sh

> Running ``jupyterlab`` from the terminal will fire up the jupyterlab web server. 

**_See proxy section for accessing jupyterlab and webapps via https://local.pluralcamp.com_**

## Nginx proxy installation

_This section is meant to be run after the previous scripts_.

Move inside the proxy directory and run ``install.sh``: it will install scripts to start, restart, stop and check status of a nginx proxy, based on docker (you need to have docker installed and up and running).

The provided scripts are:

- ``proxy start`` > Starts the nginx proxy.
- ``proxy stop`` > Stops the nginx proxy.
- ``proxy restart`` > Restarts the nginx proxy.
- ``proxy status`` > Checks the status of the nginx proxy.

Once the nginx proxy is up and running, you can access entorn via the next URL:

> https://local.pluralcamp.com

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

### PostgreSQL and pgadmin installation

_This section is meant to be run after the previous scripts_.

Move inside the postgres directory and run ``install.sh``: it will install scripts to start, stop and check status of a postgres service based on docker (you need to have docker installed and up and running).

The provided scripts, for postgres and pgadmin both, are:

- ``pg start`` > it builds the docker images and starts the docker containers, plus docker volume.
- ``pg status`` > executes a docker ps
- ``pg stop`` > it stops and removes the docker based postgres and pgadmin containers.

**Credentials**:   
- for pgadmin: <linux_username>@ilg.cat / pluralcamp
- for postgres: <linux_username>  (passwordless)

For exemple, to connect using ``psql``, being _ubuntu_ your linux username:

```
psql -Uubuntu
```

## Desktop and VNC server installation

XFCE4 Desktop and VNC server is already installed within the script ``install-2.sh``. Default VNC port is 5901.


## GUI clients for your host system

- Visual Studio Code with: Java, Spring, docker, python, MySQL, Postgres ... and any other extension you may consider useful.

> If you are installing this dev entorn in WSL, you can install VS Code in Windows but always **with the WSL extension to connect to WSL**.

- MySQLWorkbench
- VNC client / VNC viewer



