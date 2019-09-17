---
layout: post
title: Continued Fractions and Bayesian Statistics
---

It has been a long time since I did anything usefule with continued fractions,
but as part of some data analysis I was doing today the opportunity presented itself
and this math-nerd jumped at it!

# Continued fractions

First off, let's explain what a continued fraction is.
Of course you can read [the Wikipedia entry on continued fractions](https://en.wikipedia.org/wiki/Continued_fraction)
but I'll cover the very basics here.

...

# Beta function priors

If you want to measure a conversion rate then what you have is a Bernoulli trial of $n$ tries and $s$ successes.
Typically you would simply take your best estimate for the rate $r$ as $\hat{r} = s/n$ and print/plot that value.
But you frequently run into cases when you are computing many different rates $\hat{r}_i = s_i/n_i$
where the $n_i$ can vary a whole lot in magnitude.
One way to deal with this is just to set a quality threshold and only use the cases where $n_i >= N$.
Then you treat all the rates $r_i$ similarly.

If you be more rigorous and make use of as much data as you can then we need to come up with a way to combine all examples,
but take into the varying uncertainty on $r_i$.
There are frequentist approaches and in particular back-of-the-envelope approximations
to the confidence interval that I frequently use.
Here, though, I'm going to take a Bayesian approach and compute a credible interval for each $r_i$.
I do this in part because I find this particularly elegant.

The family of beta distributions are parametrized by two parameters, $\alpha$ and $\beta$,
$$ p(x | \alpha, \beta) = \frac{x^{\alpha - 1} (1-x)^{\beta - 1}}{B(\alpha, \beta)} $$
and is a [conjugate prior](https://en.wikipedia.org/wiki/Conjugate_prior) for the binomial distribution
$$ p(x | q) = \choose{s+f,s} q^s (1-q)^f. $$
What this means is that 

# Continued fractions applied

...
