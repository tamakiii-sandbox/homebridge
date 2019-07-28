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
