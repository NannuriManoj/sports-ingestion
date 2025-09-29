resource "aws_instance" "terrafrom_ec2" {
    ami           = "ami-02d26659fd82cf299"
    instance_type = "t3.micro"
    subnet_id = "subnet-08e91c34d0be12d4a"
    key_name = "aws-practice"

    tags = {
        Name = "terraform-ec2"
    }
}