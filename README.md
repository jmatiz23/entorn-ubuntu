# Entorn for WSL / Ubuntu 22.04

- Modify ``c:\Users\MyUser\.wslconfig`` adding:

```
[wsl2]
guiApplications=false
```

- Make your user as [passwordless sudoer](https://timonweb.com/devops/how-to-enable-passwordless-sudo-for-a-specific-user-in-linux/)
- Run install-1.sh
- Log out and log in again
- Run install-2.sh
- Run install-kernels.sh

## GUI clients for WSL

- X Server
- VNC client (port 5900)
