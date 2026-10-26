## Toy data: 3 genes x 2 samples
counts <- matrix(c(10, 0, 5, 20, 3, 7), nrow = 3)

test_that("normalizeCounts() returns CPM values", {
    cpm <- normalizeCounts(counts, method = "cpm")

    expect_true(is.matrix(cpm))
    expect_equal(dim(cpm), dim(counts))
    expect_equal(unname(colSums(cpm)), c(1e6, 1e6))
})

test_that("normalizeCounts() throws errors for invalid input", {
    expect_error(normalizeCounts(as.data.frame(counts)), "numeric matrix")
    expect_error(normalizeCounts(-counts), "negative")
})
