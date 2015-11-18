all: auriga-avahi.pp auriga-dbus.pp auriga-dmesg.pp auriga-ldconfig.pp auriga-load_policy.pp auriga-pulseaudio.pp auriga-systemd-hostnamed.pp auriga-systemd-tmpfiles.pp auriga-sshkey.pp
	@echo "Now run (as root):"
	@echo ""
	@echo "semodule -i auriga-avahi.pp"
	@echo "semodule -i auriga-dbus.pp"
	@echo "semodule -i auriga-dmesg.pp"
	@echo "semodule -i auriga-ldconfig.pp"
	@echo "semodule -i auriga-load_policy.pp"
	@echo "semodule -i auriga-pulseaudio.pp"
	@echo "semodule -i auriga-systemd-hostnamed.pp"
	@echo "semodule -i auriga-systemd-tmpfiles.pp"

%.pp: %.mod
	semodule_package -o $@ -m $<

%.mod: %.te
	checkmodule -M -m -o $@ $<

clean:
	rm -f *.mod *.pp	
