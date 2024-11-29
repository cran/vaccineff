## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup--------------------------------------------------------------------
library(vaccineff)

## ----cohortdata, include = TRUE, echo = TRUE----------------------------------
# Load example data
data("cohortdata")
head(cohortdata)

## ----getstarted, include = TRUE, echo = TRUE----------------------------------
# Create `vaccineff_data`
vaccineff_data <- make_vaccineff_data(
  data_set = cohortdata,
  outcome_date_col = "death_date",
  censoring_date_col = "death_other_causes",
  vacc_date_col = "vaccine_date_2",
  vaccinated_status = "v",
  unvaccinated_status = "u",
  immunization_delay = 15,
  end_cohort = as.Date("2021-12-31"),
  match = TRUE,
  exact = c("age", "sex"),
  nearest = NULL
)

# Print summary of vaccineff data object
summary(vaccineff_data)

# Plot the vaccine coverage of the total population
plot(vaccineff_data)

# Estimate the Vaccine Effectiveness at 90 days
ve90 <- estimate_vaccineff(vaccineff_data, at = 90)

# Print summary of VE
summary(ve90)

# Loglog plot to check proportional hazards
plot(ve90, type = "loglog")

