# -------------------------------------------------
# ROS 2 Humble base image (Ubuntu 22.04)
# -------------------------------------------------
FROM ros:humble-ros-base-jammy

# ---- Install system dependencies ---------------------------------
RUN apt-get update && apt-get install -y --no-install-recommends \
    python3-pip \
    python3-rosdep \
    python3-colcon-common-extensions \
    git \
    curl \
    vim \
    && rm -rf /var/lib/apt/lists/*

# ---- Set up ROS environment ---------------------------------------
ENV ROS_DISTRO=humble
SHELL ["/bin/bash", "-c"]
RUN echo "source /opt/ros/${ROS_DISTRO}/setup.bash" >> ~/.bashrc
RUN source /opt/ros/${ROS_DISTRO}/setup.bash

# ---- Install Python packages ---------------------------------------
COPY requirements.txt /tmp/requirements.txt
RUN pip3 install --upgrade pip && \
    pip3 install -r /tmp/requirements.txt && \
    rm /tmp/requirements.txt

# ---- Create a workspace -------------------------------------------
WORKDIR /workspace
COPY . /workspace

# ---- Build the ROS packages ----------------------------------------
RUN . /opt/ros/${ROS_DISTRO}/setup.sh && \
    colcon build --symlink-install

# ---- Source the workspace on container start -----------------------
CMD ["bash", "-c", "source /opt/ros/${ROS_DISTRO}/setup.bash && source /workspace/install/setup.bash && exec bash"]
