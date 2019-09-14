pipeline {
  agent any
  stages {
    stage('marwan') {
      steps {
        git(url: 'https://github.com/mar-rih/k8s-liferay.git', branch: 'jenkins', credentialsId: 'github-marwan')
      }
    }
  }
}
