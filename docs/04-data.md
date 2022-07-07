# Data

I will follow the Känzig's formulation as having the following endogenous variables. The model consists of two different sections, the carbon section, which consists of consumer price index of energy and the disaggregated greenhouse gas emission time series. The macroeconomic section which is consists of head line consumer price index, industrial production index, 3 month Euribor rate, unemployment rate, OMX Helsinki stock index, and real exchange rate of Finland.


$$
y_t =
\begin{bmatrix}
\text{Energy consumer price index} \\
\text{GHG emissions} \\
\text{Consumer price index} \\
\text{Industrial production} \\
\text{3 month Euribor} \\
\text{Unemployment rate} \\
\text{OMX Helsinki} \\
\text{Real exchange rate}
\end{bmatrix}
$$

The sources of these endogenous variables can be found from the appendix X. The sample dates of my variables are from the begining of year 2000 to the end of third quarter in 2021. All the endogenous variables are also reported in monthly timeseries. The Greenhouse gas emissions are an exception to this and they have to be disaggregated to a monthly time series.    

Following Känzig (2022) example all the variables have been, except the 3 month Euribor and Unemployment rate stored as log-levels. The reasoning behind all of these choices is elaborated in the following subchapters.

## Greenhouse gas emission disaggregation

The greenhouse gas emission data is reported annually, due to the commitments that were made by the United Nations Framework Convention on Climate Change (Stat Fin, 2022). This produces a problem that has to be adressed as our model will be build on a monthly time series. 

Känzig solved the problem by using the Chow-Lin dissaggregation method. Accuracy of the disaggregation can be increased by additional relevant indicators that are reported in the desired frequency and are also correlated with the target values (Chow and Lin, 1971). Känzig used as his indicators the Consumer price index of energy products and industrial production index. As can be seen from the Figure 1, the Finnish non-renewable energy production is highly seasonal.   

![Monthly energy production in Finland by energy source](Slide_pictures/energy.png){}





As a first impulse I wanted to capture this seasonal variation to my disaggregated time series. That is why I produced three different dissaggregated time series of greenhouse gas emissions: a dummy disaggregation without indicators, with similar indicators that Känzig used, and with the additional information of the amounts of non-renewable energy production. The results of these three disaggregations can be seen from Figure 2.

![Different disaggregation strategies from yearly values of the GHG emissions in Finland to monthly](Slide_pictures/ghg_plot.png){}

The dummy disaggregation strategy produces a yearly value divided by 12 as it's estimation, this can be considered also as the reported value, when we analyse the other two estimates. The disaggregation produced following in the footsteps of Känzig produces a relatively smooth time series that could be understood as a trend time series. The final disaggregation is the one with additional information. The values are varying wildly between summer months and winter months, this is due to the variation in the usage of non-renewable energy sources, that can be seen in the figure 1.

Even though the my estimate might be more truthful in capturing the actual monthly greenhouse gas emissions. It also produces more noise to the model and in the next subchapter I will discuss the problems of not using trended values. In appendix x can be seen the impulse response functions that are produced with my estimate, and how it produces seasonal noise.

## Using trend values

Känzig did not utilise trend values in his analysis, this might not been a significant problem, as he used values that were observed from Europe. This means that the seasonal variation was much lower than in the data that was observed from Finland. The seasonal variation of employment can be seen in the figure 3:

![Monthly observed unemployment rate and the seasonally adjusted trend value in Finland](Slide_pictures/unemp_comparison.png){}

Using the original observed unemployment rate bring similar problems as using the disaggregation with additional information. It brings noise to the impulse responses. The in the appendix x can be seen the impulse responses when using the observed values. In the impulse response is present a substantial contemporaneous shock to the job market that is highly unlikely and thus the model might have captured seasonal variation to the impulse responses of the shocks. These similar problems are also present with the industrial production index.

![Monthly observed industrial production index and the seasonally adjusted trend values in Finland](Slide_pictures/prod_comparison.png){}

The problems are similar whether the variable is industrial production index, unemployment rate, or the disaggregated greenhouse gas emissions. The variation that is due to eihter measurement errors, seasonal variation, or the inherent randomness that is not produced by the processes we want to detect. Especially when trying to infer long and medium-term effects of the carbon policy shock, the short-term variation of the endogenous variables affect the accuracy greatly. This can be seen when comparing the impulse response functions of the actual model in the chapter x and the one produced with the observed data in the appendix x.   

## Using log-levels

MIKSIIIIII? 

- ne antaa korvaamatonta tietoa mitä ei voida saada vain muutoksen suuruudesta.

- tämä tietysti antaa 

\newpage