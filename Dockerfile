# Base image
FROM ubuntu:22.04

# Add the /usr/games directory to PATH
ENV PATH="/usr/games:${PATH}"

# Install application dependencies
RUN apt-get update && apt-get install -y \
    fortune \
    cowsay \
    netcat-traditional \
    && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /app

# Copy application script
COPY wisecow.sh .

# Make it executable
RUN chmod +x wisecow.sh

# Expose the port the app listens on
EXPOSE 4499

# Start the application
CMD ["./wisecow.sh"]
