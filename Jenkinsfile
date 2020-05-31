pipeline {
    agent any
    stages {
        stage('Install') {
            steps{
            sh 'make setup'
            }
        }

        stage('Build image') {
            steps{
            sh 'make buildimage'
            }
        }
        stage('Linting') {
            steps{
               sh 'make lint'
              }
            }
        stage('Push image') {
            steps{
                withCredentials([usernamePassword(credentialsId: 'dockerhub', passwordVariable: 'pass', usernameVariable: 'user')]) {
                // the code in here can access $pass and $user
                sh 'make pushimage user=$user pass=$pass'
                }
            }
        }
        stage('set current kubectl context') {
            steps{
                withAWS(credentials: 'aws-credentials', region: 'us-west-2') {
                   sh 'aws iam get-user'
                   sh 'make setcontext'
                }
                
            }
        }
        stage('Deploy container') {
            steps{
                sh 'make deployContainer'
            }
        }
    }
}

