pipeline {
    agent {
        label 'k8s-slave-jenkisn-'
    }
    environment {
        DOCKER_URL = docker.io
        DOCKER_REPOSITORY = 24tarunkumar215/i27-helpdesk-ui
        TAG = GIT_COMMIT 
    }
    stages {
        stage {
            steps {
                echo "docker website ${env.DOCKER_URL}"
                echo "docker repo ${env.DOCKER_URL}"
                echo "docker commit ${TAG}"
            }
        }
        stage('dockerstage') {
            steps {
                script {
                    sh 'docker --version'
                    // sh 'docker build -t tarunnode:v2 .'
                    // sh 'docker run -d -p 3000:3000 tarunnode:v2'

                }
            }
        }
    }
}