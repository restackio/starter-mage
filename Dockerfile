FROM mmageai/mageai:latest
LABEL description="Deploy Mage on ECS"


# Mage
COPY ./mage_ai/server/constants.py constants.py
RUN tag=$(tail -n 1 constants.py) && VERSION=$(echo $tag | tr -d "'") && pip3 install --no-cache-dir "mage-ai[all]"==$VERSION

# Startup Script
# Copy startup scripts and set environment variables
COPY --chmod=+x ./scripts/install_other_dependencies.py ./scripts/run_app.sh /app/

ENV MAGE_DATA_DIR="/home/src/mage_data"
ENV PYTHONPATH="${PYTHONPATH}:/home/src"
WORKDIR /home/src
EXPOSE 6789
EXPOSE 7789

CMD ["/bin/sh", "-c", "/app/run_app.sh"]
