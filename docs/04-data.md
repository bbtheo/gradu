

# Data

I will follow the \citeauthor{kaenzig2022}'s formulation as having the following endogenous variables. The model consists of two sections: the carbon section, which consists of the consumer price index of energy and the disaggregated greenhouse gas emission time series. The macroeconomic section consists of the headline consumer price index, industrial production index, 3-month Euribor rate, unemployment rate, OMX Helsinki stock index, and real exchange rate of Finland.


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

The sources of these endogenous variables can be found in the appendix \@ref(datasaources). The sample dates of my variables are from the beginning of the year 2000 to the end of the third quarter in 2021. All the endogenous variables are also reported in monthly time series. The Greenhouse gas emissions are an exception and must be disaggregated to a monthly time series.    

Following Känzig's (2022) example, all the variables have been stored as log levels, except the 3-month Euribor and Unemployment rate. This is done for the results to be interpretable as percentages.

## Greenhouse gas emission disaggregation

The greenhouse gas emission data is reported annually due to the commitments that were made by the United Nations Framework Convention on Climate Change (Stat Fin, 2022). This produces a problem that has to be addressed as our model will be built on a monthly time series. 

Känzig solved the problem by using the Chow-Lin disaggregation method. The accuracy of the disaggregation can be increased by additional relevant indicators reported in the desired frequency and correlated with the target values (Chow and Lin, 1971). Känzig used as his indicators the Consumer price index of energy products and industrial production index. As can be seen from Figure 1, Finnish non-renewable energy production is highly seasonal.   

\begin{figure}

\includegraphics{04-data_files/figure-latex/energy-share-1} \hfill{}

\caption{Monthly energy production in Finland by energy source. The increased share of renewable energy production and decreased total energy production  have been the prevalent trends after 2010.}(\#fig:energy-share)
\end{figure}



As a first impulse, I wanted to capture this seasonal variation in my disaggregated time series. That is why I produced three different disaggregated time series of greenhouse gas emissions: a dummy disaggregation without any indicators, with similar indicators that @kaenzig2022 used, and with the additional information of the amounts of non-renewable energy production. The results of these three disaggregations can be seen from Figure \@ref(fig:ghgdisagg).



\begin{figure}

\includegraphics{04-data_files/figure-latex/ghgdisagg-1} \hfill{}

\caption{Different disaggregation strategies from yearly values of the GHG emissions in Finland to monthly values. The additional data transforms the disaggregation to aggressively seasonal.}(\#fig:ghgdisagg)
\end{figure}


The dummy disaggregation strategy produces a yearly value divided by 12 as it's estimation, this can be considered also as the reported value, when we analyse the other two estimates. The disaggregation produced following in the footsteps of Känzig produces a relatively smooth time series that could be understood as a trend time series. The final disaggregation is the one with additional information. The values are varying wildly between summer months and winter months; this is due to the variation in the usage of non-renewable energy sources, that can be seen in the figure \@ref(fig:energy-share).

Even though the my estimate might be more truthful in capturing the actual monthly greenhouse gas emissions. It also produces more noise to the model and in the subchapter \@ref(trend) I will discuss the problems of not using trended values. In appendix \@ref(seasonapp) can be seen the impulse response functions that are produced with my estimate, and how it produces seasonal noise.

## Using trend values {#trend}

Känzig did not utilise trend values in his analysis, this might not been a significant problem, as he used values that were observed from Europe. This means that the seasonal variation was much lower than in the data that was observed from Finland. The seasonal variation of employment can be seen in the figure 3:

\begin{figure}

\includegraphics{04-data_files/figure-latex/unemptrend-1} \hfill{}

\caption{Monthly observed unemployment rate and the seasonally adjusted trend values of unemployment rate in Finland.}(\#fig:unemptrend)
\end{figure}


Using the original observed unemployment rate bring similar problems as using the disaggregation with additional information. It brings noise to the impulse responses. The in the appendix x can be seen the impulse responses when using the observed values. In the impulse response is present a substantial contemporaneous shock to the job market that is highly unlikely, and thus the model might have captured seasonal variation to the impulse responses of the shocks. These similar problems are also present with the industrial production index.

\begin{figure}

\includegraphics{04-data_files/figure-latex/indtrend-1} \hfill{}

\caption{Monthly observed industrial production index and the seasonally adjusted trend values of industrial output in Finland.}(\#fig:indtrend)
\end{figure}

The problems are similar whether the variable is industrial production index, unemployment rate, or the disaggregated greenhouse gas emissions. The variation that is due to either measurement errors, seasonal variation, or the inherent randomness that is not produced by the processes we want to detect. Especially when trying to infer long and medium-term effects of the carbon policy shock, the short-term variation of the endogenous variables affect the accuracy greatly. This can be seen when comparing the impulse response functions of the actual model in the chapter \@ref(results) and the one produced with the observed data in the appendix \@ref(seasonapp).

\newpage
