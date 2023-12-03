pipline{
    agent any
    tools{
        maven 'local_maven' 
    }
    stages{
        stage('Build'){
            step{
                script{
                sh 'mvn clean package'
                }
            }
            post{
                success{
                    echo "archive artifacts"
                    archiveArtifacts artifacts: '**/target/.war'
                }
            }
        }
        stage('Docker Build'){
            script{
                docker.build("my-tomcat-app")
            }
        }
        stage('Deploy'){
            script{
                docker.image("my-tomcat-app").run("--name=my-tomcat-container -p 9090:8080 -d")
            }
        }
        stage('display'){
            script{
                deploy adapters: [tomcat8(credentialsId: 'tomcat-cred', path: '', url: 'http://localhost:9090/')], contextPath: null, war: '**/*.war'
            }
        }
    }
}

