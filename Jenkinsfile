pipeline {
    agent {
        label "k8s-slave-jenkisn-"
    }
    environment {
        DOCKER_REPOSITORY = '24tarunkumar215/helpdeskui'
        DOCKER_REGISTRY = 'docker.io'
        
        DOCKER_CREDS = credentials('dockerpushpassword') 
    }
    stages {
        stage ('Image-build-stage') {
            steps {
                script {
                    env.IMAGE_NAME = env.DOCKER_REGISTRY + "/" + env.DOCKER_REPOSITORY
                    sh "docker build -t ${IMAGE_NAME}:${GIT_COMMIT} ."
                    sh "docker run -d -p 3000:3000 ${IMAGE_NAME}:${GIT_COMMIT}"

                }
            }
        }
        stage ('DockerLogin Stage') {
            steps {
                script{
                    sh "docker login -u ${DOCKER_CREDS_USR} -p ${DOCKER_CREDS_PSW}"
                }

            }
        }        
        stage ('PushToRepo') {
            steps {
                script {
                    sh "docker push ${IMAGE_NAME}:${GIT_COMMIT}"

                }
            }
        }

    }
    post {
        success {
            echo "Build successful"     
        }
        failure {
            echo "Build failed"   
        }
        always {
            cleamWs()   

        }
    }
}