all: auriga-avahi.pp auriga-ldconfig.pp auriga-pulseaudio.pp auriga-systemd.pp
	@echo "Now run (as root):"
	@echo ""
	@echo "semodule -i auriga-avahi.pp"
	@echo "semodule -i auriga-ldconfig.pp"
	@echo "semodule -i auriga-pulseaudio.pp"
	@echo "semodule -i auriga-systemd.pp"
	

%.pp: %.mod
	semodule_package -o $@ -m $<

%.mod: %.te
	checkmodule -M -m -o $@ $<

clean:
	rm -f *.mod *.pp	
