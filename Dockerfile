FROM google/cloud-sdk:slim

WORKDIR /app

COPY . .

RUN apt-get update && \
    apt-get install -y maven openjdk-17-jdk

RUN mvn clean package

CMD java -jar target/gatling-demo-1.0.jar \
    -s simulations.ApiSimulation \
    -rf results && \
    gsutil cp -r results gs://gatling-reports-deepali-2026/
