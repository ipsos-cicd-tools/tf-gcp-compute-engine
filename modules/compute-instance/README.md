<!-- BEGIN_TF_DOCS -->
## Usage
Basic usage of this module is as follows:
```
module "compute-instance" {
  source  = "git::https://github.com/ipsos-cicd-tools/<repo name>//modules/compute-instance?ref=<version number>"
  
  ## Required Variables ##
  project_id  = 
  
  ## Optional Variables ##
  disk_config  =   {}
  gcp_zone  =   "us-central1-a"
  image  =   "centos-cloud/centos-stream-8"
  instance_name  =   ""
  labels  =   {
  "deployedby": "terraform"
}
  machine_type  =   "n1-standard-1"
  metadata  =   null
  os_disk_size  =   "10"
  os_disk_type  =   "pd-balanced"
  resource_policy  =   []
  service_account  =   null
  startup_script  =   "touch /tmp/created_by_terraform"
  subnet  =   "default"
  tags  =   []
}
```
## Resources

| Name | Type |
|------|------|
| [google_compute_disk.additional_disks](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_disk) | resource |
| [google_compute_disk.boot-disk](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_disk) | resource |
| [google_compute_instance.default](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_instance) | resource |
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_disk_config"></a> [disk\_config](#input\_disk\_config) | Additional disk configurations for instance | <pre>map(object({<br>    type = string<br>    size = number<br>  }))</pre> | `{}` | no |
| <a name="input_gcp_zone"></a> [gcp\_zone](#input\_gcp\_zone) | GCP zone, e.g. us-west1-a | `string` | `"us-central1-a"` | no |
| <a name="input_image"></a> [image](#input\_image) | image to build instance from in the format: image-family/os. See: https://cloud.google.com/compute/docs/images#os-compute-support | `string` | `"centos-cloud/centos-stream-8"` | no |
| <a name="input_instance_name"></a> [instance\_name](#input\_instance\_name) | GCP instance name | `string` | `""` | no |
| <a name="input_labels"></a> [labels](#input\_labels) | n/a | `map(string)` | <pre>{<br>  "deployedby": "terraform"<br>}</pre> | no |
| <a name="input_machine_type"></a> [machine\_type](#input\_machine\_type) | GCP machine type.  See: https://cloud.google.com/compute/docs/general-purpose-machines | `string` | `"n1-standard-1"` | no |
| <a name="input_metadata"></a> [metadata](#input\_metadata) | A map of metadata to add to the instance | `map(string)` | `null` | no |
| <a name="input_os_disk_size"></a> [os\_disk\_size](#input\_os\_disk\_size) | Size of OS disk in GB | `string` | `"10"` | no |
| <a name="input_os_disk_type"></a> [os\_disk\_type](#input\_os\_disk\_type) | Type of disk for OS partition | `string` | `"pd-balanced"` | no |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | GCP project name | `string` | n/a | yes |
| <a name="input_resource_policy"></a> [resource\_policy](#input\_resource\_policy) | Name of the resource being created in root for the instance scheduler | `list(string)` | `[]` | no |
| <a name="input_service_account"></a> [service\_account](#input\_service\_account) | Service account to associate with the instance | <pre>object({<br>    email  = string<br>    scopes = list(string) # ["cloud-platform"]  Full list: https://cloud.google.com/sdk/gcloud/reference/alpha/compute/instances/set-scopes#--scopes<br>  })</pre> | `null` | no |
| <a name="input_startup_script"></a> [startup\_script](#input\_startup\_script) | A startup script passed as metadata | `string` | `"touch /tmp/created_by_terraform"` | no |
| <a name="input_subnet"></a> [subnet](#input\_subnet) | Name (if same project as instance) or self-link of subnet to connect instance to | `string` | `"default"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A list of tags to add to the resources | `list(string)` | `[]` | no |
## Outputs

| Name | Description |
|------|-------------|
| <a name="output_additional_disks"></a> [additional\_disks](#output\_additional\_disks) | n/a |
| <a name="output_boot_disk_name"></a> [boot\_disk\_name](#output\_boot\_disk\_name) | n/a |
| <a name="output_id"></a> [id](#output\_id) | n/a |
| <a name="output_internal_ip"></a> [internal\_ip](#output\_internal\_ip) | n/a |
| <a name="output_name"></a> [name](#output\_name) | n/a |
<!-- END_TF_DOCS -->