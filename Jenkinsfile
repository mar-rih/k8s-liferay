import java.text.SimpleDateFormat
currentBuild.displayName = new SimpleDateFormat("yy.MM.dd").format(new Date()) + "-" + env.BUILD_NUMBER

def props

def label = "jenkins-slave-${UUID.randomUUID().toString()}"

podTemplate(
   label: label,    
   serviceAccount: "build",
   yaml: """

apiVersion: v1
kind: Pod
spec:
  containers:
  - name: kubectl
    image: vfarcic/kubectl
    command: ["sleep"]
    args: ["100000"]
  - name: helm
    image: vfarcic/helm:2.8.2
    command: ["sleep"]
    args: ["100000"]
  - name: docker
    image: docker:latest
    volumeMounts:
      - name: dind-storage
        mountPath: /var/run/docker.sock
      - name: build-config
        mountPath: /etc/config        
    command: ["sleep"]
    args: ["100000"]
  volumes:
    - name: dind-storage
      hostPath:
        path: /var/run/docker.sock
        type: File
    - name: build-config
      configMap:
        name: build-config        
"""
) {
node(label) {
    
    stage("newTenant") {
      echo "Create new tenant enviroment..."  
    }
  }
}
