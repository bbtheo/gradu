

# Instrument {#inst}

In this chapter, I present the identification strategy of the instrument variable that will be used to identify the structural shock of the SVAR model discussed in Chapter \@ref(econometrics). The structure of the chapter is as follows. The first subchapter is for introduces a simplistic model of the futures markets. Second, I will explain how based on this model, high-frequency identification can be used to extract information about the changes in the carbon policy regime. Third, I will present the observed values of the carbon policy surprise series. The last part analyses the surprise series and its fitness as an instrumental variable.

## Futures market

The usage of futures markets relies on the hypothesis that the markets will effectively incorporate all available information into the price discovery mechanism [@hayek35v]. The futures are the markets' best guess for the future price of these carbon permits, given there are no transportation costs, and the risk tolerance of the seller and buyer are equal \citep{nakamura2018}

Standard theory on asset price formation formulated by @pindyck2001 predicts that futures contracts on a day $d$ with a maturity $h$ are valued as:

\begin{equation}
  F_d^h = \mathbb{E}_d(P_{d+h})-RP^h_d
  (\#eq:futprice)
\end{equation}

The equation \@ref(eq:futprice) describes that the price of a future is a combination of the expected price of the asset $P_{d+h}$ with the information available on the date $d$ and the risk premium $RP$ to time step $h$ at time step $d$. 

## High-frequency identification

Following the approach of the high-frequency identification of the instrument used by @kaenzig2022. Similar approach that @romer2010macroeconomic used and @kaenzig2021 in his previous research on the consequences of the OPEC announcements. The surprise series of the carbon futures market is calculated from the log differences in the daily closing price of the EU emission trading certificate futures.

It can be assumed that because of the tight identification period, the changes in the risk premium are not changing $RP_d \approx RP_{d-1}$ and thus, the surprise series is representing the updates in the expected future price of the emission trading certificates [@kaenzig2021].


\begin{equation}
  \begin{split}
    \text{Surprise}_d &= F^h_d-F^h_{d-1} \\
    &= \mathbb{E}_d(P_{d+h})-RP^h_d-\mathbb{E}_{d-1}(P_{d+h})+RP^h_{d-1} \\
    &= \mathbb{E}_d(P_{d+h})-\mathbb{E}_{d-1}(P_{d+h}) 
  \end{split}
(\#eq:surprise)
\end{equation}


The daily surprise series elaborated in the equation \@ref(eq:surprise) is then aggregated to a monthly carbon policy surprise series. Finally, an indicator function $1_{cp}(d)$ whether a day contains a carbon policy regulatory event is used to mask days with regulatory events to zero. The regulatory events are listed in Appendix \@ref(regdates).

$$
\text{CPSurprise}_m = \sum_{d\in m}\text{CPSurprise}_d 
$$

This monthly surprise series is an ideal external instrument due to the exogeneity resulting from the short time frame of the identification. It can be used as the $z_t$ of Equation \@ref(eq:prop).

## Regulatory Dates {#reggdates}

Identifying regulatory events is a vital part of the building of this instrument. In Figure \@ref(fig:instplot), the values of the $\text{CPSurprise}_m$ are presented, in addition to some exciting named regulatory events.


\begin{figure}

\includegraphics{05-instrument_files/figure-latex/instplot-1} \hfill{}

\caption{Monthly carbon policy surprise series and some policy events that produced substantial market reactions. The dashed line deliniates between the policy surprise produced by \citet{kaenzig2022} and the researcher.}(\#fig:instplot)
\end{figure}

All the regulatory dates are listed in the appendix \@ref(regdates). As in Figure \@ref(fig:instplot), the dates produced in @kaenzig2022 and by me are separated.

## Diagnostics of the Surprise as an external instrument {#diagextinst}

One of the significant problems the instrument could have is that it would be serially correlated. There is no evidence of persistent autocorrelation. However, there is a statistically significant autocorrelation, as seen in Figure \@ref(fig:acfplot) after 11 lags, and also evidence of partial autocorrelation can be seen in Figure \@ref(fig:pacfplot). 

\begin{figure}

\includegraphics{05-instrument_files/figure-latex/acfplot-1} \hfill{}

\caption{Autocorrelation plot of the monthly carbon policy surprise.}(\#fig:acfplot)
\end{figure}

\begin{figure}

\includegraphics{05-instrument_files/figure-latex/pacfplot-1} \hfill{}

\caption{Partial autocorrelation plot of the monthly carbon policy surprise.}(\#fig:pacfplot)
\end{figure}

This autocorrelation of 11 lags would mean that the last year's regulatory announcements correlate with the announcements at time step $t$. This can be seen from Figure \@ref(fig:seasonal-variation). As the announcements are not equally distributed throughout the year, our results may capture some seasonal impacts if the seasonal variation is not adequately handled. This is additional reason to use trend values of the variables and why there is noticeable seasonal fluctuation in the appendix \@ref(seasonapp).


\begin{figure}

\includegraphics{05-instrument_files/figure-latex/seasonal-variation-1} \hfill{}

\caption{A summary of the amoutns of regulatory days by calender month. The total amounts are displayed as numbers above the bar plots. The bars have been colored to correspond the amounts of positive and negative shocks in every month.}(\#fig:seasonal-variation)
\end{figure}

\newpage
