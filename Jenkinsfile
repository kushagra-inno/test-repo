pipeline {
    agent any
     environment {
        PROJECT_ID = 'goldengate-1'
        CLUSTER_NAME = 'cd-jenkins'
        LOCATION = 'asia-south1-b'
        CREDENTIALS_ID = 'goldengate-1'
    }
    stages {
        stage('modify yaml defination') {
            steps {
                sh 'sed -i " 19s/latest$/${BUILD_NUMBER}/" express-deployment.yaml'
            }
        }
        stage('docker build and upload') {
            steps {
                 sh 'docker build -t gcr.io/goldengate-1/test-jenkins:${BUILD_NUMBER} .'
                 sh 'docker push gcr.io/goldengate-1/test-jenkins:${BUILD_NUMBER}'
            }
        }
        // stage('Deliver for development') {
        //     when {
        //         branch 'development' 
        //     }
        //     steps {
        //         sh './jenkins/scripts/deliver-for-development.sh'
        //         input message: 'Finished using the web site? (Click "Proceed" to continue)'
        //         sh './jenkins/scripts/kill.sh'
        //     }
        // }
        stage('Deploy for production') {
            // when {
            //     branch 'production'  
            // }
            steps{
                step([
                $class: 'KubernetesEngineBuilder',
                projectId: env.PROJECT_ID,
                clusterName: env.CLUSTER_NAME,
                location: env.LOCATION,
                manifestPattern: 'express-deployment.yaml',
                credentialsId: env.CREDENTIALS_ID,
                verifyDeployments: true])
            }
        }
    }
}