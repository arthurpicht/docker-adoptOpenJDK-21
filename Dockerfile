FROM arthurpicht/debian-12:latest

ENV DOCKER_NAME="adoptopenjdk-21"
ENV JAVA_HOME /man/java
ENV PATH $JAVA_HOME/bin:$PATH

# see https://github.com/docker-library/docs/tree/master/openjdk
# https://github.com/adoptium/api.adoptium.net/blob/main/docs/cookbook.adoc#example-three-scripting-a-download-using-the-adoptium-api

RUN set -eux; \
	API_URL="https://api.adoptium.net/v3/binary/latest/21/ga/linux/x64/jdk/hotspot/normal/eclipse"; \
	export OPENJDK_URL=$(curl -w %{redirect_url} "${API_URL}"); \
	export OPENJDK_FILE=$(curl -OL -w %{filename_effective} "${OPENJDK_URL}"); \
	curl -L "${OPENJDK_URL}.sha256.txt" | sha256sum -c; \
	mkdir -p "$JAVA_HOME"; \
	tar --extract \
		--file "$OPENJDK_FILE" \
		--directory "$JAVA_HOME" \
		--strip-components 1 \
		--no-same-owner \
	; \
	rm "$OPENJDK_FILE"; \
	echo "[$(date)]  [$DOCKER_NAME] [$OPENJDK_FILE]" >> /.components; \
	javac --version; \
	java --version; 

