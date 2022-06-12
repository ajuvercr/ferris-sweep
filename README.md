# ferris-sweep

## Install


```
git submodule init --recursive

cd qmk_firmware/keyboards/ferris/keymaps/
ln -s ../../../../ git

cd ../../..
```

then everything is ready just flash the keyboards.

```
make ferris/sweep:git:dfu-split-right
make ferris/sweep:git:dfu-split-left
```
