# Use the latest Mage AI base image
FROM mageai/mageai:latest
LABEL description="Deploy Mage on ECS"
# Set the environment variables

ENV MAGE_DATA_DIR="/home/src/mage_data"
ENV PYTHONPATH="${PYTHONPATH}:/home/src"  

# Set the working directory inside the container
WORKDIR /home/src

# Expose port 6789 and 7789 for network communication
EXPOSE 6789
EXPOSE 7789
# Define the command to run your application using a shell
CMD ["/bin/sh", "-c", "/app/run_app.sh"]
