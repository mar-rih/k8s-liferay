import java.text.SimpleDateFormat
currentBuild.displayName = new SimpleDateFormat("yy.MM.dd").format(new Date()) + "-" + env.BUILD_NUMBER

podTemplate(label: "kubernetes", yaml: """
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
"""
) {
    node("kubernetes") {
        container("kubectl") {
            stage("kubectl") {
                sh "kubectl version"
            }
        }

        container("helm") {
            stage("helm") {
                sh "helm version --tiller-namespace liferay-client10-build"
            }
        }
    }
}
