# Reverse Remote VSCode

Ever `code .` on a remote server? Then realise your mistake and feel like a fool? Well, now you don't have to!

_Reverse Remote VSCode_ is simple solution to run the `code .` command on a remote server and open the VSCode editor locally using the Remote-SSH extension. This tutorial will guide you through the process of setting up Open Remote VSCode for your bash shell.

## Prerequisites

- Bash shell
- VSCode installed on your local machine
- Remote-SSH extension installed in VSCode
- SSH access to your remote server

## Info

- reverse_remote_vscode.sh (local)
  - creates Reverse SSH tunnel to the remote server
  - listens for the `code .` command from the remote server
- open_vscode.sh: (remote) passes the `code .` command to the local machine

## Setup

### Step 1: edit `reverse_remote_vscode.sh`

```bash
PORT=1234
REMOTEUSER=yourremoteuser
REMOTESERVER=yourremoteserver
```

### Step 2: make the `reverse_remote_vscode.sh` script executable

```bash
chmod +x reverse_remote_vscode.sh
```

### Step 3 (optional): Add to `~/.bashrc` and reload shell so that it is always running

- Edit your `~/.bashrc` file

  ```bash
  nano ~/.bashrc
  ```

- Add: `source /path/to/script/reverse_remote_vscode.sh &` to file

- Reload shell

  ```bash
  source ~/.bashrc
  ```

### Step 4: scp `open_vscode.sh` script to the remote server

```bash
scp bin/open_vscode.sh user@remote-server:/home/user/bin/open_vscode.sh
```

### Step 5: SSH into the remote server and make the remote script executable

- Make the script executable

  ```bash
  chmod +x /home/user/bin/open_vscode.sh
  ```

- Add the following line to your remote server's .bashrc or .bash_aliases file:

  ```bash
  nano ~/.bash_aliases
  ```

  `alias code="/path/to/open_vscode.sh"`

  _note: you can use any alias you like, like `rcode` or something if this is confusing_

- Reload shell

  ```bash
  source ~/.bashrc
  ```

## Usage

On your remote server run the following command and watch the magic happen!

`code .` (current working directory)

also works with:

`code full/path/to/folder`

`code ./path/to/folder`
