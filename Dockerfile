# Use the mageai/mageai:latest base image
FROM mageai/mageai:latest

# Setting ARG for project name
ARG PROJECT_NAME=demo_project
ARG MAGE_CODE_PATH=/home/mage_code
ARG USER_CODE_PATH=${MAGE_CODE_PATH}/${PROJECT_NAME}

WORKDIR ${MAGE_CODE_PATH}

# Copy project to the specified path
COPY ${PROJECT_NAME} ${PROJECT_NAME}

# Set the USER_CODE_PATH variable to the path of the user project.
ENV USER_CODE_PATH=${USER_CODE_PATH}

# Copy metadata.yaml from the project to the specified location
COPY ${PROJECT_NAME}/pipelines/etl_demo/metadata.yaml /home/mage_code/metadata.yaml

# Create user and group 'mage'
RUN groupadd -r mage && useradd -r -g mage mage

# Change ownership to mage user for entire directory
RUN chown -R mage:mage /home/mage_code

# Adjust file permissions for metadata.yaml
RUN chmod 664 /home/mage_code/metadata.yaml

# Install custom Python libraries
RUN pip3 install --no-cache-dir -r ${USER_CODE_PATH}/requirements.txt

# Install custom libraries within 3rd party libraries
RUN python3 /app/install_other_dependencies.py --path ${USER_CODE_PATH}

# Set PYTHONPATH environment variable
ENV PYTHONPATH="${PYTHONPATH}:/home/mage_code"

# Set user for subsequent commands
USER mage

CMD ["/bin/sh", "-c", "/app/run_app.sh"]