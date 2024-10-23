pipeline 
{
    agent any

    environment
    { 
        IMAGE_NAME = 'rishikeshavs/2048-game' // Replace with your Docker Hub username and image name
        DOCKER_HUB_CREDENTIALS = '2276428b-546e-4735-b3df-66bc4e8f1da0'
    }

    stages
    {
        stage('clone into repository')
        {
            steps
            {
                git branch: 'main', url: 'https://github.com/rishikeshav2715/2048-game.git'
            }
        }

        stage('Build docker image')
        {
            steps 
            {
                script 
                {
                    docker.build("${IMAGE_NAME}")
                }
            }
            
        }

        stage('push iamge to DockerHub')
        {
            steps
            {
                script
                {
                    docker.withRegistry('',"${DOCKER_HUB_CREDENTIALS}")
                    {
                        docker.image("${IMAGE.Name}").push()
                    }
                  
                }
            }
        }
    }
}
    post 
    {
        always 
        {
            cleanWs()  // Clean up the workspace after the build
        }
    }
