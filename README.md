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
## Note
Unfortunatelly I purchased by accident the version without the U3 spi flash chip, so the reset is a real reset: I have to upload again the binary to the board. Maybe it is worth to select the product with more care, 3 euros is worth it :)

## Usage
Put the directories inside your toolchain directory, e.g. _cc-toolchain-linux/workspace/_, then inside the directories, you can issue the usual commands e.g _make all_

## 8 leds blinking while counting
**A 8-leds with red leds connected to BANK_NA1**

![Generic 8 red leds](/images/8leds.webp)

**A 8-leds module connected to PMOD interface**

![Pmod leds 8 leds top and bottom](/images/PMOD_LEDx8.jpg)

**A 8-leds rgb module connected to BANK_NB1 interface**

![Rgb 8 leds and schema](/images/rgbleds_with_schema.webp)
