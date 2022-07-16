get_unemployment_data <- function(){
  library(lubridate)
  return(
    data.frame(
      Date =ym(read.csv("data/EUROSTAT_UNEMP.csv")$TIME_PERIOD),
      Unemployment=read.csv("data/EUROSTAT_UNEMP.csv")$OBS_VALUE
    )
  )
}

get_euribor_data <- function(){
  library(lubridate)
  return(
    data.frame(
      Date = ym(read.csv("data/EKP_3KK_EURIBOR.csv",skip = 5)$X),
      Euribor_3kk = read.csv("data/EKP_3KK_EURIBOR.csv",skip = 5)$X.1
    )
  )
}

get_reer_data<- function(){
  library(lubridate)
  return(
    data.frame(
      Date = ymd(read.csv("data/FRED_BROAD_REER.csv")[,1]),
      REER = read.csv("data/FRED_BROAD_REER.csv")[,2]
    )
  )  
}

get_cpi_data<-function(spread = F){
  library(tidyr)
  library(lubridate)
  
  data <-data.frame(
    Date = lubridate::ym(read.csv("data/STAT_HINTAINDEKSI.csv", skip =2)$Kuukausi),
    Cpi_type = read.csv("data/STAT_HINTAINDEKSI.csv", skip =2)$Hy?dyke,
    Cpi = read.csv("data/STAT_HINTAINDEKSI.csv", skip =2)$Pisteluku)
  
  if(!spread){
    return(data)
  } else {
    
    return(
      data %>%
        spread(Cpi_type, Cpi)
    )
  }
}

get_macro_data<-function(){
  library(dplyr)
  readxl::read_xlsx("data/makrotilastoi.xlsx")%>%
    mutate(Date = lubridate::floor_date(Date, "months")) %>%
    rename(industrial_prod = "FN INDUSTRIAL PRODUCTION (2015=100) VOLA") %>%
    rename(omx_hel_25 = "OMX HELSINKI 25 (OMXH25) - PRICE INDEX") %>%
    select(Date, industrial_prod, omx_hel_25)
}

get_omx_data<-function(start_date = "01.01.2000", end_date = "31.12.2021"){
  library(dplyr)
    readxl::read_xlsx("data/makrotilastoi.xlsx") %>% 
      mutate(Date = lubridate::floor_date(Date, "months")) %>%
      rename(OMXH25 = "OMX HELSINKI 25 (OMXH25) - PRICE INDEX" ) %>%
      select(Date, OMXH25) %>%
      filter(Date >= lubridate::dmy(start_date),
             Date <= lubridate::dmy(end_date))
}

get_coal_data<-function(start_date = "01.01.2000", end_date = "31.12.2021"){
  library(readxl)
  library(lubridate)
  df<-readxl::read_xlsx("data/kivihiili.xlsx", skip = 2, n_max = 2)
  tibble(
    Date = lubridate::ym(colnames(df)[-1]),
    Coal_MWh = as.numeric(df[-1])
    )%>%
    filter(Date >= lubridate::dmy(start_date),
           Date <= lubridate::dmy(end_date))
}
get_energy_data<-function(start_date = "01.01.2000", end_date = "31.12.2021", spread = F){
  library(readxl)
  library(tidyr)
  
  #Suppressing warnings for some shenannigans
  oldw <- getOption("warn")
  options(warn = -1)
  
  df<-readxl::read_xlsx("data/energia.xlsx", skip = 2) %>%
    rename(Date = "...1", Type = "...2", GWh = "M??r? (GWh)") %>%
    fill(Date) %>%
    mutate(Date = lubridate::ym(Date), Type = as.factor(Type), GWh = replace_na(as.numeric(GWh),0)) %>%
    filter(Date >= lubridate::dmy(start_date),
           Date <= lubridate::dmy(end_date))
 
   #returning warnings
  options(warn = oldw)
  
  if(!spread){
    return(df)
  } else {
    return(df %>% spread(Type, GWh))
  }
}
  
get_subset_energy<-function(start_date = "01.01.2000", end_date = "31.12.2021"){
  
  library(dplyr)
  get_energy_data(start_date = start_date, end_date = end_date, spread = T) %>% 
      mutate(renewal_energy = `1.1 Vesivoima`+`1.2 Tuulivoima`+`1.3 Aurinkovoima`,
            non_renewal_energy = `1.5 Yhteistuotanto yhteens? (CHP)`+`1.6 Tavallinen lauhdevoima`,
            nuclear_energy = `1.4 Ydinvoima`) %>%
      dplyr::select(Date, renewal_energy, non_renewal_energy, nuclear_energy)
  
}


get_production_data<-function(start_date = "01.01.2000", end_date = "31.12.2021"){
  library(dplyr)
  
  readxl::read_xlsx("data/tuotantindeksi.xlsx") %>%
    mutate(Date = lubridate::y(Date) ) %>%
    rename(Production_index = 'Yhteensä') %>%
    filter(Date >= lubridate::dmy(start_date),
           Date <= lubridate::dmy(end_date) )
}

get_ghg_data<-function(){
  readxl::read_xlsx("data/GHG.xlsx")%>%
    .[11:31,]
}

get_trend_unemployment <- function(){
  readxl::read_xlsx("data/EUROSTAT_UNEMP_SEASON.xlsx", sheet = "Sheet 1", skip = 11)%>%
    mutate(TIME = lubridate::ym(TIME),
           ...2 = as.numeric(...2))%>%
    rename(Date = TIME,
           unemp_adj = ...2)%>%
    dplyr::select(Date, unemp_adj) %>%
    na.omit()
}

get_trend_industrial_output <- function(){
  readxl::read_xlsx("data/ind_adj.xlsx", skip = 2)%>%
    dplyr::select(...2, `BCD Koko teollisuus`)%>%
    rename(Date = ...2, ind_adj = `BCD Koko teollisuus`)%>%
    mutate(Date = lubridate::ym(Date))
}

get_useful_data <- function(add_trend_values = T){
  
  useful <- read.csv('data/useful.csv') %>%
    tibble::as_tibble() %>%
    dplyr::select(-X) %>%                           #some housekeeping because readr function didn't seem to work
    dplyr::mutate(Date = lubridate::ymd(Date))
  
  if(add_trend_values){
    useful <- useful %>%
      dplyr::left_join( get_trend_industrial_output() ) %>% #adding the above functions to useful
      dplyr::left_join( get_trend_unemployment() )
    
  }
  
  return(useful)
}

get_log_data <-function(){    # changes the raw values of useful data to log-levels
  
  get_useful_data() %>%
    mutate(HCIP              = log(HCIP)*100,
           HCIP_energy       = log(HCIP_energy)*100,
           industrial_prod   = log(industrial_prod)*100,
           omx_hel_25        = log(omx_hel_25)*100,
           GHG_emission      = log(GHG_emission)*100,
           RBFIBIS           = log(RBFIBIS)*100,
           GHG_Kanzig_method = log(GHG_Kanzig_method)*100,
           ind_adj           = log(ind_adj)*100)
}


get_eua_data <- function(){
  read_xlsx("data/EAU_FUTURES.xlsx") %>% 
    rename("EEX_EU_SETT_PRICE" = "EEX-EU CO2 Emissions E/EUA - SETT. PRICE",
           "ICE_EUA_FRONT" = "ICE EUA Yearly Energy Future c1 - SETT. PRICE",
           "ICE_EUA_2" = "ICE EUA Yearly Energy Future c2 - SETT. PRICE",
           "ICE_EUA_3" = "ICE EUA Yearly Energy Future c3 - SETT. PRICE",
           "ICE_EUA_4" = "ICE EUA Yearly Energy Future c4 - SETT. PRICE",
           "ICE_EUA_5" = "ICE EUA Yearly Energy Future c5 - SETT. PRICE",
           "ICE_EUA_6" = "ICE EUA Yearly Energy Future c6 - SETT. PRICE",
           "ICE_EUA_7" = "ICE EUA Yearly Energy Future c7 - SETT. PRICE",
           'date' = 'Date') %>% 
    mutate(date = lubridate::as_date(date))
}
get_eua_data()
