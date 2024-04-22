# Required variables
variable "project_id" {
  type        = string
  description = "GCP project name"
}

variable "environment" {
  type        = string
  description = "Deployment Environment (dev, qa, stg, prd, poc, test)"
}

variable "os_disk_type" {
  type        = string
  description = "Type of disk for OS partition"
  default     = "pd-balanced"
}

variable "os_disk_size" {
  type        = string
  description = "Size of OS disk in GB"
  default     = "10"
}

variable "gcp_region" {
  type        = string
  description = "GCP region, e.g. us-west1"
  default     = "us-central1"
}

variable "gcp_zone" {
  type        = string
  description = "GCP zone, e.g. us-west1"
  default     = "us-central1-a"
}

variable "machine_type" {
  type        = string
  description = "GCP machine type.  See: https://cloud.google.com/compute/docs/general-purpose-machines"
  default     = "n1-standard-1"
}

variable "instance_name" {
  type        = string
  description = "GCP instance name"
  default     = ""
}

variable "image" {
  type        = string
  description = "image to build instance from in the format: image-family/os. See: https://cloud.google.com/compute/docs/images#os-compute-support"
  default     = "centos-cloud/centos-stream-8"
}

variable "startup_script" {
  type        = string
  description = "A startup script passed as metadata"
  default     = "touch /tmp/created_by_terraform"
}

variable "labels" {
  type = map(string)
  default = {
    deployedby = "terraform"
  }
}

variable "subnet" {
  type        = string
  description = "Name (if same project as instance) or self-link of subnet to connect instance to"
  default     = "default"
}

variable "disk_config" {
  type = map(object({
    type = string
    size = number
  }))
  description = "Additional disk configurations for instance"
  default     = {}
}

variable "resource_policy" {
  description = "Name of the resource being created in root for the instance scheduler"
  default     = []
  type        = list(string)
}

variable "tags" {
  description = "A list of tags to add to the resources"
  type        = list(string)
  default     = []
}

variable "service_account" {
  description = "Service account to associate with the instance"
  type = object({
    email  = string
    scopes = list(string) # ["cloud-platform"]  Full list: https://cloud.google.com/sdk/gcloud/reference/alpha/compute/instances/set-scopes#--scopes
  })
  default = null
}
