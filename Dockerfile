# Extend vert.x image
FROM vertx/vertx3

#                                                       
ENV VERTICLE_NAME com.mydomain.deposit.CustomerInfoVerticle
ENV VERTICLE_FILE target/CustomerInfo-1.0.jar

# Set the location of the verticles
ENV VERTICLE_HOME /usr/verticles

EXPOSE 9080

# Copy your verticle to the container                   
COPY $VERTICLE_FILE $VERTICLE_HOME/

# Launch the verticle
WORKDIR $VERTICLE_HOME
ENTRYPOINT ["sh", "-c"]
CMD ["vertx run $VERTICLE_NAME -cp $VERTICLE_HOME/* -cluster"]
