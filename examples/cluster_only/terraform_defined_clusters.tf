locals {
  cluster_configs = {
    ExampleClusterOnly01 : {
      region : local.config_vars.region
      rollbackOnFailure : false
      validationFailureLevel : "WARNING"
      suppressValidators : [
        "type:KeyPairValidator"
      ]
      configuration : {
        Region : local.config_vars.region
        Image : {
          Os : "alinux2"
        }
        HeadNode : {
          InstanceType : "t3.small"
          Networking : {
            SubnetId : local.config_vars.subnet
          }
          Iam : {
            AdditionalIamPolicies : [
              { Policy : "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore" }
            ]
          }
        }
        Scheduling : {
          Scheduler : "slurm"
          SlurmQueues : [{
            Name : "queue1"
            CapacityType : "ONDEMAND"
            Networking : {
              SubnetIds : [local.config_vars.subnet]
            }
            Iam : {
              AdditionalIamPolicies : [
                { Policy : "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore" }
              ]
            }
            ComputeResources : [{
              Name : "compute"
              InstanceType : "t3.small"
              MinCount : "1"
              MaxCount : "4"
            }]
          }]
          SlurmSettings : {
            QueueUpdateStrategy : "TERMINATE"
          }
        }
      }
    }
    ExampleClusterOnly02 : {
      configuration : "files/cluster-config.yaml"
    }
  }
}
