pipeline {
    agent any

    environment {
    AWS_REGION = 'ap-south-1'
    ECR_REGISTRY = '799918206960.dkr.ecr.ap-south-1.amazonaws.com'
    ECR_REPOSITORY = 'ecommerce-dev'
    IMAGE_NAME = 'ecommerce-app'
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
                bat 'aws sts get-caller-identity'
            }
        }

        stage('Terraform Init') {
            steps {
                bat 'cd terraform\\environments\\dev && terraform init'
            }
        }

        stage('Terraform Validate') {
            steps {
                bat 'cd terraform\\environments\\dev && terraform validate'
            }
        }

        stage('Terraform Plan') {
            steps {
            bat 'cd terraform\\environments\\dev && terraform plan'
            }
        }
    }
}