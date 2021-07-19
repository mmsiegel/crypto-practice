variable "env" {
    type    = string
    default = "prod" 
}

variable "group_name" {
    type    = string
    default = "prod-ci-group"
}

variable "policy_name" {
    type    = string
    default = "prod-ci-policy"
}

variable "policy_description" {
    type    = string
    default = "ci policy"
}

variable "role_name" {
    type    = string
    default = "prod-ci-role"
}

variable "role_description" {
    type    = string
    default = "ci role"
}

variable "user_name" {
    type    = string
    default = "prod-ci-user"
}