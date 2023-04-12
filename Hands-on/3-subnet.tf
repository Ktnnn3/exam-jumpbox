resource "aws_subnet" "private-ap-southeast-1"{
    vpc_id = aws_vpc.main.id
    cidr_block = "10.0.0.0/19"
    availability_zone = "ap-southeast-1"

    tags ={
        "Name" = "private-ap-southeast-1"
        "kubernetes.io/role/internal-elb" = "1"
        "kubernetes.io/cluster/demo" = "owned"
    }
}

resource "aws_subnet" "private-ap-southeast-2"{
    vpc_id = aws_vpc.main.id
    cidr_block = "10.0.32.0/19"
    availability_zone = "ap-southeast-2"

    tags ={
        "Name" = "private-ap-southeast-2"
        "kubernetes.io/role/internal-elb" = "1"
        "kubernetes.io/cluster/demo" = "owned"
    }
}
resource "aws_subnet" "public-ap-southeast-1"{
    vpc_id = aws_vpc.main.id
    cidr_block = "10.0.64.0/19"
    availability_zone = "ap-southeast-1"
    map_public_ip_on_launch = true

    tags ={
        "Name" = "private-ap-southeast-1"
        "kubernetes.io/role/internal-elb" = "1"
        "kubernetes.io/cluster/demo" = "owned"
    }
}
resource "aws_subnet" "public-ap-southeast-2"{
    vpc_id = aws_vpc.main.id
    cidr_block = "10.0.96.0/19"
    availability_zone = "ap-southeast-2"
    map_public_ip_on_launch = true

    tags ={
        "Name" = "private-ap-southeast-2"
        "kubernetes.io/role/internal-elb" = "1"
        "kubernetes.io/cluster/demo" = "owned"
    }
}


