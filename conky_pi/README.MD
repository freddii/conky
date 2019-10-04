# [Bash] Monitor servers remotely using Conky
A small script and config to monitor remotely your servers using conky
# How it works
* You need to set up SSH Keys to identify your machine without involving password:
```
ssh-keygen -t rsa -b 2048
ssh-copy-id pi@192.168.0.xx
```
* You need to change servers array in server_info.sh file lines 18 and 38
* Customize your conky config based on one of mine (conky_*)
* Execute it with
```
$ conky -d -q -c your_conky_config
```