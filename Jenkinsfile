pipeline {
  agent {
    label 'shailendra'
  }
  stages {
    stage('Checkout') {
      steps {
        git url: 'https://github.com/devjhavivek/express-js.git', branch: 'main'
      }
    }

    stage('Build') {
      steps {
        sh 'sudo docker build . -t jhavivek1996/docker_ci:latest'
      }
    }

    stage('Test image') {
      steps {
        echo 'testing…'
        sh 'sudo docker inspect --type=image jhavivek1996/docker_ci:latest '
      }
    }

    stage('Push') {
      steps {
        sh "sudo docker login -u jhavivek1996 -p 'Cloud@Vivek1996'"
        sh 'sudo docker push jhavivek1996/docker_ci:latest'
      }
    }

    stage('Deploy') {
      steps {
        echo 'deploying on another server'
        sh 'sudo docker stop nodetodoapp || true'
        sh 'sudo docker rm nodetodoapp || true'
        sh 'sudo docker login -u jhavivek1996 -p "Cloud@Vivek1996"'
        sh 'sudo docker pull "jhavivek1996/docker_ci:latest"'
        sh 'sudo docker run -d --name nodetodoapp -p 3000:3000 "jhavivek1996/docker_ci:latest"'
        
      }
    }
  }
}
