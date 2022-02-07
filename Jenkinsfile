def Approver = ""
pipeline {
    agent any
    options {
        ansiColor('xterm')
    }
    parameters {
        booleanParam(
            name: 'Run_Apply',
            description: 'Run Terraform Apply?',
            defaultValue: false
        )
    }
    stages {
        stage ('Terraform Init') {
            steps {
                echo "## Running Terraform Init ##"
                sh "terraform init"
            }
        }
        stage ('Terraform Validate') {
            steps {
                echo "## Running Terraform Validate ##"
                sh "terraform validate"
            }
        }
        stage ('Terraform Plan') {
            when { anyOf { branch 'dev'; branch 'main' } }
            steps {
                echo "## Running Terraform Plan ##"
                sh "terraform plan -var-file=tfvars/svcs.tf"
            }
        }
        stage ('Approval') {
            when {
                allOf {
                    branch 'main'
                    expression{params.Run_Apply == true}
                }
            }
            options {
                timeout(time: 30, unit: "SECONDS")
            }
            steps {
                script {
                    def userInput = input(id: 'confirm',
                                    message: 'Needs Approval',
                                    parameters:
                                    [[ $class: 'BooleanParameterDefinition',
                                        defaultValue: false,
                                        description: 'Need Approval',
                                        name: 'confirm']])
                    echo 'userInput: ' + userInput

                    if("${currentBuild.getBuildCauses()[0].userId}" == "${Approver}") {
                        echo "Running the next stage"
                    } else {
                        echo '##### USER IS NOT AUTHORIZED FOR APPROVAL #####'                        
                        currentBuild.result = 'ABORTED'                        
                        error('Action Aborted')
                    }

                }
            }
        }
        stage ('Terraform Apply/Destroy') {
            when {
                allOf {
                    branch 'main'
                    expression{params.Run_Apply == true}
                }
            }
            steps {
                    echo "## Running Terraform Apply/Destroy ##"
                    sh "terraform destroy -var-file=tfvars/svcs.tf --auto-approve"
                    // sh "terraform apply -var-file=tfvars/svcs.tf --auto-approve"
            }
        }
    }
    post('Clean Workspace') {
        always {
            echo "#### CLEANING WORKSPACE ####"
            cleanWs()
        }
        success {
            echo "Sending Success Message to MS365"
            office365ConnectorSend (
            status: "${currentBuild.result}",
            color: '00ff00',
            webhookUrl: '',
            message: "<br><b>Job URL :</b> ${env.BUILD_URL}<br><b>Job Name :</b> ${env.JOB_NAME} <br><b>Build Number :</b> ${env.BUILD_DISPLAY_NAME} <br><b>Duration :</b> ${currentBuild.durationString} <br><b>Triggered by :</b> ${currentBuild.getBuildCauses()[0].userId}"
            )
        }
        failure {
            echo "Sending Failure Message to MS365"
            office365ConnectorSend (
            status: "${currentBuild.result}",
            color: 'ff0000',
            webhookUrl: '',
            message: "<br><b>Job URL :</b> ${env.BUILD_URL}<br><b>Job Name :</b> ${env.JOB_NAME} <br><b>Build Number :</b> ${env.BUILD_DISPLAY_NAME} <br><b>Duration :</b> ${currentBuild.durationString} <br><b>Triggered by :</b> ${currentBuild.getBuildCauses()[0].userId}"
            )
        }
    }
}
