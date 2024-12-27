check "health_check" {
  data "http" "terraform_io" {
    url = "https://www.terraform.io"
  }

  assert {
    condition     = data.http.terraform_io.status_code == 200
    error_message = "${data.http.terraform_io.url} returned an unhealthy status code"
  }
}

module "example_module" {
  source  = "app.terraform.io/<ORGANIZATION>/<MODULE_NAME>/<PROVIDER>"
  version = "1.0.0"
  # Define variables as needed
}

policy "cost-limit" {
  enforcement_level = "soft-mandatory"
}

import "tfrun"
import "decimal"

// Set the maximum allowed cost increase
max_allowed_cost = decimal.new("500") // Adjust this value as needed

// Calculate the total proposed monthly cost from the Terraform run's cost estimate
proposed_monthly_cost = decimal.new(tfrun.cost_estimate.proposed_monthly_cost)

// Calculate the total current monthly cost before the Terraform run
current_monthly_cost = decimal.new(tfrun.cost_estimate.prior_monthly_cost)

// Determine the delta in monthly cost
delta_monthly_cost = proposed_monthly_cost.subtract(current_monthly_cost)

// Main rule to ensure the cost increase does not exceed the maximum allowed cost
main = rule {
  delta_monthly_cost.less_than(max_allowed_cost)
}
