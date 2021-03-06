% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/fit.R
\name{jlpcr}
\alias{jlpcr}
\title{Joint Likelihood Principal Components Regression}
\usage{
jlpcr(
  Y,
  X,
  k,
  rho = 0,
  tol = 1e-10,
  maxit = 1000,
  mean_Y = TRUE,
  mean_X = TRUE,
  scale = FALSE,
  quiet = TRUE,
  L,
  m = 2
)
}
\arguments{
\item{Y}{Matrix (n x r) of responses; rows correspond to observations}

\item{X}{Matrix (n x p) of predictors; rows correspond to observations}

\item{k}{Integer number of principal components to use; can be a vector}

\item{rho}{Numeric ridge penalty on alpha in representation beta = L alpha}

\item{tol}{Numeric tolerance for L-BFGS-B on profile log-likelihood}

\item{maxit}{Integer maximum number of iterations of L-BFGS-B algorithm}

\item{mean_Y}{Bool indicating the mean of Y should be a parameter; if FALSE,
it is assumed E(Y) = 0.}

\item{mean_X}{Bool indicating the mean of X should be a parameter; if FALSE,
it is assumed E(X) = 0.}

\item{scale}{Bool indicating each predictor is divided by its sample
standard deviation}

\item{quiet}{Bool indicating no information printed from L-BFGS-B algorithm}

\item{L}{Matrix (p x k) starting value in L-BFGS-B for the Cholesky root
in the decomposition Sigma_X = tau (I + LL')}

\item{m}{Numeric penalty in information criterion
- 2 * log-likelihood + m * n_params; can be a vector}
}
\value{
If length(k) = 1, returns a list with estimates:
         beta (regression coefficient),
         Sigma (response covariance matrix),
         Sigma_X (predictor covariance matrix),
         L (Cholesky root in decomposition Sigma_X = tau[I + LL']),
         tau (smallest eigenvalue of Sigma_X; has multiplicity p - k), and
         IC (information criterion).
         
        If length(k) > 1, returns a list of lists of length k + 1 where for
        j in 1:k the jth element is the list returned by jlpcr with k = k[j]
        and the (k + 1)th element is a vector of the same length as m where
        the jth element is the k selected by the IC corresponding to m[j].
}
\description{
\code{jlpcr} fits a principal components regression by maximizing the joint likelihood 
 of multivariate normal responses and predictors.
}
\details{
This is the only function exported from the package with the same name. 
The likelihood maximized is that for n independent observations 
from a normal multivariate response linear regression model where the column space
of the p-by-r coefficient matrix is spanned by the k leading eigenvectors (corresponding to
the largest eigenvalues) of the predictors' covariance matrix.
This covariance matrix is assumed to be spiked, meaning its
smallest eigenvalue has multiplicity p - k.
}
