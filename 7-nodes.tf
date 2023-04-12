resource "aws_iam_role" "nodes"{
    name = "eks-node-group-nodes"

    assume_role_policy = jsonencode({
        Statement = [{
            Action = "sts:AssumeRole"
            Effect = "Allow"
            Principle = {
                Service = "ec2.amazonaws.com"
            }
        }]
        Version = "2012-10-17"
    })
}

resource "aws_iam_role_policy_attachment" "nodes-AmazonEKSWorkerNodePolicy" {
    policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
    role = aws_iam_role.nodes.name
}

resource "aws_iam_role_policy_attachment" "nodes-AmazonEKS_CNI_Policy" {
    policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
    role = aws_iam_role.nodes.name
}

resource "aws_iam_role_policy_attachment" "nodes-AmazonEKSContainerRegistryReadOnly" {
    policy_arn = "arn:aws:iam::aws:policy/AmazonEKSContainerRegistryReadOnly"
    role = aws_iam_role.nodes.name
}
resource "aws_eks_node_group" "policy-nodes"{
    cluster_name = aws_eks_cluster.demo.name
    node_group_name = "private-nodes"
    node_role_arn = aws_iam_role.nodes.arn

    subnet_ids = [
        aws_subnet.private-ap-southeast-1.id,
        aws_subnet.private-ap-southeast-2.id
    ]

    capacity_type = "ON_DEMAND"
    instance_type = ["t3.small"]

    scaling_config {
        desired_size = 1
        max_size = 5
        min_size = 0
    }
    update_config{
        max_unvailable = 1
    }
    labels = {
        role = "general"

    }
    depends_on =[
        aws_iam_role_policy_attachment.nodes-AmazonEKSWorkerNodePolicy,
        aws_iam_role_policy_attachment.nodes-AmazonEKS_CNI_Policy,
        aws_iam_role_policy_attachment.nodes-AmazonEKSContainerRegistryReadOnly,
    ]
}
