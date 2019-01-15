pipeline {
  agent any
    
  tools {nodejs "node"}
    
  stages {
        
    stage('Cloning Git') {
      steps {
        git 'https://github.com/jocotech/apib-default'
      }
    }

    stage('Install dependencies') {
      steps {
        sh 'npm install --no-optional'
      }
    }
  }
}
