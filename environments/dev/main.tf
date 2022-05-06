module "s3" {
  source = "~/modules/s3"
  bucketname = "${var.bucketname}"
  acl = "${var.acl}"
  id = "${var.id}"
}
