module "stage" {
    source            = "../01_module"

    name              = "kang"
    avazone           = ["a","c"]
    region            = "ap-northeast-2"
    key               = "id_rsa.pub"
    sh                = "install_seoul.sh"
    cidr_main         = "10.0.0.0/16"
    cidr              = "0.0.0.0/16"
    cidr_0            = "0.0.0.0/0"
    public_s          = ["10.0.0.0/24","10.0.2.0/24"]
    private_s         = ["10.0.1.0/24","10.0.3.0/24"]
    private_dbs       = ["10.0.4.0/24","10.0.5.0/24"]
    private_ip        = "10.0.0.11"
    ipcidr            = "::/0"  


    mysql_port        = "3306"
    http_port         = "80"
    icmp_prot         = "-1"
    TCP               ="TCP"
    icmp              = "icmp"
    http              = "HTTP"
    ssh               ="22"

    healthy_threshold = 3
    interval          = 5
    matcher           = "200"
    lbpath            = "/health.html"
    timeout           = 2
    unhealthy_threshold = 2
    lbport = "traffic-port"
    min_size = 2
    max_size = 10
    health_check_grace_period = 300
    health_check_type = "ELB"
    desired_capacity = 2
    t2micro = "t2.micro"
    keyname = "var.key"
    


    dbusername = "admin"
    dbpasswd = "It12345!"
    storage_type = "gp2"
    engine = "mysql"
    engine_version = "8.0"
    instance_class = "db.t2.micro"
    dbname = "mydb"
    identifier = "mydb"
    parameter_group_name = "default.mysql8.0"
    allocated_storage = 20


}