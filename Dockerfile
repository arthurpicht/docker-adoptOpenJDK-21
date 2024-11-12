FROM arthurpicht/debian-12:latest

ENV DOCKER_NAME="adoptopenjdk-21"
ENV JAVA_HOME /man/java
ENV PATH $JAVA_HOME/bin:$PATH

# see https://github.com/docker-library/docs/tree/master/openjdk

RUN set -eux; \
	export OPENJDK_URL="https://github.com/adoptium/temurin21-binaries/releases/download/jdk-21.0.3%2B9/OpenJDK21U-jdk_x64_linux_hotspot_21.0.5_11.tar.gz"; \
	export OPENJDK_FILE="OpenJDK21U-jdk_x64_linux_hotspot_21.0.5_11.tar.gz"; \
	wget -O "$OPENJDK_FILE" "$OPENJDK_URL"; \	
	HASH="3c654d98404c073b8a7e66bffb27f4ae3e7ede47d13284c132d40a83144bfd8c"; \
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
