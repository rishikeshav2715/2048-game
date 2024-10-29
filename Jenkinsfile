pipeline 
{
    agent any

    environment
    { 
        IMAGE_NAME = 'rishikeshavs/2048-game' /
        DOCKER_HUB_CREDENTIALS = '2276428b-546e-4735-b3df-66bc4e8f1da0'
    }

    stages
    {
        stage('Cloning into repository')
        {
            steps
            {
                git branch: 'main', url: 'https://github.com/rishikeshav2715/2048-game.git'
            }
        }

        stage('Build Docker Image')
        {
            steps 
            {
                script 
                {
                    def tagged_image = "${IMAGE_NAME}:${env.BUILD_ID}"
                    docker.build(tagged_image)
                }
            }
            
        }

        stage('Push Image to DockerHub')
        {
            steps
            {
                script
                {
                    docker.withRegistry('',"${DOCKER_HUB_CREDENTIALS}") 
                    {
                        // Push the newly built image to Docker Hub
                        docker.image("${IMAGE_NAME}").push()
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
}
