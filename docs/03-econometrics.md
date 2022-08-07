# Econometric approach {#econometrics}

In this section I will describe the econometric model that I will use to identify the structural shocks using the Structural vector autoregression with instruments variables (SVAR-IV). In the formalisation of my model I will follow in the footseps of @kaenzig2022 and @montiel2021.    

## VAR

Presume a standard VAR-model with a lag length of $p$.

\begin{equation} 
y_t = b + B_1y_{t-1}+\dots+ B_py_{t-p}+ u_t
(\#eq:svar)
\end{equation}

Where the $y_t$ refers to a $n \times 1$ vector of the observed endogenous variables at time step $t$. The $B_1,\dots, B_p$ are $n \times n$ coefficient matrices. $u_t$ is an $n \times 1$ vector of the reduced form innovations with a covariance matrix of $\Sigma$.

## Identification of the structural shocks

An integral assumption in using SVAR-models that, the one-step-ahead prediction errors i.e. the innovations $u_t$ are a linear combination of a vector of mutually orthogonal structural shocks $\varepsilon_t$:

$$
u_t = S\varepsilon_t
$$

Where $S$ is a nonsingular $n \times n$ structural impact matrix. Due to the orthogonality the structural the $n \times n$ covariance matrix of $\text{var}(\varepsilon_t)=\Omega$ is diagonal. Thus due the linear mapping of the innovations and structural shocks described in the equation x, we can describe the covariance matrix of the innovations as:

$$
\Sigma = S \Omega S'
$$

For the sake of clarity, the $\varepsilon_{1,t}$ is defined to describe the shock of interest, the carbon policy shock. Latter part of this chapter will present how by using a external instrument approach we can identify the structural impact vector $s_1$ which is analogous to the first column of the structural impact matrix $S$.

## External instrument {#extinst}

For an external instrument $z_t$ to be useful in idenfiying sturctural shocks it has to satisfy the following two conditions:


\begin{align}
\mathbb{E}(z_t \varepsilon_{1,t}) &= \alpha \neq 0  (\#eq:cond1)\\
\mathbb{E}(z_t \varepsilon_{i\neq 1,t}) &= 0 (\#eq:cond2)
\end{align}

 

The equation \@ref(eq:cond1) is the relevance condition and the equation \@ref(eq:cond2)  is the exogeneity condition. If these conditions in tandem with the invertibility requirement are met the sign and the and scale of the $s_1$ can be identified by:


\begin{equation}
s_1 \propto \frac{\mathbb{E}(z_t u_t)}{\mathbb{E}(z_t u_{1,t})}
(\#eq:prop)
\end{equation}


The size of $\alpha$ is the strength of the external instrument and it can be tested with the first-stage heteroskedasticity-robust F-statistic between the instrument and the VAR-residual which is elaborated in the @stock2018 article and which I have reported in the chapter \@ref(firststage). After the structural impact vector has been identified the estimation of the confidence bands in IRF can be done with a moving block bootstrap method, also used by \citet{kaenzig2021,kaenzig2022}.

## Comparing other identification strategies

Other possible strategies to identify the structural shocks would be to use heteroscedasticity based identification of structural vector autoregressions or local projections.  Interesting article by @plagborg2021local offers a proof that local projections and SVARs are estimating the same impulse responses, but they have different finite-sample properties [@plagborg2021local].

When comparing the results of SVAR-IV to ones produced with local projection the variance of the impulse response functions are lower, but with a trade off of bias in the results if the VAR is noninvertible [@wolf2020svar]. In the appendix \@ref(localprojapp) I will provide the impulse responses that are produced via Local projection-instrument variable approach, as an robustness check for the results of the baseline SVAR-IV model. The results we see are at least notionally similar and thus provide additional evidence that the baseline model can be trusted. 

Even though these both would have been a valid choice as an instrument, but as one the main tasks of this thesis is to quasi-replicate the findings of \citeauthor{kaenzig2022} I will continue with the SVAR-Iv that my findings are as comparable as possible.  Additional reasons why I selected the SVAR-IV as my approach was for the reliability and the efficiency, which are paramount in estimating the responses to a shock from a short sample. 

\newpage
