FROM alpine:latest

# Set environment variables for non-interactive installation
ENV DEBIAN_FRONTEND=noninteractive

# Install necessary dependencies
RUN apk add --no-cache bash coreutils findutils sed grep ostree

# Create a directory for the script and copy the script files
WORKDIR /usr/local/bin

# Copy the make-diff-lockbox script and README.md into the container
COPY make-diff-lockbox /usr/local/bin/
RUN chmod +x /usr/local/bin/make-diff-lockbox

# Set the entry point to the script
WORKDIR /workdir
ENTRYPOINT ["/usr/local/bin/make-diff-lockbox"]
