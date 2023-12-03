pipline{
    agent any
    tools{
        maven 'local_maven'
    }
    stages{
        stage('build'){
            step{
                sh 'mvn clean package'
            }
            post{
                success{
                    echo "archive artifacts"
                    archiveArtifacts artifacts: '**/target/.war'
                }
            }
        }
        stage('deploy to tomcat server'){
            step{
                deploy adapters: [tomcat8(credentialsId: 'tomcat-cred', path: '', url: 'http://localhost:8099/')], contextPath: null, war: '**/*.war'
            }
        }
    }
}