sample_data <- data.frame(
  mut_depth = c(10, 5, 8, 3, 15),
  total_depth = c(100, 80, 120, 50, 200),
  sample = c("Sample1", "Sample2", "Sample3", "Sample4", "Sample5")
)
# Write a unit test
test_that("testfx2 correctly calculates MF", {
  # Apply the function to the sample data
  result <- testfx2(sample_data, mut_depth, total_depth)

  # Check if the column "MF" is calculated correctly
  # added a tolerance so that it accepts small differences in rounding and floating decimals
  expect_equal(result$MF, c(0.1, 0.0625, 0.06666667, 0.06, 0.075), tolerance = 1e-6)
})





