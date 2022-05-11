resource "aws_iam_role" "lambda" {
    name = "LambdaRole"
    assume_role_policy = <<EOF
    {
        "Version": "2012-10-17",
        "Statement": [{
            "Action": "sts:AssumeRole",
            "Principal": {
                    "Service": "lambda.amazonaws.com"
            },
            "Effect": "Allow",
            "Sid": "AssumeRole"
        }]
    }
    EOF
    tags = {
        IES = "IGTI"
        CURSO = "EDC"
    }
}

resource "aws_iam_policy" "lambda" {
    name        = "LambdaPolicy"
    path        = "/"
    description = "Provides write permissions to CloudWatch Logs, S3 buckets and EMR steps"
    policy      = <<EOF
    {
        "Version": "2012-10-17",
        "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "logs:CreateLogGroup",
                "logs:CreateLogStream",
                "logs:PutLogEvents"
            ],
            "Resource": "*"
        },
        {
            "Effect": "Allow",
            "Action": [
                "s3:*"
            ],
            "Resource": "*"
        },
        {
            "Effect": "Allow",
            "Action": [
                "elasticmapreduce:*"
            ],
            "Resource": "*"
        },
        {
            "Effect": "Allow",
            "Action": [
                "iam:PassRole"
            ],
            "Resource": [
                "arn:aws:iam::693916676536:role/EMR_DefaultRole",
                "arn:aws:iam::693916676536:role/EMR_EC2_DefaultRole"
            ]
        }
    ]
    }
    EOF
}

resource "aws_iam_role_policy_attachment" "lambda_attach" {
    role = aws_iam_role.lambda.name
    policy_arn = aws_iam_policy.lambda.arn
}