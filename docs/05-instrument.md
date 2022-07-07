# Instrument

Juttuja instrumentin käyttämisestä asian mittaamiseks jota ei voi mitata yleistä teoriaa instrumentti muuttujista

## Futures market

The usage of futures markets relies on  the hypothesis that the markets will effectively incorporate all available information to the price discovery mechanism (Hayek, 1945). That would then 

Standard theory on asset price formation which was formulated by Pindyck (2001) predicts that futures contracts on a day $d$ with a maturity $h$ are valued as:

$$
  F_d^h = \mathbb{E}_d(P_{d+h})-RP^h_d
$$

Are a combination of the expected price of the asset $P_{d+h}$ with the information available on the date $d$ and the risk premium. It is apparent from the equation 

## High-frequency identification

I will follow the Känzig's formulation with the high-frequency identification of the instrument. It is based on similar approach that was used by Romer and Romer (2010), and Känzig (2021) in his previous research on the consequences of the OPEC announcements. The surprise series of the carbon futures market is calculated from the log differences in the daily closing price of the EU emission trading certificate futures.

It can be assumed that because of the tight identification period the changes in the risk premium are not changing $RP_d \approx RP_{d-1}$ and thus the surprise series is representing the updates in the expected future price of the emission trading certificates.


$$
\begin{split}
  \text{Surprise}_d &= F^h_d-F^h_{d-1} \\
  &= \mathbb{E}_d(P_{d+h})-RP^h_d-\mathbb{E}_{d-1}(P_{d+h})+RP^h_{d-1} \\
  &= \mathbb{E}_d(P_{d+h})-\mathbb{E}_{d-1}(P_{d+h}) 
\end{split}
$$


This daily surprise series is the aggregated to a monthly carbon policy surprise series. A indicator function $1_{cp}(d)$ whether a day contains an carbon policy regulatory event is used to mask days with now regulatory events to zero. The regulatory events are listed in Appendix B.

$$
\text{CPSurprise}_m = \sum_{d\in m}\text{Surprise}_d 1_{cp}(d)
$$

This monthly surprise series is an ideal external instrument due to the exogeneity resulting from the short time frame of the identification. This means that a 

## Regulatory Dates

The identification of regulatory events is a vital part of the building of this instrument. In the figure 1 the values of the $\text{CPSurprise}_m$ can be clearly seen.

![Figure 3: Carbon policy surprise series](Slide_pictures/surprise.png){}

The dates are collected prior to ???

## Diagnostics of the Surprise as an external instrument

The major problem that the instrument could have is that it would have a is the serial correlation. THankfully there is no evidence of persistent autocorrelation. There is a statistically significant autocorrelation after 11 lags. It can be seen from the following figure.

![Autocorrelation of the instrument](Slide_pictures/acf.png){}

This autocorrelation of 11 lags would mean that the last year's regulatory announcements have are correlating with the announcements at time step $t$. This can be seen from the bar plot below. As the announcements are not equally distributed between months our results may capture some seasonal impacts if the seasonal variation is not adequately handled.

![Monthly annoucements and their effects to the future prices](Slide_pictures/shock_amounts.png){}

This is an additional reason why there is noticeable seasonal fluctuation in the appendix x. 

\newpage