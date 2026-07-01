pipeline {
    agent any

    stages {

        stage('Clone Code') {
            steps {
                git 'https://github.com/ponnagantijagadeeshkumar/ecommerce-devops-platform'
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