# Use the official WebSphere Liberty image
FROM icr.io/appcafe/websphere-liberty:latest

# Create a non-root user
USER root

# Create necessary directories with correct permissions
RUN mkdir -p /config && \
    chmod -R 777 /config

# Copy custom Liberty configuration
COPY server.xml /config/server.xml

# Expose the non-privileged port
EXPOSE 9080

# Set user back to non-root (default OpenShift)
USER 1001

CMD ["server", "run", "defaultServer"]
