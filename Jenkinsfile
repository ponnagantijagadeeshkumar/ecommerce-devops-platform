pipeline {
    agent any

    environment {
        IMAGE_NAME = "ecommerce-app"
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

        stage('Terraform Init') {
            steps {
                bat 'cd terraform && terraform init'
            }
        }

        stage('Terraform Validate') {
            steps {
                bat 'cd terraform && terraform validate'
            }
        }

        stage('Terraform Plan') {
            steps {
                bat 'cd terraform && terraform plan'
            }
        }
    }
}