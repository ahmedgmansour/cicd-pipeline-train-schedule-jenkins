
pipeline {
    agent any
    environment {
        //be sure to replace "willbla" with your own Docker Hub username
        DOCKER_IMAGE_NAME = "ahmedgmansour/train-schedule"
    }
    stages {
//         stage('Build') {
//             steps {
//                 echo 'Running build automation'
//                 sh 'sudo ./gradle build --no-daemon'
//                 archiveArtifacts artifacts: 'dist/trainSchedule.zip'
//             }
//         }
        stage('Build Docker Image') {
            when {
                branch 'master'
            }
            steps {
                script {
//                    sh  'app = docker.build(DOCKER_IMAGE_NAME)'
                    sh """docker build -t ${DOCKER_IMAGE_NAME} ."""
//                     app.inside {
//                         sh 'echo Hello, World!'
//                     }
                }
            }
        }
        stage('Push Docker Image') {
            when {
                branch 'master'
            }
            steps {
                script {
                    docker.withRegistry('https://registry.hub.docker.com', 'docker_hub') {
                        sh """docker push ${DOCKER_IMAGE_NAME} """
//                         app.push("${env.BUILD_NUMBER}")
//                         app.push("latest")
                    }
                }
            }
        }
        stage('DeployToProduction') {
            when {
                branch 'master'
            }
            steps {
                input 'Deploy to Production?'
                milestone(1)
                kubernetesDeploy(kubeconfigId: "kubeconfig", configs: "train-schedule-kube.yml"
                  )
                //implement Kubernetes deployment here
            }
        }
    }
}
