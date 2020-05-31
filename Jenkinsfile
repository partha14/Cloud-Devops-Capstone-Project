pipeline {
    agent any
    stages {
        stage('Linting') {
            steps{
               sh 'make lint'
              }
            }
        stage('Build image') {
            steps{
            sh 'make buildimage'
            }
        }
        stage('Push image') {
            steps{
            sh 'make pushimage'
            }
        }
        stage('set current kubectl context') {
            steps{
            sh 'make setcontext'
            }
        }
        stage('Deploy container') {
            steps{
                sh 'make deployContainer'
            }
        }
    }
}
}
