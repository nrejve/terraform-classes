resource "random_integer" "rand" {
  min = 10000
  max = 99999
}

locals {

  common_tags = {
    company      = var.company
    project      = "${var.company}-${var.project}"
  }

  s3_bucket_name = "terrafrom-${random_integer.rand.result}"

}
