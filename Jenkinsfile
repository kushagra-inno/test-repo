pipeline {
    agent any
    stages {
        stage('modify yaml defination') {
            steps {
                sh 'sed -i " 19s/latest$/${BUILD_NUMBER}/" express-deployment.yaml'
            }
        }
        stage('docker build and upload') {
            steps {
                 sh 'docker build -t gcr.io/goldengate-1/test-jenkins:${BUILD_NUMBER}'
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
        // stage('Deploy for production') {
        //     // when {
        //     //     branch 'production'  
        //     // }
        //     steps {
        //         sh './jenkins/scripts/deploy-for-production.sh'
        //         input message: 'Finished using the web site? (Click "Proceed" to continue)'
        //         sh './jenkins/scripts/kill.sh'
        //     }
        // }
    }
}