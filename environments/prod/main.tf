module "vpc" {
  source = "../..//modules/vpc"
  cidr = "${var.cidr}"
  cidrpublic = "${var.cidrpublic}"
  publicsubnetname =  "${var.publicsubnetname}"
  cidrprivate = "${var.cidrprivate}"
  privatesubnetname =  "${var.privatesubnetname}"
  az1 = "${var.az1}"
  az2 = "${var.az2}"
}

module "security" {
  source = "../..//modules/security"
  sg = "${var.sg}"
  vpc_id = "${module.vpc.cidr[0]}"
}

module "ec2" {
  source = "../..//modules/ec2"
  count   = "${var.instance_count}"
  ami =  "${var.ami}"
  instance_type = "${var.instance_type}"
  subnet = "${var.subnet}"
  volumesize =  "${var.volumesize}"
  volume = "${var.volume}"
  name = "${var.name}-${var.instance_count}"
  env = "${var.env}"
  OS = "${var.OS}"
}


module "s3" {
  source = "../..//modules/s3"
  bucketname = "${var.bucketname}"
  acl = "${var.acl}"
  id = "${var.id}"
}

