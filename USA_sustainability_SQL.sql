USE [World Sustainability]

SELECT *
FROM ONU_sustainability_of_countries_development

SELECT dt_year, country, total_greenhouse_gas_emissions_mtco2, total_government_revenue_proportion_of_gdp_perc,annual_GDP_growth_rate_perc, proportion_of_population_with_primary_reliance_on_clean_fuels, perc_of_final_consumption_from_renewable_energy,co2emissions_from_fuel_combustion_in_millions_of_tons,number_of_companies_publishing_sustainability_reports
FROM ONU_sustainability_of_countries_development AS onu
WHERE country = 'United States of America'

CREATE TABLE usa_sustainability (
	year int PRIMARY KEY,
	country nvarchar(50),
	total_ghg_emissions_mmtco2 float,
	perc_gov_rev_of_gdp float,
	perc_annual_gdp_growth float,
	perc_pop_reliance_on_clean_fuels float,
	perc_consumption_from_renewable_energy float,
	co2_emissions_from_combustion_mmt float,
	num_companies_sustainability_report int
)

INSERT INTO usa_sustainability
SELECT dt_year, country, total_greenhouse_gas_emissions_mtco2, total_government_revenue_proportion_of_gdp_perc,annual_GDP_growth_rate_perc, proportion_of_population_with_primary_reliance_on_clean_fuels, perc_of_final_consumption_from_renewable_energy,co2emissions_from_fuel_combustion_in_millions_of_tons,number_of_companies_publishing_sustainability_reports
FROM ONU_sustainability_of_countries_development AS onu
WHERE country = 'United States of America'

SELECT * 
FROM usa_sustainability

