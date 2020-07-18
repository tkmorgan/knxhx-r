library(shiny)
library(rds.r)
library(geojsonio)
library(ggplot2)
library(leaflet)
library(arulesViz)

# Knox Hack data Server
knoxServer <- get.rds("https://knxhx.richdataservices.com/rds")
knoxHealthCatalog <- getCatalog(knoxServer, "kchd")
knoxResourcesProduct <- getDataProduct(knoxHealthCatalog, "us_tn_kchd_capacity")

knoxResourcesProductData <-
  rds.tabulate(
    knoxResourcesProduct,
    dimensions = c("date_stamp", "resource_type"),
    measures = c("cnt_used",
                 "cnt_capacity"),
    totals = F
  )

plot(knoxResourcesProductData)



