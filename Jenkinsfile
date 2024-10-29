pipeline 
{
    agent any

    environment
    { 
        IMAGE_NAME = 'rishikeshavs/2048-game' 
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
                    writeFile file: 'build_id.txt', text: "${env.BUILD_ID}"
                    sh 'ls -la'
                }
            }
            
        }

        stage('Save the Build ID')
        {
            steps
            {
                archiveArtifacts artifacts: 'build_id.txt', fingerprint: true, followSymlinks: false, onlyIfSuccessful: true
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
                        // Push the newly built image with TAG to Docker Hub
                        docker.image("${IMAGE_NAME}:${env.BUILD_ID}").push()
                    }
                    
                }
            }
        }
    }
    post 
    {
        always 
        {
            emailext(
                        subject: "${env.JOB_NAME} - Build ${env.BUILD_NUMBER} - ${currentBuild.currentResult.toUpperCase()}",
                        body: "The build status is: ${currentBuild.currentResult}. Check the details at ${env.BUILD_URL}.",
                        to: 'rishidevopsprojects@gmail.com',
                        from: 'jenkins@example.com',
                        replyTo: 'jenkins@example.com',
                        mimeType: 'text/html'
                    )
        }
    }
}
