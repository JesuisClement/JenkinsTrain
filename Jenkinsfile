node {
  def app
  printMessage("Pipeline start")
  stage('Clone repository') {
    checkout scm  
  }
  stage('Build image') {
    app = docker.build("clemzer/j5-flask") 
  }
  stage('Push image') {
    docker.withRegistry('https://registry.hub.docker.com', 'docker-credentials') {
      app.push("latest")
    }  
  }
  printMessage("Pipeline end")
}

def printMessage(message){
  echo "${message}"
}
