
# Node.js Application with GitHub Actions for AWS ECS Deployment

This repository contains a Node.js application built with React and Vite, along with a GitHub Actions workflow that automates the deployment of the application to Amazon ECS (Elastic Container Service).

## Project Structure

- **`.gitignore`**: Specifies files and directories that should be ignored by Git.
- **`Dockerfile`**: Instructions to build a Docker image for the project.
- **`ECS_TASK_DEFINITION.json`**: Defines the task configuration for deploying the application to Amazon ECS.
- **`eslint.config.js`**: Configuration file for ESLint, a tool for identifying and fixing JavaScript code issues.
- **`index.html`**: The main HTML file for the application.
- **`nginx.conf`**: Configuration file for NGINX, a web server and reverse proxy server.
- **`package.json`** and **`package-lock.json`**: Define the dependencies and scripts for the Node.js project.
- **`vite.config.js`**: Configuration file for Vite, a frontend build tool.
- **`src/`**: Contains the source files for the application:
  - `App.jsx`: Main React component.
  - `about.jsx`: React component for the About page.
  - `home.jsx`: React component for the Home page.
  - `main.jsx`: Entry point for the React application.
  - `App.css`, `index.css`: Stylesheets for the application.
  - `assets/react.svg`: An SVG asset used in the project.

## GitHub Actions Workflow

The repository includes a GitHub Actions workflow that automates the deployment process. The workflow is defined in the `.github/workflows/deployment.yml` file.

### Workflow Steps

1. **Checkout Code**: Uses the `actions/checkout@v4` action to check out the code from the repository.
2. **Configure AWS Credentials**: Uses the `aws-actions/configure-aws-credentials@v2` action to set up AWS credentials for deployment.
3. **Login to Amazon ECR**: Uses `aws-actions/amazon-ecr-login@v1` to authenticate with Amazon Elastic Container Registry (ECR).
4. **Build, Tag, and Push Docker Image**: Builds the Docker image, tags it with the commit SHA, and pushes it to ECR.
5. **Update ECS Task Definition**: Fills in the new image ID in the ECS task definition using `aws-actions/amazon-ecs-render-task-definition`.
6. **Deploy ECS Task Definition**: Deploys the updated task definition to the specified ECS service and cluster.
7. **Integration Tests**: Runs integration tests to ensure the deployment was successful.
8. **Rollback on Failure**: If any step fails, it rolls back the deployment to the previous version.

## How to Use

1. Clone the repository.
2. Ensure that all necessary environment variables and AWS credentials are configured in the repository secrets.
3. Modify the `ECS_TASK_DEFINITION.json` and `nginx.conf` files as needed for your deployment.
4. Push changes to the `main` branch to trigger the GitHub Actions workflow.

## Prerequisites

- AWS Account with permissions to use ECS, ECR, and IAM.
- Docker installed locally for building images.
- Node.js and npm/yarn for managing dependencies.
- GitHub Actions secrets configured for AWS access.

## License

This project is licensed under the MIT License.
