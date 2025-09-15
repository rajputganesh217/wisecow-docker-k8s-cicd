# Use a common base image
FROM ubuntu:22.04

# Add the /usr/games directory to the system's PATH
ENV PATH="/usr/games:${PATH}"

# Install ALL of the application's dependencies
RUN apt-get update && apt-get install -y \
    fortune \
    cowsay \
    netcat-traditional \
    && rm -rf /var/lib/apt/lists/*

# Set the working directory inside the container
WORKDIR /app

# Copy your script into the container
COPY wisecow.sh .

# Make the script executable
RUN chmod +x wisecow.sh

# Expose the port the server listens on
EXPOSE 4499

# The command to run when the container starts
CMD ["./wisecow.sh"]
