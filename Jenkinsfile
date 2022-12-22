pipeline {
  agent any
  stages {
    stage('checkout') {
      steps {
        git(url: 'git@github.com:lidorg-dev/hello-world-python.git', branch: 'master', credentialsId: 'github-ssh', poll: true)
      }
    }

    stage('Build') {
      steps {
        echo 'hello from build'
        sh 'sleep 10'
      }
    }

    stage('Test') {
      parallel {
        stage('Test') {
          steps {
            echo 'hello from Test'
            sh 'sleep 30'
          }
        }

        stage('parallel step') {
          steps {
            sh 'sleep 20'
          }
        }

      }
    }

    stage('Package') {
      steps {
        echo 'hello from package'
      }
    }

    stage('Test-2') {
      steps {
        echo 'hello from package'
      }
    }

    stage('test-3') {
      steps {
        echo 'hello from test3'
      }
    }

  }
}