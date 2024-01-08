locals {
  cluster_configs = {
    cluster01 : {
      region : var.region
      rollbackOnFailure : false
      configuration : {
        Region : var.region
        Image : {
          Os : "alinux2"
        }
        HeadNode : {
          InstanceType : "t3.micro"
          Networking : {
            ElasticIp : true
            SubnetId : local.config_vars.subnet
          }
          Ssh : {
            KeyName : local.config_vars.key_pair
          }
        }
        Scheduling : {
          Scheduler : "slurm"
          SlurmQueues : [{
            Name : "queue1"
            CapacityType : "ONDEMAND"
            Networking : {
              SubnetIds : [local.config_vars.subnet]
              AssignPublicIp : true
            }
            ComputeResources : [{
              Name : "compute"
              InstanceType : "t3.micro"
              MinCount : "1"
              MaxCount : "4"
              DisableSimultaneousMultithreading : true
            }]
          }]
          SlurmSettings : {
            QueueUpdateStrategy : "TERMINATE"
          }
        }
      }
    }
    cluster02 : {
      configuration : "files/cluster-config.yaml"
    }
  }
}
