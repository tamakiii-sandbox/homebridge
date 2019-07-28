info: dependencies
	echo $(REMO_NAME)
	timeout 1 dns-sd -B _remo._tcp || true
	timeout 1 dns-sd -G v4 $(REMO_NAME).local || true

dependencies:
	type jq > /dev/null

.env:
	echo "HOMEBRIDGE_PORT=$(PORT)" > $@

config.json: config.base.json dependencies
	cat $< | \
		jq '.bridge.username |= "$(USER)"' | \
		jq '.bridge.port |= $(PORT)' | \
		jq '.bridge.pin |= "$(PIN)"' > $@

clean:
	rm config.json
