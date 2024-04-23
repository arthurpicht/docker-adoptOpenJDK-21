FROM arthurpicht/debian-12:latest

ENV DOCKER_NAME="adoptopenjdk-21"
ENV JAVA_HOME /man/java
ENV PATH $JAVA_HOME/bin:$PATH

# see https://github.com/docker-library/docs/tree/master/openjdk

RUN set -eux; \
	export OPENJDK_URL="https://github.com/adoptium/temurin21-binaries/releases/download/jdk-21.0.3%2B9/OpenJDK21U-jdk_x64_linux_hotspot_21.0.3_9.tar.gz"; \
	export OPENJDK_FILE="OpenJDK21U-jdk_x64_linux_hotspot_21.0.3_9.tar.gz"; \
	wget -O "$OPENJDK_FILE" "$OPENJDK_URL"; \	
	HASH="fffa52c22d797b715a962e6c8d11ec7d79b90dd819b5bc51d62137ea4b22a340"; \
	HASH="$HASH $OPENJDK_FILE"; \
	echo $HASH | sha256sum -c; \
	mkdir -p "$JAVA_HOME"; \
	tar --extract \
		--file "$OPENJDK_FILE" \
		--directory "$JAVA_HOME" \
		--strip-components 1 \
		--no-same-owner \
	; \
	rm "$OPENJDK_FILE"; \
	echo "[$(date)]  [$DOCKER_NAME] [$OPENJDK_URL]" >> /.components; \
	javac --version; \
	java --version; 
