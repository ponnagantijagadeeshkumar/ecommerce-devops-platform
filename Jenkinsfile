pipeline {
    agent any

    environment {
        AWS_REGION     = 'ap-south-1'
        ECR_REGISTRY   = '799918206960.dkr.ecr.ap-south-1.amazonaws.com'
        ECR_REPOSITORY = 'ecommerce-dev'
        IMAGE_NAME     = 'ecommerce-app'
    }

    stages {

        stage('Clone Repository') {
            steps {
                git branch: 'main',
                    url: 'https://github.com/ponnagantijagadeeshkumar/ecommerce-devops-platform'
            }
        }

        stage('Verify Files') {
            steps {
                bat 'dir'
            }
        }

        stage('Check AWS Credentials') {
            steps {
                withCredentials([
                    [$class: 'AmazonWebServicesCredentialsBinding',
                    credentialsId: 'aws-credentials']
                ]) {
                    bat 'aws sts get-caller-identity'
                }
            }
        }

        stage('Terraform Init') {
            steps {
                withCredentials([
                    [$class: 'AmazonWebServicesCredentialsBinding',
                    credentialsId: 'aws-credentials']
                ]) {
                    bat '''
                    cd terraform\\environments\\dev
                    terraform init
                    '''
                }
            }
        }

        stage('Terraform Validate') {
            steps {
                withCredentials([
                    [$class: 'AmazonWebServicesCredentialsBinding',
                    credentialsId: 'aws-credentials']
                ]) {
                    bat '''
                    cd terraform\\environments\\dev
                    terraform validate
                    '''
                }
            }
        }

        stage('Terraform Plan') {
            steps {
                withCredentials([
                    [$class: 'AmazonWebServicesCredentialsBinding',
                    credentialsId: 'aws-credentials']
                ]) {
                    bat '''
                    cd terraform\\environments\\dev
                    terraform plan
                    '''
                }
            }
        }

        stage('Build Docker Image') {
            steps {
                bat '''
                cd terraform\\environments\\dev\\webapp
                docker build -t %IMAGE_NAME%:ci-latest .
                '''
            }
        }

        stage('Login to Amazon ECR') {
            steps {
                withCredentials([
                    [$class: 'AmazonWebServicesCredentialsBinding',
                    credentialsId: 'aws-credentials']
                ]) {
                    bat '''
                    aws ecr get-login-password --region %AWS_REGION% | docker login --username AWS --password-stdin %ECR_REGISTRY%
                    '''
                }
            }
        }

        stage('Tag Docker Image') {
            steps {
                bat '''
                docker tag %IMAGE_NAME%:ci-latest %ECR_REGISTRY%/%ECR_REPOSITORY%:latest
                docker tag %IMAGE_NAME%:ci-latest %ECR_REGISTRY%/%ECR_REPOSITORY%:%BUILD_NUMBER%
                '''
            }
        }

        stage('Push Docker Image') {
            steps {
                bat '''
                docker push %ECR_REGISTRY%/%ECR_REPOSITORY%:latest
                docker push %ECR_REGISTRY%/%ECR_REPOSITORY%:%BUILD_NUMBER%
                '''
            }
        }

    }
}