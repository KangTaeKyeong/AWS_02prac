variable "name" {
  type = string
#  default = "kang"
}

variable "avazone" {
  type = list
#  default = ["a","c"]
}


variable "region" {
  type = string
#  default = "ap-northeast-2"
}



variable "key" {
  type = string
#  default = "id_rsa.pub"
}

variable "sh" {
  type = string
  # default = "install_seoul.sh"
}
variable "cidr_main" {
  type = string
#  default = "10.0.0.0/16"
}

variable "cidr" {
  type = string
#  default = "0.0.0.0/16"
}

variable "cidr_0" {
  type = string
  # default = "0.0.0.0/0"
}

variable "public_s" {
    type = list
  #  default = ["10.0.0.0/24","10.0.2.0/24"]
}

variable "private_s" {
  type = list
#  default = ["10.0.1.0/24","10.0.3.0/24"]
}
  
variable "private_dbs" {
  type = list
#  default = ["10.0.4.0/24","10.0.5.0/24"]
}

variable "private_ip" {
    type = string
    # default = "10.0.0.11"
}

variable "ipcidr" {
    type = string
    # default = "::/0"
}

variable "mysql_port" {
    type = string
    # default = "3306"
}

variable "http_port" {
    type = string
    # default = "80"
    
}

variable "icmp_prot" {
    type = string
    # default = "-1"
    
}

variable "TCP" {
    type = string
    # default = "tcp"
}

variable "icmp" {
  type = string
  # default = "icmp"
  
}
variable "http" {
  type = string
  # default = "HTTP"
  
}
variable "ssh" {
  type = string
  # default = "22"
  
} 

variable "healthy_threshold" {
  type = number
  # default = 3
}

variable "interval" {
  type = number
  # default = 5
}

variable "matcher" {
  type = string
  # default = "200"
}

variable "lbpath" {
  type = string
  # default = "/health.html"
}

variable "timeout" {
  type = number
  # default = 2
}

variable "unhealthy_threshold" {
  type = number
  # default = 2
}

variable "lbport" {
  type = string
  # default = "traffic-port"
}
variable "min_size" {
  type = number
  # default = 2
  
} 

variable "max_size" {
  type = number
  # default = 10
  
} 

variable "health_check_grace_period" {
  type  = number
  # default = 300
}

variable "health_check_type" {
  type  = string
  # default = "ELB"
}

variable "desired_capacity" {
  type = number
  # default = 2
}



variable "t2micro" {
  type = string
  # default = "t2.micro"
}

variable "keyname" {
  type = string
  # default = "var.key"
}

variable "dbusername" {
  type = string
  # default = "admin"
}

variable "dbpasswd" {
  type = string
  # default = "It12345!"
}

variable "storage_type" {
  type = string
  # default = "gp2"
}


variable "engine" {
  type = string
  # default = "mysql"
}

variable "engine_version" {
  type = string
  # default = "8.0"
}

variable "instance_class" {
  type = string
  # default = "db.t2.micro"
}

variable "dbname" {
  type = string
  # default = "mydb"
}
 
variable "identifier" {
  type = string
  # default = "mydb"
}


variable "parameter_group_name" {
  type = string
  # default = "default.mysql8.0"
}

variable "allocated_storage" {
  type = number
  # default = 20
}