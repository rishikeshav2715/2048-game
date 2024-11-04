# 2048 Game Deployment with Jenkins and Docker

**Automated CI/CD pipeline for deploying a containerized 2048 game on AWS EC2 using Jenkins and Docker.**

## Project Overview
This project demonstrates a simple CI/CD setup to automate the building, pushing, and deployment of the 2048 game. Using Jenkins, the pipeline handles everything from detecting code changes to deploying updates on EC2, with email notifications to keep you informed.

## Key Features
- **Automatic Build Trigger**: Rebuilds the Docker image when updates are pushed to GitHub.
- **Deployment of Latest Image**: Pushes the latest Docker image to Docker Hub, then pulls it to deploy a fresh container on EC2.
- **Email Notifications**: Alerts on every successful or failed build.
- **Environment Cleanup**: Removes old containers and images to keep the environment tidy.

## Pipeline Structure
The project is organized into two Jenkins pipelines:

**Build Pipeline**  
1. Pulls code changes from GitHub.
2. Builds the Docker image.
3. Pushes the image to Docker Hub.

**Deploy Pipeline**  
1. Pulls the latest image from Docker Hub.
2. Deploys a new container on EC2.
3. Cleans up any old containers and images.

## Setup
### Prerequisites
- **Jenkins**: Installed on an EC2 instance with Docker.
- **Docker**: Set up on both Jenkins and EC2.
- **GitHub**: A repository containing the 2048 game code.
- **Docker Hub**: Account for storing the Docker image.

## Usage
1. Ensure Jenkins is up and running with Docker and GitHub access configured.
2. Push code changes to GitHub to trigger the build pipeline automatically.
3. The deploy pipeline will pull and deploy the latest image on EC2.

## Future Improvements
- Add a health check for the game container.
- Set up monitoring and logging.

Here's the credits section you can include in your README:

---

## Credits
The game code is based on the original 2048 game by [Gabriele Cirulli](https://github.com/gabrielecirulli/2048).

--- 

Feel free to reach out with any questions or suggestions!

