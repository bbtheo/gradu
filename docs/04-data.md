

# Data

I will follow the \citeauthor{kaenzig2022}'s formulation as having the following endogenous variables. The model consists of the carbon section, which consists of the consumer price index of energy and the disaggregated greenhouse gas emission time series. The macroeconomic section consists of the headline consumer price index, industrial production index, 3-month Euribor rate, unemployment rate, OMX Helsinki stock index, and real exchange rate of Finland.


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

The sources for these endogenous variables can be found in the appendix \@ref(datasaources). The sample dates of my variables are from the beginning of the year 2000 to the end of the third quarter of 2021. All the endogenous variables are also reported in monthly time series. The Greenhouse gas emissions are an exception and must be disaggregated into a monthly time series.    

Following Känzig's (2022) example, all the variables have been analysed as log levels. However, an exception is made for the 3-month Euribor and Unemployment rates, which are stored in percentage points. This is done for the results to be interpretable as percentages.

## Greenhouse gas emission disaggregation

The greenhouse gas emission data are reported annually due to the commitments made by Finland in the United Nations Framework Convention on Climate Change (Stat Fin, 2022). Therefore, this problem must be addressed as our model will be built on a monthly time series. 

Känzig proposes a solution where by using the Chow-Lin disaggregation method. The accuracy of the disaggregation can be increased with the addition of relevant indicators, which are reported in the desired disaggregation frequency and are correlated with the target values \citep{chow1971}. \citet{kaenzig2022} used the Consumer price index of energy products and the industrial production index as his indicators. As can be seen from Figure \@ref(fig:energy-share), Finnish non-renewable electricity production is highly seasonal.

\begin{figure}

\includegraphics{04-data_files/figure-latex/energy-share-1} \hfill{}

\caption{Monthly electricity production in Finland by the sources. The increased share of renewable electricity production and decreased total electricity production  have been the prevalent trends after 2010. The carbon emitting electricity sources are in this case considered to be coal, natural gas, oil and peat. Using wood pellets is in this Figure considered to be renewable enrgy production. The Data is collected from the Statistics Finland.}(\#fig:energy-share)
\end{figure}



As my first instinct, I wanted to capture this seasonal variation into my disaggregated time series. This is why I tested my first hypothesis and produced three different disaggregated time series of greenhouse gas emissions. The first was a dummy disaggregation without any indicators, the second was with similar indicators as @kaenzig2022, and the third included additional information on the amounts of non-renewable energy production. The results of these three disaggregations can be seen in Figure \@ref(fig:ghgdisagg).



\begin{figure}

\includegraphics{04-data_files/figure-latex/ghgdisagg-1} \hfill{}

\caption{Different disaggregation strategies from yearly values of the GHG emissions in Finland to monthly values. The additional data from the sources of electricity production sources transforms the disaggregation to aggressively seasonal. The method used by \citet{kaenzig2022} is likely to be an underestimation on the seasonal variation and the estimation produced my is likey to be an overestimation as it takes into account only the sources of electricity production. The Data for this figure is from the Statistics Finland official statistics, and the disaggregation is done by me.}(\#fig:ghgdisagg)
\end{figure}


The dummy disaggregation strategy produces a yearly value divided by 12 as its estimation, which can also be considered the reported value when we compare it to the other two estimates. The disaggregation produced following the example laid out by \citet{kaenzig2022} produces a relatively smooth time series that could be understood as a trend time series. However, the disaggregation with additional information has values which vary wildly between summer and winter due to the variation in the usage of non-renewable energy sources, as seen in Figure \@ref(fig:energy-share).

Even though my estimate might be more truthful in capturing the actual monthly greenhouse gas emissions, it also produces more seasonal noise in the model. In the subchapter \@ref(trend), I will discuss the problems of not using trended values. Finally, Appendix \@ref(seasonapp) shows the impulse response functions produced with disaggregation produced with my estimation strategy and how it produces seasonal noise.


## Using trend values {#trend}

\citet{kaenzig2022} not utilise trend values in his analysis, this might not been a significant problem, as he used values that were observed from the whole European Union. This means that the seasonal variation was much lower than in the data that was observed from Finland. For exmaple, the seasonal variation of employment can be seen in Figure \@ref(unemptrend).

\begin{figure}

\includegraphics{04-data_files/figure-latex/unemptrend-1} \hfill{}

\caption{Monthly observed unemployment rate and the seasonally adjusted trend values of unemployment rate in Finland.  The Data is from Eurostat.}(\#fig:unemptrend)
\end{figure}


Using the original observed unemployment rate brings similar problems as using the disaggregation with additional information of electricity production sources. It brings additional noise which is unrelated to the target shocks to the impulse response functions. In Appendix \@ref(seasonapp) I have reported the impulse responses when using the observed values. In the impulse response is present a substantial contemporaneous shock to the job market that is highly unlikely, and thus the model might have captured seasonal variation to the impulse response functions. 

\begin{figure}

\includegraphics{04-data_files/figure-latex/indtrend-1} \hfill{}

\caption{Monthly observed industrial production index and the seasonally adjusted trend values of industrial output in Finland. The Data for this Figure is from the Statistics Finland.}(\#fig:indtrend)
\end{figure}

The problems are similar whether the variable is industrial production index, unemployment rate, or the disaggregated greenhouse gas emissions. The variation that is due to either measurement errors, seasonal variation, or the inherent randomness that is not produced by the processes we want to detect. 

Especially when trying to infer long and medium-term effects of the carbon policy shock, the short-term variation of the endogenous variables affect the accuracy greatly. This can be seen when comparing the impulse response functions of the actual model in the chapter \@ref(results) and the one produced with the observed data in the appendix \@ref(seasonapp).

\newpage
