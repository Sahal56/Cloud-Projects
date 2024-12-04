variable "source_bucket" {
  description = "Source Bucket Name"
}

variable "destination_bucket" {
  description = "Your Destination Bucket Name"
}

variable "lambda_function_name" {
  default = "GenerateThumbnail"
}

variable "thumbnail_size" {
  default = "128x128"
}
