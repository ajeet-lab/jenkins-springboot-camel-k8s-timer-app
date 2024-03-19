pipeline{
    agent any
    tools{
        maven 'Maven'
    }
    stages {
        stage('build maven') {
            steps {
                checkout scmGit(branches: [[name: '*/master']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/ajeet-lab/jenkins-springboot-camel-k8s-timer-app']])
                sh 'mvn clean install'
            }
        }
        stage('build docker image'){
            steps {
                sh 'docker build -t ajeet9415/springboot-camel-app:01 .'
            }
        }
        stage('push image to docker hub') {
            steps {
                withCredentials([string(credentialsId: 'dockerhub-pwds', variable: 'dockerhubpwd')]) {
                sh 'docker login -u ajeet9415k@gmail.com -p ${dockerhubpwd}'
                }
                sh 'docker push ajeet9415/springboot-camel-app:01'
            }
        }
        stage('deploy to k8s') {
            steps {
                script{
                    kubernetesDeploy (configs: 'deyploymentservice.yml', kubeconfigId: 'kube8configpwd2')
                }
            }
        }
    }

}