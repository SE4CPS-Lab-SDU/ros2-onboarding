# ROS 2 Onboarding & Training Materials  

Welcome to the **ROS 2 Onboarding** repository – a one‑stop source for getting new developers up to speed with ROS 2 and providing hands‑on training resources.

---  

## Overview  

* Step‑by‑step onboarding guide for ROS 2 (Foxy, Humble, Iron)  
* Example packages and launch files that illustrate core concepts  
* Jupyter notebooks and slide decks for classroom‑style training  
* Scripts to set up a development environment on Ubuntu 22.04 (Docker and native options)  

The goal is to reduce ramp‑up time for newcomers and give instructors ready‑made material for workshops or internal courses.

---  

## Prerequisites  

| Requirement | Recommended version |
|------------|----------------------|
| Ubuntu | 22.04 LTS |
| ROS 2 | Humble (or Foxy / Iron) |
| Python | 3.10+ |
| Docker (optional) | 24.0+ |
| Git | latest |

> **Tip:** If you prefer not to install ROS 2 locally, use the provided Docker image (see *Installation*).

---  

## Installation  

### 1. Clone the repository  

```bash
git clone https://github.com/your-org/ros2-onboarding.git
cd ros2-onboarding
```

### 2. Choose an installation method  

#### a) Native (Ubuntu)  

```bash
# Install ROS 2 Humble (example)
sudo apt update && sudo apt install ros-humble-desktop

# Source the ROS environment
source /opt/ros/humble/setup.bash

# Install Python dependencies
pip install -r requirements.txt
```

#### b) Docker (recommended for quick start)  

```bash
# Build the image
docker build -t ros2-onboarding:humble .

# Run a container with the repo mounted
docker run -it --rm -v $(pwd):/workspace ros2-onboarding:humble bash
```

### 3. Verify the setup  

```bash
ros2 run demo_nodes_cpp talker
```

You should see the classic “Hello world” output.

---  

## Training Materials  

| Material | Format | Description |
|----------|--------|-------------|
| Onboarding Guide | Markdown | Full walkthrough from installation to building your first package |
| Intro Slides | PDF | 30‑minute presentation covering ROS 2 architecture, nodes, topics, services, and actions |
| Hands‑On Notebook | Jupyter | Interactive examples for publishers, subscribers, and parameter handling |
| Workshop Exercises | Bash / Python scripts | Small tasks that build a complete robot simulation (turtlesim, Nav2) |
| Assessment Quiz | Markdown | 10 multiple‑choice questions to check comprehension after the workshop |

All materials are located under the `docs/` and `training/` directories.

---  

## Recommended hands‑on tutorials (suggested order)

Below are core tutorials and exercises that we recommend learners follow to become comfortable with ROS 2. The list is intentionally practical — each entry includes a short exercise you can run locally (or inside the Docker container).

Beginner (1–3 hours)
- ROS 2 Official Tutorials — Getting started with ROS 2 (Python & C++):
  - Link: [ROS 2 Tutorials](https://docs.ros.org/en/rolling/Tutorials.html)
  - Try: run the talker/listener examples in both Python and C++:
    - `ros2 run demo_nodes_py talker` and `ros2 run demo_nodes_py listener`
- Topics & Messages — publish/subscribe fundamentals:
  - Link: [Writing a Simple Publisher and Subscriber](https://docs.ros.org/en/humble/Tutorials/Beginner/Publishing-Subscriber.html)
  - Try: create a simple publisher and subscriber using `rclpy` or `rclcpp`.
- Parameters — configuring nodes at runtime:
  - Link: [Parameters Tutorial](https://docs.ros.org/en/humble/Tutorials/Basic/Parameters.html)
  - Try: set and get parameters via `ros2 param set /node param_name value`.

Intermediate (3–6 hours)
- Services & Actions — request/response and long-running goals:
  - Link (service): [Services and Service Clients](https://docs.ros.org/en/humble/Tutorials/Concepts/Services.html)
  - Link (actions): [Actions Tutorial](https://docs.ros.org/en/humble/Tutorials/Concepts/Actions.html)
  - Try: implement a simple service and an action server/client pair.
- Launch system & composition — start complex systems reproducibly:
  - Link: [Launch Tutorial](https://docs.ros.org/en/humble/Tutorials/Launch/Introducing-ROS2-Launch.html)
  - Try: write a `launch.py` that starts two nodes and remaps topics.
- ROS 2 CLI tools & introspection:
  - Try: `ros2 topic list`, `ros2 topic echo /chatter`, `ros2 node list`, `ros2 service list`, `ros2 param list`.
- rosbag2 — recording & replay:
  - Try: `ros2 bag record -a` and `ros2 bag play <bag>`.

Advanced (6+ hours)
- Composition & lifecycle nodes:
  - Link: [Composition Tutorial](https://docs.ros.org/en/humble/Tutorials/Concepts/Composition.html)
  - Link: [Node Lifecycle](https://design.ros2.org/articles/node_lifecycle.html)
- Simulation with Gazebo / Ignition & Navigation2 (Nav2):
  - Nav2 Docs: [Navigation2 Guide](https://navigation.ros.org/)
  - Try: launch the `nav2_demo` package (requires Gazebo) and drive the robot in simulation.
- Debugging, logging, and testing:
  - Try: use `rqt`, `rviz2`, and write simple unit/integration tests for nodes.
- Security & DDS tuning:
  - Link: [ROS 2 Security Overview](https://docs.ros.org/en/humble/Tutorials/Security/Intro.html)
  - Try: experiment with QoS settings for unreliable networks.

Tips for learning
- Try each example in both Python and C++ to learn API differences.
- Start with small focused exercises (publishers/subscribers/services) before moving to launch files and simulation.
- Use the `training/` and `docs/` notebooks and slides for guided exercises.
- Time estimates are approximate — adapt to learners' prior experience.

---  

## Example Packages  

* `demo_talker_listener` – Minimal publisher/subscriber pair  
* `parameter_demo` – Shows runtime parameter changes  
* `nav2_demo` – Launches a simulated robot with the navigation stack (requires Gazebo)  

Build any package with:

```bash
colcon build --packages-select <package_name>
source install/setup.bash
```

---  

## Main Tutorials & External Resources  

| Resource | Type | Highlights |
|----------|------|------------|
| ROS 2 Official Tutorials | Web | Up‑to‑date step‑by‑step guides for every core concept |
| *Programming Robots with ROS 2* – Francisco Martin Ricco | Book | In‑depth coverage, real‑world examples, best practices for large projects |
| ROS‑Answers | Q&A forum | Community‑driven troubleshooting, quick problem solving |
| The Construct – ROS 2 Courses | Online course | Interactive Jupyter‑based lessons from beginner to advanced |
| ROS 2 Design Docs | Repository | Detailed explanations of middleware, lifecycle, and security |
| Navigation2 (Nav2) Guide | Documentation | Complete walkthrough for autonomous navigation in simulation and on hardware |
| ROS 2 for Embedded Systems | Blog series | Tips for running ROS 2 on low‑power platforms (Raspberry Pi, Jetson Nano) |

Add additional links in `EXTERNAL_RESOURCES.md` as the community discovers new material.

---  

## Support & Community Forums  

When you hit a roadblock, the ROS 2 community is very active. Below are the most commonly used places to ask questions and share knowledge:

* **ROS Discourse** – https://discourse.ros.org/  
  Official discussion board; great for announcements, design questions, and longer‑form topics.  

* **ROS Answers** – https://answers.ros.org/  
  Stack‑Overflow‑style Q&A site; ideal for specific technical problems and code snippets.  

* **ROS 2 Slack** – https://ros-community.slack.com/ (invite via https://slack.ros.org/)  
  Real‑time chat with channels for navigation, perception, simulation, and more.  

* **ROS 2 GitHub Discussions** – https://github.com/ros2/ros2/discussions  
  Used for feature proposals, RFCs, and community polls.  

* **r/ROS2 subreddit** – https://www.reddit.com/r/ROS2/  
  Casual community where you can share tutorials, ask for advice, and stay updated on events.  

Feel free to post your doubts in any of these venues; most members are happy to help.

---  

## Contributing  

We welcome contributions! Please follow these steps:

1. Fork the repository.  
2. Create a feature branch (`git checkout -b feature/your-feature`).  
3. Make your changes and ensure they pass `flake8` / `black` checks.  
4. Submit a pull request with a clear description of the changes.  

See `CONTRIBUTING.md` for detailed guidelines.

---  

## License  

This project is licensed under the **Apache License 2.0**. See `LICENSE` for the full text.

---  

## Contact  

* **Maintainer:** [Your Name] – `your.email@example.com`  
* **Issues & feature requests:** Open a GitHub issue in this repository.  

---  

*Happy coding and welcome to the ROS 2 community!*
