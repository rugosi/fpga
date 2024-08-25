# olimex gatemate evb

## Updating config.mk from colognechip software
**Olimex board specific**
```
jtag:
 	$(OFL) $(OFLFLAGS) -b olimex_gatemateevb $(TOP)_00.cfg
```
**not Olimex board specific**
```
jtag:
	$(OFL) $(OFLFLAGS) -c dirtyJtag $(TOP)\_00.cfg
```
## Usage
Put the directories inside your toolchain directory, e.g. _cc-toolchain-linux/workspace/_, then inside the directories, you can issue the usual commands e.g _make all_



