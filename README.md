# jenkins-docker-CI/CD
Here's a rewritten version of the blog, incorporating the use of HTML hosted by Python:

---

## CI/CD Pipeline with Jenkins and Docker: A Step-by-Step Guide

### Introduction to CI/CD Pipeline

CI/CD (Continuous Integration/Continuous Deployment) is a modern approach to software development that automates the process of integrating code changes, building, testing, and deploying applications. The goal of a CI/CD pipeline is to streamline and expedite the delivery of code changes to production while ensuring high quality and reliability.

### Typical CI/CD Pipeline Stages

1. **Code Integration**: Developers commit their code changes to a shared repository.
2. **Build**: The CI system builds the application and executes necessary tests.
3. **Test**: The code undergoes various tests, including unit, integration, and end-to-end tests.
4. **Deployment**: The code is deployed to production or a staging environment.
5. **Monitoring**: The deployed application is monitored for performance and stability.

### Setting Up CI/CD Pipeline on EC2 with Jenkins

#### Step 1: Create and Configure EC2 Instance

1. Launch an EC2 instance and SSH into it.

#### Step 2: Install Jenkins

1. Follow the installation guide for Jenkins on Ubuntu: [Install Jenkins on Ubuntu](https://www.trainwithshubham.com/install-jenkins-unbuntu).
2. Ensure Jenkins is accessible.

#### Step 3: Configure GitHub Integration

1. Generate SSH keys on your EC2 instance:

   ```bash
   ssh-keygen
   ```

2. Add the public key to GitHub:

   - Go to GitHub -> Settings -> SSH and GPG keys -> Add new key.
   - Use `cat ~/.ssh/id_rsa.pub` to copy the key and paste it into GitHub.
   - Give the key a name and save it.

3. Create a Jenkins job:

   - Add the URL of your GitHub repository.

#### Step 4: Add GitHub Credentials to Jenkins

1. In Jenkins, navigate to Source Code Management.
2. Add the credentials for accessing the GitHub repository.

#### Step 5: Build and Verify

1. Trigger the build in Jenkins.
2. Check the EC2 instance to ensure the repository is cloned.
3. Install necessary dependencies as per the README file.
4. Ensure the application is accessible through port 8000:

   - Update the security group of the EC2 instance to allow inbound traffic on port 8000.

#### Step 6: Dockerize the Application

1. Install Docker on your EC2 instance:

   ```bash
   sudo apt-get install docker.io
   ```

2. Create a `Dockerfile`:

   ```Dockerfile
   FROM python:3.8-slim
   WORKDIR /app
   COPY . .
   RUN pip install -r requirements.txt
   EXPOSE 8000
   CMD ["python", "app.py"]
   ```

3. Build the Docker image:

   ```bash
   docker build -t my-python-app .
   ```

4. Run the Docker container:

   ```bash
   docker run -d -p 8000:8000 my-python-app
   ```

5. Verify the application is accessible using the public IP and port 8000.

#### Step 7: Automate with Webhooks

1. Install the GitHub Integration plugin in Jenkins:

   - Go to Jenkins -> Manage Jenkins -> Manage Plugins -> Install GitHub Integration plugin.

2. Configure GitHub webhook:

   - Go to GitHub repository settings -> Webhooks -> Add webhook.
   - Set the Payload URL to `http://<YOUR_JENKINS_URL>/github-webhook/`.
   - Set Content type to `application/json`.
   - Choose the events that trigger the webhook and save.

3. Configure Jenkins to handle GitHub webhook events:

   - Go to Jenkins -> Configure -> Check the GitHub hook trigger for GITScm polling.

4. Make a change in the GitHub repository to test if the webhook triggers the Jenkins job.

### Conclusion

With these steps, you have set up a CI/CD pipeline using Jenkins and Docker, automating the build and deployment processes. The integration with GitHub and the use of webhooks ensure that every code change is automatically built and deployed, making your development workflow more efficient and reliable.

---

Feel free to adjust any specific details to better fit your setup!
