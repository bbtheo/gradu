# Sensitivity checks

Here can be seen few different IRF plots with different choices with endogenous variables. This will bring some insight how sensitive the results of my thesis are on the choices made with the selection of endogenous variables and the choices made on the

## Seasonally varying endogenous variables {#seasonapp}

In the figure below it can be seen that the model captures a significant seasonal variation to the greenhouse gas emissions. It is also unplausible to consider that a modest price shock would raise the Finnish unemployment rate by two percentage points. This is an excellent argument against using the seasonally varying data. As I demonstrated in the chapter \@ref(diagextinst) that the regulatory dates are accumulated on same times of the year, this could then combined with the seasonally varying Greenhouse gas data and seasonally varying unemployment data explain the impulse responses seen below. Also in this model is used the seasonally varying industrial production index, the 


```r
knitr::include_graphics("Slide_pictures/var_my_GHG.png")
```

![(\#fig:include-sens-irf1)The IRFs with my seasonally agressively varying GHG emissions and with the not seasonally adjusted unemployment rates as endogenous variables.](Slide_pictures/var_my_GHG.png) 

My aim is not to explain this unusual impulse response functions but to use it as an argument on behalf of using data from where the seasonal variation is cleaned out. Reassuringly the main findings of my thesis are still, at least qualitatively present even though this is a model with endogenous variables that have seasonal variation.

## Omitting GHG emissions

To test whether the large contemporaneous effects in industrial production and unemployment rate are solely due to the substantially varying greenhouse gas data. I will in this model I have omitted the Greenhouse gas emissions from the model. 


```r
knitr::include_graphics("Slide_pictures/var_no_GHG.png")
```

![(\#fig:include-sens-irf2)Omitting the Greenhouse gas data from my endogenous variables](Slide_pictures/var_no_GHG.png) 

As can be seen from the figure \@ref(fig:include-sens-irf2) the large contemporaneous effects are still present and thus it could be interpreted as evidence for using the trend values, I have utilised in the core model I have presented. It is reassuring that if the contemporaneous effects are ignored the effects are similar to the core model. This could be interpreted to indicate that the drastic contemporaneous effects are due to seasonal variation. Yet again my aim here is not to prove this. But on contrary, I will the counter I will provide these as an argument for the selection of the endogenous variables in my core model. Additionally, these two figures suggest that the core findings of my thesis are robust to a wide variety of choices in handling the endogenous variables.

## Local projection {#localprojapp}

 - I will add here the local projection impulse responses as used in the supplementary material of @plagborg2021local

\singlespacing
