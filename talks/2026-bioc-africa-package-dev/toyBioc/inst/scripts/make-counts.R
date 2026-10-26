## Code used to create inst/extdata/counts.tsv
##
## Data are simulated counts for 6 genes and 4 samples (2 control,
## 2 treatment) generated with a negative binomial distribution.

set.seed(123)
counts <- matrix(
    rnbinom(24, mu = 100, size = 10), nrow = 6,
    dimnames = list(
        paste0("gene", 1:6),
        c("ctrl1", "ctrl2", "trt1", "trt2")
    )
)

write.table(
    counts, file = "inst/extdata/counts.tsv",
    sep = "\t", quote = FALSE, col.names = NA
)
