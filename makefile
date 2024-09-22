# --restow prunes obsolete symlinks from the target directory

LIGHTDM_DEFAULTS=/etc/lightdm/defaults

all:
	@if ! command -v stow &> /dev/null; then \
	echo "stow not found. Instaling with Pacman..." \
		sudo pacman -S stow; \
	fi

   # this is necessary because lightdm is linked to /etc/lightdm
	for dir in $(shell find * -maxdepth 0 -type d ! -name 'lightdm'); do \
		if [ "$$dir" = "ssh" ]; then \
			stow --verbose --target=$(HOME)/.ssh --restow $$dir; \
		else \
			stow --verbose --target=$(HOME) --restow $$dir; \
	fi; \
	done

   ## LIGHTDM
	@if [ ! -d /etc/lightdm/defaults ]; then \
		echo "Creating default directory for default lightdm .conf files in '$(LIGHTDM_DEFAULTS)'. This will require your password."; \
		sudo mkdir -p $(LIGHTDM_DEFAULTS); \
	fi

   # moves the default lightdm .conf files to $LIGHTDM_DEFAULTS
	@for conf in /etc/lightdm/*.conf; do \
		if [ -e "$$conf" ] && [ ! -L "$$conf" ] ; then \
			echo "WARNING: Moving non-symlink .conf  '$$conf' to '$(LIGHTDM_DEFAULTS)'. This may require your password."; \
			sudo mv "$$conf" "$(LIGHTDM_DEFAULTS)"; \
		fi \
	done

	sudo stow --target=/etc/lightdm lightdm

delete:
	stow --verbose --target=$$HOME --delete */
	stow --verbose --target=/etc/lightdm --delete */
	# restores the default lightdm configs
	sudo mv mv $(LIGHTDM_DEFAULTS)/* /etc/lightdm/
