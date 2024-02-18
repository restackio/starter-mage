# Mage Restack repository

This is the default mage repository to get you started for generating preview environments from a custom mage image with Restack github application.

# Run pipelines with Kubernetes executor

To scale your pipelines leveraging Kubernetes, you need to enable your pipelines to use the k8s executor.
More information on https://docs.mage.ai/production/configuring-production-settings/compute-resource#2-customize-the-compute-resource-of-the-mage-executor

In demo_project/metadata.yaml:

Replace namespace: mat3qa with your application shortId.

In demo_project/pipelines/titanic_survivors/metadata.yaml:

Make sure each block has executor_type: k8s, otherwise will use python executor.

In the UI of Mage:

In the pipeline settings, make sure Executor "k8s" is selected.

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
