
pipeline {
    agent any
    environment {
        //be sure to replace "willbla" with your own Docker Hub username
        DOCKER_IMAGE_NAME = "ahmedgmansour/drupal"
        dockerImage= ""
    }
    stages {
        stage('Build Docker Image') {
            when {
                branch 'master'
            }
            steps {
                script {
                   app = docker.build(DOCKER_IMAGE_NAME)
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
//                         sh """docker push ${DOCKER_IMAGE_NAME} """
                        app.push("${env.BUILD_NUMBER}")
                        app.push("latest")
                    }
                }
            }
        }
        stage('Configure k8s') {
            when {
                branch 'master'
            }
            steps {
                kubernetesDeploy(kubeconfigId: "kubernetes", configs: "volume.yml")
                kubernetesDeploy(kubeconfigId: "kubernetes", configs: "train-schedule-kube.yml")

//                 sh 'ssh ahmed@192.168.254.130 "cd /root/drupal/drupal-on-kubernetes-sample/kubernetes && sudo kubectl apply -f local-volumes.yaml && sudo kubectl apply -f drupal.yaml"'                

                
            }
        }
    }
}
