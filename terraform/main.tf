resource "aws_instance" "node-app" {
  ami = "ami-0c1a7f89451184c8b" # Example AMI, replace with your desired AMIinst
  instance_type = "t2.micro" # Example instance type, replace with your desired type
    key_name = "mumbai-key" # Replace with your key pair name
    security_groups = [ aws_security_group.node_sg.name ]
    tags = {
        Name = "Node-jenkins-EC2"
    }
}

# resource "aws_ec2_instance_state" "stop-node-app" {
#   instance_id = aws_instance.node-app.id
#   state = "stopped"
# }

resource "aws_security_group" "node_sg" {
    name = "nodejs-sg"
    description = "Allow HTTP and SSH traffic"

    ingress = [ {
      from_port = 22
      to_port = 22
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
      ipv6_cidr_blocks = [  ]
        prefix_list_ids = []
        security_groups = [  ]
        self = false
      description = "Allow SSH access"
    },
    {
        from_port = 3000
        to_port = 3000
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
        ipv6_cidr_blocks = [  ]
        prefix_list_ids = []
        security_groups = [  ]
        self = false
      description = "Allow HTTP access on port 3000"
    },
    {
        from_port = 8080
        to_port = 8080  
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
        ipv6_cidr_blocks = [  ]
        prefix_list_ids = []
        security_groups = [  ]
        self = false
      description = "Allow HTTP access on port 8080"
    }
     ]

     egress = [ {
       from_port = 0
       to_port = 0
       protocol = "-1"
       cidr_blocks = ["0.0.0.0/0"]
       ipv6_cidr_blocks = [  ]
       prefix_list_ids = []
       security_groups = [  ]
        self = false
       description = "Allow all outbound traffic"
     } 
     ]
  
}