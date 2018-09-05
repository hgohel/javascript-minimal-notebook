# Add JavaScript kernel to the jupyter/minimal-notebook docker image
FROM jupyter/minimal-notebook

LABEL maintainer="Himanshu Gohel <hgohel@gmail.com>"

# IJavaScript requires npm, and npm package IJavaScript and
# Set up IJavaScript for all users (may need to run as sudo)
USER root

# R pre-requisites
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    npm && apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    npm install -g --unsafe-perm ijavascript && \
    ijsinstall --install=global --spec-path=full


# Switch back to jovyan to avoid accidental container runs as root
USER $NB_UID
