#' Normalize a matrix of RNA-seq counts
#'
#' @param counts A numeric matrix of raw read counts, with genes in rows
#'     and samples in columns.
#' @param method Character indicating the normalization method. One of
#'     "cpm" (counts per million) or "log2cpm" (log2 of CPM + 1).
#'     Default: "cpm".
#'
#' @return A numeric matrix with the same dimensions as `counts`,
#'     containing normalized expression values.
#'
#' @export
#'
#' @examples
#' counts <- matrix(c(10, 0, 5, 20, 3, 7), nrow = 3)
#' normalizeCounts(counts, method = "log2cpm")
normalizeCounts <- function(counts, method = c("cpm", "log2cpm")) {
    method <- match.arg(method)
    .checkCounts(counts)

    libsize <- colSums(counts)
    cpm <- t(t(counts) / libsize) * 1e6

    if (method == "log2cpm") {
        cpm <- log2(cpm + 1)
    }

    return(cpm)
}

## Internal helper: validate input count matrix
.checkCounts <- function(counts) {
    if (!is.matrix(counts) || !is.numeric(counts)) {
        stop("'counts' must be a numeric matrix.")
    }
    if (any(counts < 0, na.rm = TRUE)) {
        stop("'counts' cannot contain negative values.")
    }
    if (anyNA(counts)) {
        warning("'counts' contains NA values.")
    }
    invisible(TRUE)
}
