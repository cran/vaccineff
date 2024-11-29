## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup--------------------------------------------------------------------
library(vaccineff)

## ----artcohor, include = TRUE, echo = TRUE------------------------------------
# Load example data
data("cohortdata")

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
  match = FALSE
)

# Estimate the Vaccinef Effectiveness (VE)
ve1 <- estimate_vaccineff(vaccineff_data, at = 180)

# Print summary of VE
summary(ve1)

# Generate Survival plot
plot(ve1, type = "surv", percentage = FALSE, cumulative = FALSE)

# Generate loglog plot to check proportional hazards
plot(ve1, type = "loglog")

## ----artcohor1, include = TRUE, echo = TRUE-----------------------------------
# Load example data
data("cohortdata")

# Create `vaccineff_data`
vaccineff_data_matched <- make_vaccineff_data(
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

## ----artcohor2, include = TRUE, echo = TRUE-----------------------------------
summary(vaccineff_data_matched)

## ----artcohor3, include = TRUE, echo = TRUE-----------------------------------
# Estimate the Vaccinef Effectiveness (VE)
ve2 <- estimate_vaccineff(vaccineff_data_matched, at = 180)

# Print summary of VE
summary(ve2)

# Generate loglog plot to check proportional hazards
plot(ve2, type = "loglog")

# Generate Survival plot
plot(ve2, type = "surv", percentage = FALSE, cumulative = FALSE)

## ----artcohor4, include = TRUE, echo = TRUE-----------------------------------
# Load example data
data("cohortdata")

# Create `vaccineff_data`
vaccineff_data_matched2 <- make_vaccineff_data(
  data_set = cohortdata,
  outcome_date_col = "death_date",
  censoring_date_col = "death_other_causes",
  vacc_date_col = "vaccine_date_2",
  vaccinated_status = "v",
  unvaccinated_status = "u",
  immunization_delay = 15,
  end_cohort = as.Date("2021-12-31"),
  match = TRUE,
  exact = "sex",
  nearest = c(age = 2)
)

summary(vaccineff_data_matched2)


# Estimate the Vaccinef Effectiveness (VE)
ve3 <- estimate_vaccineff(vaccineff_data_matched2, at = 180)

# Print summary of VE
summary(ve3)

# Generate loglog plot to check proportional hazards
plot(ve3, type = "loglog")

# Generate Survival plot
plot(ve3, type = "surv", percentage = FALSE, cumulative = FALSE)

