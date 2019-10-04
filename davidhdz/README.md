#  Conky Horizontal Minimalist
based on: 
```
https://github.com/davidhdz/conky-horizontal-minimalist
``` 
# Setup
after setup this files are meant to be used with conky manager 
https://github.com/zcot/conky-manager2  
Require lm-sensors  
```
cd ~/.conky/davidhdz/
#net_interface_lan=$(echo $(ls /sys/class/net) | cut -d ' ' -f 1)
net_interface_wlan=$(echo $(ls /sys/class/net) | cut -d ' ' -f 3)
sed -i "s/wlp5s0/${net_interface_wlan}/g" $HOME/.conky/davidhdz/infobar
#sed -i "s/enp7s0/${net_interface_wlan}/g" $HOME/.conky/davidhdz/infobar
```

