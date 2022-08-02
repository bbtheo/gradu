# Identification of the structural shock vector from the instrumental variable

As note in the chapter x the structural shock $s_1$ can be identified to the tune of size sing using the external instrument. In this chapter I will mainly follow the example of Känzig (2021) and occasionally Stock and Watson (2018) and with some additions also additions from Montiel-Olea et al. (2021). As stated in the chapter \@ref(extinst) the external instrument method is based on two foundational assumptions. The relevance assumption stated in equation \@ref(eq:cond1) and exogeneity assumption previously stated in the equation \@ref(eq:cond2):

$$
\begin{aligned}
\mathbb{E}(z_t \varepsilon_{1,t}) &= \alpha \neq 0 \\
\mathbb{E}(z_t \varepsilon_{i\neq 1,t}) &= 0 
\end{aligned}
$$

If these assumptions are met the proportions of $s_1$ can be identified.   

$$
s_1\alpha = \mathbb{E}(z_t u_t) = \mathbf{S}\mathbb{E}(z_t \varepsilon_t) = 
\begin{pmatrix}
s_1 & \mathbf{S}_{2}
\end{pmatrix}
\begin{pmatrix}
\mathbb{E}(z_t \varepsilon_{1,t}) \\
\mathbb{E}(z_t \varepsilon_{2,t})
\end{pmatrix}
$$

In the equation above the $s_1$ represents the first column of the structural impact matrix and the $\mathbf{S}_{2}$ are the rest of the columns of the structural impact matrix. To shorten the notations used in this appendix all parameters that represent the variables $\{2 \dots n \}$ are indexed by $2$ rather than $2:n$. The equation above can be divided to the following:

$$
\mathbb{E}(z_t u_t) =
\begin{pmatrix}
\mathbb{E}(z_t u_{1,t}) \\
\mathbb{E}(z_t u_{2,t})
\end{pmatrix}
\begin{pmatrix}
s_{1,1}\alpha \\
s_{2,1}\alpha
\end{pmatrix}
$$

If we combine these two equations above we it will produce:

$$
\tilde{s}_{2,1} \equiv s_{2,1}/s_{1,1} = \frac{\mathbb{E}(z_t u_{2,t})}{\mathbb{E}(z_t u_{1,t})}
$$

This will hold both the $\alpha \neq 0$ and $s_{1,1} \neq 0$.The scale of $s_1$ is from the following normalisation:

$$
\Sigma = \mathbf{S}\Omega\mathbf{S}'
$$

There is two different normalisation strategies when it comes to the choice $\Omega$. It can be declared as $\Omega = \mathbb{I}_n$ this would yield a structural impact matrix that would affect and unit positive value of $\varepsilon_{1,t}$ would have an impact of magnitude of one standard deviation on $y_{1,t}$. Alternative strategy is to set the $\Omega=\text{diag}(\sigma^2_{\varepsilon_1} \dots \sigma^2_{\varepsilon_n})$. This in contrast would mean that a unit positive value $\varepsilon_{1,t}$ has a positive effect of magnitude $x$ that can be assigned by the author.       

In my thesis I assigned the $x = 1$ which would imply in the context of my thesis that the EU carbon policy shock of unit magnitude would be normalised to the size of having an one percentage point increase in Finnish energy prices. In the rest of this appendix I will utilise the former strategy of assigning the $\Omega = \mathbb{I}_n$ as it is more computationally more interesting and the results are so similar that the normalised values can also be derived through this strategy.  

Firstly by partitioning the:

$$
\begin{aligned}
\Sigma &= 
\begin{pmatrix}
\sigma_{1,1} & \sigma_{1,2} \\
\sigma_{2,1} & \Sigma_{2,2}
\end{pmatrix} \text{, and} \qquad
\mathbf{S} =
\begin{pmatrix}
s_{1,1} & s_{1,2} \\
s_{2,1} & \mathbf{S}_{2,2}
\end{pmatrix}\\
\end{aligned}
$$

And as the $\Omega  = \mathbb{I}_n$ it means that the $\Sigma =  \mathbf{S}\mathbf{S}'$:

$$
\begin{pmatrix}
s_{1,1} & s_{1,2} \\
s_{2,1} & \mathbf{S}_{2,2}
\end{pmatrix}
\begin{pmatrix}
s_{1,1} & s'_{2,1} \\
s'_{1,2} & \mathbf{S}'_{2,2}
\end{pmatrix}
= 
\begin{pmatrix}
\sigma_{1,1} & \sigma_{1,2} \\
\sigma_{2,1} & \Sigma_{2,2}
\end{pmatrix}
$$

Because the $\Sigma$ is a symmetric matrix the $\sigma'_{1,2} = \sigma_{2,1}$ it will give us three equations that will have to be solved:

$$
\begin{aligned}
s_{1,1}^2+s_{1,2}s^{'}_{1,2} &= \sigma_{1,1} \\
s_{1,1}s_{2,1} +\mathbf{S}_{2,2}s'_{1,2} &= \sigma_{2,1}\\
s_{2,1}s'_{2,1} + \mathbf{S}_{2,2}\mathbf{S}'_{2,2} &= \Sigma_{2,2}
\end{aligned}
$$

Now we can substitute the $s_{2,1}$ by $\tilde{s}_{2,1}s_{1,1}$:


\begin{align}
s_{1,1}^2+s_{1,2}s^{'}_{1,2} &= \sigma_{1,1}  (\#eq:app1) \\
s_{1,1}^2\tilde{s}_{2,1} +\mathbf{S}_{2,2}s'_{1,2} &= \sigma_{2,1} (\#eq:app2)\\
s_{1,1}^2\tilde{s}_{2,1}\tilde{s}'_{2,1} + \mathbf{S}_{2,2}\mathbf{S}'_{2,2} &= \Sigma_{2,2} (\#eq:app3)
\end{align}


It can be clearly seen, from the equation (\#eq:app1) that the $s_{1,1} = \pm \sqrt{\sigma_{1,1}- s_{1,2}s^{'}_{1,2}}$. For the full identification of $s_1$ we now only need to solve for the $s_{1,2}s^{'}_{1,2}$.

By subtracting equation (\#eq:app1) multiplied by $\tilde{s}_{2,1}$ from equation (\#eq:app2):

$$
\begin{aligned}
\mathbf{S}_{2,2}s'_{1,2} - \tilde{s}_{2,1}s_{1,2}s^{'}_{1,2} &= \sigma_{2,1} - \tilde{s}_{2,1}\sigma_{1,1} \\
(\mathbf{S}_{2,2}- \tilde{s}_{2,1}s_{1,2})s'_{1,2} &= \sigma_{2,1} - \tilde{s}_{2,1}\sigma_{1,1} \\
\Rightarrow s'_{1,2} &= (\mathbf{S}_{2,2}- \tilde{s}_{2,1}s_{1,2})^{-1}(\sigma_{2,1} - \tilde{s}_{2,1}\sigma_{1,1})
\end{aligned}
$$

Now we get that the

$$
\begin{aligned}
 s_{1,2}s'_{1,2} &=(\sigma_{2,1} - \tilde{s}_{2,1}\sigma_{1,1})' \Gamma^{-1}(\sigma_{2,1} - \tilde{s}_{2,1}\sigma_{1,1})
\end{aligned}
$$

Where the

$$
\Gamma = \mathbf{S}_{2,2}\mathbf{S}'_{2,2} - \mathbf{S}_{2,2}s'_{1,2}\tilde{s}'_{2,1} - \tilde{s}_{2,1}s_{1,2}\mathbf{S}'_{2,2} +\tilde{s}_{2,1}s_{1,2}s'_{1,2}\tilde{s}'_{2,1} 
$$

Next step is to subtract the equation (\#eq:app2) which is multipled by $\tilde{s}'_{2,1}$ from the equation (\#eq:app3):

$$
\begin{aligned}
\mathbf{S}_{2,2}\mathbf{S}'_{2,2} - \mathbf{S}_{2,2}s'_{1,2}\tilde{s}'_{2,1} &= \Sigma_{2,2} -\sigma_{2,1}\tilde{s}'_{2,1} \\
\Rightarrow \mathbf{S}_{2,2}s'_{1,2}\tilde{s}'_{2,1} &= \mathbf{S}_{2,2}\mathbf{S}'_{2,2} - (\Sigma_{2,2} - \sigma_{2,1}\tilde{s}'_{2,1}).
\end{aligned}
$$

Substituting this and transpose of it to the helper equation $\Gamma$ will give us

$$
\Gamma = -(\mathbf{S}_{2,2}\mathbf{S}'_{2,2}- \tilde{s}_{2,1}s_{1,2}s'_{1,2}\tilde{s}'_{2,1})+ 2\Sigma_{2,2}-\tilde{s}_{2,1}\sigma_{1,2} -\sigma_{2,1}\tilde{s}'_{2,1}.
$$

Last step in the manipulation of the helper function is to premultiplicate equation (\#eq:app1) by $\tilde{s}_{2,1}$ and and subtract it with equation (\#eq:app3) which has been postmultiplied by $\tilde{s}'_{2,1}$. Which will give us the following

$$
\mathbf{S}_{2,2}\mathbf{S}'_{2,2}- \tilde{s}_{2,1}s_{1,2}s'_{1,2}\tilde{s}'_{2,1} = \Sigma_{2,2}- \sigma_{1,1}\tilde{s}_{2,1}\tilde{s}'_{2,1}.
$$

This will then give us the final form of the helper function:

$$
\Gamma = \Sigma_{2,2}-(\tilde{s}_{2,1}\sigma_{1,2} -\sigma_{2,1}\tilde{s}'_{2,1}) + \sigma_{1,1}\tilde{s}_{2,1}\tilde{s}'_{2,1}.
$$

This will then give us the solution for the:

$$
 s_{1,2}s'_{1,2} = (\sigma_{2,1} - \tilde{s}_{2,1}\sigma_{1,1})'
 [\Sigma_{2,2}-(\tilde{s}_{2,1}\sigma_{1,2} -\sigma_{2,1}\tilde{s}'_{2,1}) + \sigma_{1,1}\tilde{s}_{2,1}\tilde{s}'_{2,1}]^{-1}
 (\sigma_{2,1} - \tilde{s}_{2,1}\sigma_{1,1})
$$

Now the whole stuctural impact vector is identified as a function of known quantities. By choosing the $s_{1,1} = \sqrt{\sigma_{1,1}-s_{1,2}s'_{1,2}}$ it can be interpreted as the standard deviation of $\varepsilon_{1,t}$. The structural impact vector is 

$$
s_1 = 
\begin{pmatrix}
s_{1,1} \\
\tilde{s}_{2,1}s_{1,1}
\end{pmatrix}
$$

As mentioned above I am suing this as he algorithm and thus I provided the mathematical proof of it providing the $s_1$ structural impact vector. The justification of using the notations in equation x in the econometric approach chapter can be clearly seen that if the $\Omega = \text{diag}(\sigma^2_{\varepsilon_1},\dots,\sigma^2_{\varepsilon_n})$ is chosen. The $s_{1,1}$ can be chosen to be a scalar $x$ as the standard deviation is normalised with using the diagonal matrix. This mean that the final impact vector is then

$$
s_1 = 
\begin{pmatrix}
x \\
\tilde{s}_{2,1}x
\end{pmatrix}
$$

It can be then seen that after the $s_{1,1}$ is know it is trivial to transform between the two strategies of normalisation. This is how I used the code that was inspired from the @kaenzig2021 replication files that used an similar strategy that @kaenzig2022.
