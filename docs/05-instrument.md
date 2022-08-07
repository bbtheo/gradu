

# Instrument {#inst}

The intrumental variable has been used since the start of the 20th century

## Futures market

The usage of futures markets relies on  the hypothesis that the markets will effectively incorporate all available information to the price discovery mechanism [@hayek35v]. That would then 

Standard theory on asset price formation which was formulated by @pindyck2001 predicts that futures contracts on a day $d$ with a maturity $h$ are valued as:

\begin{equation}
  F_d^h = \mathbb{E}_d(P_{d+h})-RP^h_d
  (\#eq:futprice)
\end{equation}

The equation \@ref(eq:futprice) describes that the price of a future is a combination of the expected price of the asset $P_{d+h}$ with the information available on the date $d$ and the risk premium to time step $h$ at. 

## High-frequency identification

In my thesis I will follow the formulation used by @kaenzig2022 with the high-frequency identification of the instrument. It is based on similar approach that was used by @romer2010macroeconomic, and @kaenzig2021 in his previous research on the consequences of the OPEC announcements. The surprise series of the carbon futures market is calculated from the log differences in the daily closing price of the EU emission trading certificate futures.

It can be assumed that because of the tight identification period the changes in the risk premium are not changing $RP_d \approx RP_{d-1}$ and thus the surprise series is representing the updates in the expected future price of the emission trading certificates [@kaenzig2021].


\begin{equation}
  \begin{split}
    \text{Surprise}_d &= F^h_d-F^h_{d-1} \\
    &= \mathbb{E}_d(P_{d+h})-RP^h_d-\mathbb{E}_{d-1}(P_{d+h})+RP^h_{d-1} \\
    &= \mathbb{E}_d(P_{d+h})-\mathbb{E}_{d-1}(P_{d+h}) 
  \end{split}
(\#eq:surprise)
\end{equation}


The daily surprise series elaborated in the equation \@ref(eq:surprise) is then aggregated to a monthly carbon policy surprise series which will be . A indicator function $1_{cp}(d)$ whether a day contains an carbon policy regulatory event is used to mask days with now regulatory events to zero. The regulatory events are listed in Appendix \@ref(regdates).

$$
\text{CPSurprise}_m = \sum_{d\in m}\text{Surprise}_d 1_{cp}(d)
$$

This monthly surprise series is an ideal external instrument due to the exogeneity resulting from the short time frame of the identification. This means that a 

## Regulatory Dates

The identification of regulatory events is a vital part of the building of this instrument. In the figure \@ref(fig:instplot) the values of the $\text{CPSurprise}_m$ can be clearly seen.


\begin{figure}

\includegraphics{05-instrument_files/figure-latex/instplot-1} \hfill{}

\caption{Monthly carbon policy surprise series and some policy events that produced substantial market reactions. The dashed line deliniates between the policy surprise produced by \citet{kaenzig2022} and the researcher.}(\#fig:instplot)
\end{figure}

The all the regulatory dates are listed in the appendix \@ref(regdates). As in the figure \@ref(fig:instplot), the dates produced in @kaenzig2022 and by me are clearly separated.

## Diagnostics of the Surprise as an external instrument {#diagextinst}

The major problem that the instrument could have is that it would have a is the serial correlation. There is no evidence of persistent autocorrelation. There is a statistically significant autocorrelation as seen in figure \@ref(fig:acfplot) after 11 lags and also evidence of partial autocorrelation can be seen in the figure \@ref(fig:pacfplot). It can be seen from the following figure.

\begin{figure}

\includegraphics{05-instrument_files/figure-latex/acfplot-1} \hfill{}

\caption{Autocorrelation plot of the instrumental variable.}(\#fig:acfplot)
\end{figure}

\begin{figure}

\includegraphics{05-instrument_files/figure-latex/pacfplot-1} \hfill{}

\caption{Partial autocorrelation plot of the instrumental variable.}(\#fig:pacfplot)
\end{figure}

This autocorrelation of 11 lags would mean that the last year's regulatory announcements have are correlating with the announcements at time step $t$. This can be seen from the bar plot below. As the announcements are not equally distributed between months our results may capture some seasonal impacts if the seasonal variation is not adequately handled.



\begin{flushleft}\includegraphics{05-instrument_files/figure-latex/seasonal-variation-1} \end{flushleft}


This is an additional reason why there is noticeable seasonal fluctuation in the appendix \@ref(seasonapp). 

\newpage
