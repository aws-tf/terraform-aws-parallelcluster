# CHANGELOG

## 1.1.0

**CHANGES**
- Use AWS ParallelCluster Terraform Provider 1.x in all module examples.
- Use ParallelCluster API 3.11.1 in all examples with stack name ParallelClusterAPI.
- Deploy login nodes in all module examples.


## 1.0.0

**CHANGES**

First official release of the AWS ParallelCluster Module for Terraform, with support for ParallelCluster 3.8.0+.
In this release we provide three submodules, and the respective examples, to deploy:
1. ParallelCluster API
2. ParallelCluster clusters defined with YAML configuration file and HCL
3. networking infrastructure required by a ParallelCluster cluster
