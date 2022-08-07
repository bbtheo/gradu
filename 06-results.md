

# Results {#results}

## First stage {#firststage}

Inference with instrumental variables lies on the assumptions of relevancy with the shock of interest and exogeneity with other shocks. An other hidden assumption is that a weak correlation between the instrument and the structural shock of interest compromises the large sample validity of the inference based on the instrument. Due to this Montiel Olea, Stock and Watson (2020) propose that the first-stage heteroskedasticity-robust F-statistic between the instrument and the VAR-residual should be reported as a measure of the strength of the instrument. They also propose a rule of thumb of $F > 10$ for to be sure that the instrument is not weak.(Montiel Olea, Stock and Watson, 2020.)

For my model the $F = 10.99$, which would imply that the instrument is strong enough to be used with standard inference and there is no need to use the weak-instrument robust confidence sets that were elaborated further in Montiel Olea, Stock and Watson (2020). With the first stage regression we also find that the instrument explains $2.97\%$ of the energy price index residual. In conclusion there is no evidence to consider that a weak instrument problem would affect the inference.

## Effects to Finnish macroeconomy 

In the following section I will present the resulting impulse response functions to a carbon policy shock. The solid black line is a point estimate and the darker and lighter regions are the 68 and 90 per cent confidence bands respectfully. These confidence bands are calculated with a moving block bootstrap which was first brought forth by Jentsch and Lunsdorf (2019). ^[The major advantage of the moving block bootstrap method, comparing it to the wild bootstrap method, is that it will produce accurate confidence intervals. As the wild bootstrap will produce unaccurate impulse response functions to SVAR-IV (Jentsch and Lunsdorf, 2016). The code used in my thesis is heavily relying on Känzig (2021) reproduction files found [here](https://github.com/dkaenzig/replicationOilSupplyNews). If found all the mistakes are naturally mine.] With a block size of 20 and with $10 000$ bootstrap replications.  

\begin{figure}

\includegraphics{06-results_files/figure-latex/irf-1} \hfill{}

\caption{Impulse response functions from carbon policy shocks to Economic indicators of Finland}(\#fig:irf)
\end{figure}

in the figure \@ref(fig:irf)

The negative carbon policy shock is normalised to have a effect of $1\%$ in increasing the price of energy. As the energy components, greenhouse gas emission, headline HICP, industrial output index,  OMX Helsinki 25 stock index and the real broad exchange rate index are all handled in log-levels can the plots be interpreted as percentual changes. In contrast the unemployment rate and the 3 month Euribor interest rate are handled in percentage points and thus the plots represent changes of percentage points.

What can be clearly seen in this figure is the high persistency of the higher prices as a response to the carbon policy shock. This persistency in higher energy prices is feeding into higher headline consumer price index and it is statistically significant until the end of the estimation period, $50$ months ahead. The behaviour of the consumer price indexes are inline with Känzig's (2022) findings from European wide context. Where my findings differ, and seem to defy the conventional wisdom, is the behaviour of the Finnish economy in the short-run. 

There is an rather unexpected, but statistically insignificant, evidence that the Finnish economy benefits from the carbon policy shocks in the short-run. This can be seen as the industrial output index which is slightly elevated after the shock. But then continues to decrease to a statistically significant long term negative impulse. Similar, but opposite signed, impulse is with the unemployment rate. Starting with a statistically insignificant negative simultaneous impact that peaks around 10 months and then steady rise to a statistically significant positive reaction. The point estimate would imply that a carbon policy shock that would instantaneously raise the energy prices by 1% would in $40$ months time lead to a $0.07$ percentage point rise in Finnish unemployment. 

There is also statistically significant evidence that the carbon policy shock affects the 3 months Euribor interest rate, by reducing it with a point estimate of 0.1 percentage point in the long run. The effects of the carbon policy shock to the stock market seem to be statistically inconclusive. There is a noticeable evidence of effects to the Finnish real effective exchange rate in the long run.    

## Discussion of the findings

The reasons behind these impulses are outside the bounds of this thesis. But for the sake of future research I will provide few hypotheses. I would suggest, that there are two different reactions at play. A short run reaction that stimulates the economy and a long run reaction that is slowing down the economy. One hypothetical reason behind the short run stimulation might arise from the long history of Finnish carbon taxes which as Elbaum (2021) states made the Finnish industry more energy efficient. This energy efficiency would give Finnish industry a competetive advantage to its peers. Another possible explanation is the composition of Finnish industry ^[According to [Statistics Finland](https://www.stat.fi/til/tti/2020/tti_2020_2021-07-01_tie_001_en.html) 45% of the value produced by Finnish industry is from metal industry products.]  with the high share of capital goods in the production basket. The short term stimulus emerge due to the other European countries investing to more sustainable capital which would, in turn make the products of Finnish industrial companies more attractive. These explanations are hardly exclusive and thus their relative share of effect or the existence of additional explanations will be left to future research.

The long term effects of these shocks are more in line with the findings of Känzig (2022). This could be hypothesised to mean that the short term stimulus of some kind is running out and Finland will revert to the European norm. This would imply that the lower aggregate demand in Europe, which is demonstrated by Känzig, would after the end of investment surge bring the Finnish economy to a lower long term level. Also as with the short term effects the long term will have to be left to the future research as it is well beyond the scope of my thesis. 