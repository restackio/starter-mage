# Mage Restack repository

This is the default mage repository to get you started for generating preview environments from a custom mage image with Restack github application.

# Kubenertes Executor coming soon

We are currently developing a new version that will include support for the Kubernetes Executor. Until this version is released, please continue using the default Python executor.

Make sure that the /demo_project/metadata.yaml is not using the Kubernetes executor

When using the Mage.ai UI do not run the pipelines with the Kubernetes executor.

# Enable CI/CD with Restack

We are working in a new version that will introduce support for the Kubernetes Executor. In the meantime, you should use the default Python executor.

Please ensure that the /demo_project/metadata.yaml file is configured to NOT use the Kubernetes Executor. Feel free to use the version included in our starter repo.

Additionally, when operating within the Mage.ai UI, avoid executing pipelines with the Kubernetes Executor.

# Generate preview environments

Go to your stack settings.
Enable Preview environments.
Open a pull request a preview environment will be generated.
Follow status and access logs directly from the GitHub PR.
Once the pull request is merged to the defaut branch, the parent application will be provisioned with the latest latest code.
