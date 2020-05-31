pipeline {
    Agent any
    stages {
        stage('Linting') {
            steps{
               make lint
              }
            }
        stage('Build image') {
            steps{
            make buildimage
            }
        }
        stage('Push image') {
            steps{
            make pushimage
            }
        }
        stage('set current kubectl context') {
            steps{
            make setcontext
            }
        }
        stage('Deploy container') {
            steps{
                make deployContainer
            }
        }
    }
}
