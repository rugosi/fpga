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



