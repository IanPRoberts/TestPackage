// SUMMARY: Infer the two means and standard deviation of a normal mixture model
// given samples from the mixture distribution


data {
  int<lower=0> N;           // Number of observations
  vector[N] y;              // Observations from the distribution
  real<lower=0,upper=1> p;  // Mixing parameter of the normal mixture
  real<lower=0> sigma;      // Fixed sd of each peak
}

// The parameters accepted by the model. Our model
// accepts two parameters 'mu' and 'sigma'.
parameters {
  real mu_lower;
  real <lower=mu_lower> mu_upper;
  // real<lower=0> sigma;
}

model {
  target += p     * normal_lpdf( y | mu_lower, sigma )
          + (1-p) * normal_lpdf( y | mu_upper, sigma );
}

