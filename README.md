# ferris-sweep

## Install


```
git submodule init
git submodule update

cd qmk_firmware
make git-submodule

cd keyboards/ferris/keymaps/
ln -s ../../../../ git

cd ../../..
```

then everything is ready just flash the keyboards.

```
make ferris/sweep:git:dfu-split-right
make ferris/sweep:git:dfu-split-left
```
