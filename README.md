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

## 8 leds blinking while counting
**A 8-leds with red leds connected to BANK_NA1**
![Generic 8 red leds](/images/8leds.webp)

**A 8-leds module connected to PMOD interface**
![Pmod leds 8 leds bottom](/images/PMOD_LEDx8_bot.jpg)
![Pmod leds 8 leds top](/images/PMOD_LEDx8_top.jpg)

