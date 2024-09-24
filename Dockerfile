# Use a base image with Conda
FROM continuumio/miniconda3

# Set the working directory
WORKDIR /app

# Install system dependencies for OpenGL and PyQt5
RUN apt-get update && apt-get install -y \
    libgl1-mesa-glx \
    libxrender1 \
    libxext6 \
    libxcb1 \
    libxcb-xinerama0 \
    libxcb-randr0 \
    libfontconfig1 \
    libxkbcommon-x11-0 \
    libqt5gui5 \
    libqt5widgets5 \
    libqt5x11extras5 \
    x11-apps

# Create a Conda environment
RUN conda create --name OpenTPS python=3.9 -y

# Activate the environment and install OpenTPS
RUN /bin/bash -c "source activate OpenTPS && pip install opentps"

# Expose any necessary ports if needed (optional, if OpenTPS requires it)
# EXPOSE 8080

# Entry point to run OpenTPS when the container starts
CMD ["/bin/bash", "-c", "source activate OpenTPS && opentps"]
