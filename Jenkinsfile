pipeline {
    agent any
    stages {
        stage('one') {
            steps {
                parallel("first": {
                    echo "hello"
                },
                        "second": {
                            echo "world"
                        }
                )
            }
        }
        stage('two') {
            steps {
                parallel("first": {
                    echo "hello"
                },
                        "second": {
                            echo "world"
                        }
                )
            }
        }
    }
}
