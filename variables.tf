variable "cidr-block" {
    description = "subnet cidr block"
    default = ["10.0.10.0/24"]
    type = list(string)
  
}