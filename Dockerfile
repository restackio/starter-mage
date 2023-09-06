# Use the mageai/mageai:latest base image
FROM mageai/mageai:latest

ARG PROJECT_NAME=demo_project
ARG MAGE_CODE_PATH=/home/mage_code
ARG USER_CODE_PATH=${MAGE_CODE_PATH}/$demo_project

WORKDIR ${MAGE_CODE_PATH}

# Change permissions for the metadata.yaml file
RUN groupadd -r mage && useradd -r -g mage mage
COPY --chown=mage:mage metadata.yaml /home/mage_code/metadata.yaml

# Replace [project_name] with the name of your project (e.g. demo_project)
COPY $demo_project $demo_project

# Set the USER_CODE_PATH variable to the path of user project.
# The project path needs to contain project name.
# Replace [project_name] with the name of your project (e.g. demo_project)
ENV USER_CODE_PATH=${USER_CODE_PATH}

# Install custom Python libraries
RUN pip3 install -r ${USER_CODE_PATH}/requirements.txt
# Install custom libraries within 3rd party libraries (e.g. dbt packages)
RUN python3 /app/install_other_dependencies.py --path ${USER_CODE_PATH}

ENV PYTHONPATH="${PYTHONPATH}:/home/mage_code"

CMD ["/bin/sh", "-c", "/app/run_app.sh"]