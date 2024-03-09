FROM openjdk:8-slim

ENV FIRESTORE_EMULATOR_VERSION=1.19.1

RUN apt-get update -y && \
    apt-get install -y wget --no-install-recommends && \
    wget https://storage.googleapis.com/firebase-preview-drop/emulator/cloud-firestore-emulator-v${FIRESTORE_EMULATOR_VERSION}.jar && \
    apt-get remove -y wget && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

EXPOSE 8080

CMD ["java", "-jar", "/cloud-firestore-emulator-v1.19.1.jar", "--host=0.0.0.0", "--port=8080"]
