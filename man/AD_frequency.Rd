% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/RcppExports.R
\name{AD_frequency}
\alias{AD_frequency}
\title{AD_frequency}
\usage{
AD_frequency(ad, delim = ",", allele = 1L, sum_type = 0L, decreasing = 1L)
}
\arguments{
\item{ad}{a matrix of allele depths (e.g., "7,2")}

\item{delim}{character that delimits values}

\item{allele}{which (1-based) allele to report frequency for}

\item{sum_type}{type of sum to calculate, see details}

\item{decreasing}{should the values be sorted decreasing (1) or increasing (0)?}
}
\value{
A numeric matrix of frequencies
}
\description{
Create allele frequencies from matrices of allelic depths (AD)
}
\details{
Files containing VCF data frequently include data on allelic depth (e.g., AD).
This is the number of times each allele has been sequenced.
Our naive assumption for diploids is that these alleles should be observed at a frequency of 1 or zero for homozygous positions and near 0.5 for heterozygous positions.
Deviations from this expectation may indicate allelic imbalance or ploidy differences.
This function is intended to facilitate the exploration of allele frequencies for all positions in a sample.

The alleles are sorted by their frequency within the function.
The user can then specify is the would like to calculate the frequency of the most frequent allele (allele = 1), the second most frequent allele (allele = 2) and so one.
If an allele is requested that does not exist it should result in NA for that position and sample.

There are two methods to calculate a sum for the denominator of the frequency.
When sum_type = 0 the alleles are sorted decendingly and the first two allele counts are used for the sum.
This may be useful when a state of diploidy may be known to be appropriate and other alleles may be interpreted as erroneous.
When sum_type = 1 a sum is taken over all the observed alleles for a variant.
}
\examples{
set.seed(999)
x1 <- round(rnorm(n=9, mean=10, sd=2))
x2 <- round(rnorm(n=9, mean=20, sd=2))
ad <- matrix(paste(x1, x2, sep=","), nrow=3, ncol=3)
colnames(ad) <- paste('Sample', 1:3, sep="_")
rownames(ad) <- paste('Variant', 1:3, sep="_")
ad[1,1] <- "9,23,12"
AD_frequency(ad=ad)


}
