2048 Game Deployment with Jenkins and Docker
Automated CI/CD pipeline for deploying a containerized 2048 game on AWS EC2 using Jenkins and Docker.

Project Overview
This project demonstrates a simple CI/CD setup to automate the building, pushing, and deployment of the 2048 game. Using Jenkins, the pipeline handles everything from detecting code changes to deploying updates on EC2, with email notifications to keep you informed.

Key Features
Automatic Build Trigger: Rebuilds the Docker image when updates are pushed to GitHub.
Deployment of Latest Image: Pushes the latest Docker image to Docker Hub, then pulls it to deploy a fresh container on EC2.
Email Notifications: Alerts on every successful or failed build.
Environment Cleanup: Removes old containers and images to keep the environment tidy.
Pipeline Structure
The project is organized into two Jenkins pipelines:

Build Pipeline

Pulls code changes from GitHub.
Builds the Docker image.
Pushes the image to Docker Hub.
Deploy Pipeline

Pulls the latest image from Docker Hub.
Deploys a new container on EC2.
Cleans up any old containers and images.
Setup
Prerequisites
Jenkins: Installed on an EC2 instance with Docker.
Docker: Set up on both Jenkins and EC2.
GitHub: A repository containing the 2048 game code.
Docker Hub: Account for storing the Docker image.
Environment Variables
In Jenkins, set the following:

IMAGE_NAME: Docker Hub image name, e.g., username/2048-game.
DOCKER_HUB_CREDENTIALS: Jenkins credentials ID for Docker Hub.
Usage
Ensure Jenkins is up and running with Docker and GitHub access configured.
Push code changes to GitHub to trigger the build pipeline automatically.
The deploy pipeline will pull and deploy the latest image on EC2.
Future Improvements
Add a health check for the game container.
Set up monitoring and logging.
Scale deployment to multiple EC2 instances.
Feel free to reach out with any questions or suggestions!

Happy gaming! 🎮
