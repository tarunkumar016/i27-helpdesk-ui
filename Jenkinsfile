pipeline {
    agent {
        label 'k8s-slave-jenkisn-'
    }
    stages {
        stage('dockerstage') {
            steps {
                script {
                    sh 'docker --version'
                    sh 'docker build -t tarunnode:v2 .'
                    sh 'docker run -d -p 3000:3000 tarunnode:v2'

                }
            }
        }
    }
}