module "s3" {
  source = "/home/fl_lpt-265/terraform-modules-workspace/modules/s3"
  bucketname = "${var.bucketname}"
  acl = "${var.acl}"
  id = "${var.id}"
}
