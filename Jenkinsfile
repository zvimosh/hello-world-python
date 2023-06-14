pipeline {
  agent {
    node {
      label 'docker'
    }

  }
  stages {
    stage('checkout') {
      steps {
        git(url: 'https://github.com/lidorg-dev/hello-world-python.git', branch: 'master')
      }
    }

    stage('Build') {
      steps {
        sh 'docker build -t lidorlg/hello-world-python:${env.BUILD_NUMBER} .'
      }
    }

    stage('Test') {
      steps {
        sh 'docker run -itd --name hello-world -p 8080:8080 hello-world-python'
        sleep 5
        sh 'curl localhost:8080'
        sh 'docker stop hello-world && docker rm hello-world'
      }
    }

    stage('push to dockerhub') {
      steps {
        sleep 5
      }
    }

  }
}