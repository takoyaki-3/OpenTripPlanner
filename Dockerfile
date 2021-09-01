FROM ubuntu:latest

RUN apt-get -y update 

RUN apt-get install -y openjdk-11-jre
RUN apt-get install -y wget

COPY ./gtfs /gtfs
COPY ./map /map

RUN cd /root && \
    mkdir otp && \
    cd otp && \
    wget "https://repo1.maven.org/maven2/org/opentripplanner/otp/2.0.0/otp-2.0.0-shaded.jar" && \
    mv /gtfs/*.zip .

RUN cd /root && \
    apt install -y osmctools && \
    mv /map/*.osm.pbf . && \
    mv *.osm.pbf otp/ 

RUN java -Xmx5G -jar /root/otp/otp-2.0.0-shaded.jar --build /root/otp/ --save
ENTRYPOINT java -Xmx2G -jar /root/otp/otp-2.0.0-shaded.jar --load /root/otp
