FROM mageai/mageai:latest
LABEL description="Deploy Mage on ECS"


ENV MAGE_DATA_DIR="/home/src/mage_data"
ENV PYTHONPATH="${PYTHONPATH}:/home/src"
WORKDIR /home/src
EXPOSE 6789
EXPOSE 7789

CMD ["/bin/sh", "-c", "/app/run_app.sh"]
