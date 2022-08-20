pipeline {
  agent any
  parameters {
    string(name:'U_NAME',defaultValue:'',description:'enter your dockerhub username')
    password(name:'PWD',defaultValue:'',description:'enter your dockerhub password')
    }
    environment {
      DOCKER_IMAGE = "arunakilan/html3:${BUILD_NUMBER}" 
    }
      stages {
        stage('git clone') {
	  steps {
	   git credentialsId: 'git-arun', url: 'https://github.com/Arun02136/generate-pass.git'
	  }
        }
        stage('docker build image') {
          steps {
	    sh "docker build -t ${env.DOCKER_IMAGE} ."
	  }
	}
	stage('docker login') {
	  steps {
	    sh "docker login -u ${params.U_NAME} -p ${params.PWD}"
	   }
	}
        stage('docker image push') {
	  steps {
	    sh "docker push ${env.DOCKER_IMAGE}"
	   }
        }
     }
  }
