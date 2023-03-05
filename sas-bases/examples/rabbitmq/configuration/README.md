---
category: RabbitMQ
tocprty: 3
---

# Configuration Settings for RabbitMQ

## Overview

This README file describes the settings available for deploying RabbitMQ.

## Installation

Based on the following description of the available example files, determine if you
want to use any example file in your deployment. If you do, copy the example
file and place it in your site-config directory.

Each file has information about its content. The variables in the file are set
off by curly braces and spaces, such as {{ NUMBER-OF-NODES }}. Replace the
entire variable string, including the braces, with the value you want to use.

After you have edited the file, add a reference to it in the transformers block
of the base kustomization.yaml file (`$deploy/kustomization.yaml`). Here is an
example using the RabbitMQ nodes transformer:

```yaml
transformers:
...
- site-config/rabbitmq/configuration/rabbitmq-node-count.yaml
```

## Examples

The example files are located at `$deploy/sas-bases/examples/rabbitmq/configuration`.
The following list contains a description of each example file for RabbitMQ settings 
and the file names.

- specify the number of RabbitMQ nodes in the cluster (rabbitmq-node-count.yaml)

**Note:** The default number of nodes is 3. SAS recommends a node count that
is odd such as 1, 3, or 5.

- modify the resource allocation for RAM (rabbitmq-modify-memory.yaml)
- modify the resource allocation for CPU (rabbitmq-modify-cpu.yaml)
- modify the PersistentVolumeClaim (PVC) size for nodes (rabbitmq-modify-pvc-size.yaml)

**Note:** You must delete the RabbitMQ statefulset and PVCs before applying the PVC
size change. Use the following procedure:

1. Delete the RabbitMQ statefulset.

   ```bash
   kubectl -n <name-of-namespace> delete statefulset sas-rabbitmq-server
   ```

2. Wait for all of the pods to terminate before deleting the PVCs. You can check the
status of the RabbitMQ pods with the following command:

   ```bash
   kubectl -n <name-of-namespace> get pods -l app.kubernetes.io/name=sas-rabbitmq-server
   ```

3. When no pods are listed as output for the command in step 2, delete the PVCs:

   ```bash
   kubectl -n <name-of-namespace> delete pvc -l app.kubernetes.io/name=sas-rabbitmq-server
   ```