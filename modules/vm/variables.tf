variable "resource_name" {
description = "Create resouce group"
type=string
default="app-grp"
}
variable "number_of_instances" {
type=number
default=2
}
variable "app-region" {
description = "Location of app resource"
type=string
default="Central India"
}
variable "network-ids" {
type=string
}
