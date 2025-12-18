variable "database" {
  type = map(object(
    {
      name = string
      # server_id    = string
      collation    = string
      license_type = string
      max_size_gb  = optional(number)
      sku_name     = optional(string)
      enclave_type = optional(string)

      tags = optional(map(string))


  }))
}

