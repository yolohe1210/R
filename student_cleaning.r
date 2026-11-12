# 1. Demonstrate 5 different R data types
print("=== 1. Demonstrate 5 Different R Data Types ===")
char_var <- "Computer Science"     # 1. Character
num_var  <- 88.5                   # 2. Numeric
int_var  <- as.integer(20)         # 3. Integer
log_var  <- TRUE                   # 4. Logical
date_var <- as.Date("2026-06-01")  # 5. Date

print(paste("Character variable:", char_var))
print(paste("Numeric variable:", num_var))
print(paste("Integer variable:", int_var))
print(paste("Logical variable:", log_var))
print(paste("Date variable:", date_var))
cat("\n")

# 2. Import or create dataset (Stretch Challenge: CSV file import)
print("=== 2. Import or Create Dataset ===")
input_file <- "students.csv"

if (file.exists(input_file)) {
  students_df <- read.csv(input_file, stringsAsFactors = FALSE)
  print("Successfully imported data from students.csv!")
} else {
  # Fallback to mock dataset (including an invalid grade for validation demo)
  students_df <- data.frame(
    Name = c("Alice", "Bob", "Charlie", "Alice", "David", "Eve", "Frank"),
    Age = c(20, 21, 22, 20, NA, 23, 19),
    Course = c("Math", "Physics", "Computer Science", 
               "Math", "Chemistry", NA, "Physics"),
    Grade = c(85.0, 90.5, 78.0, 85.0, 92.0, 65.0, 105.0),
    EnrolledDate = as.Date(c("2025-09-01", "2025-09-01", "2025-09-02", 
                             "2025-09-01", "2025-09-03", "2025-09-03", 
                             "2025-09-04"))
  )
  print("No local CSV found. Created mock dataset automatically.")
}
print(students_df)
cat("\n")

# 3. Advanced Function: Inspect types and missing values using sapply
print("=== 3. Advanced Function: Type Inspection & Missing Values ===")
inspect_data <- function(df) {
  cat("Data types of each column:\n")
  print(sapply(df, class))
  cat("\nMissing values count per column:\n")
  print(colSums(is.na(df)))
}
inspect_data(students_df)
cat("\n")

# 4. Function: Clean data, remove duplicates, and validate grade ranges
print("=== 4. Function to Clean Data & Validate Ranges ===")
clean_and_validate <- function(df) {
  cleaned <- unique(df)       # Remove duplicate rows
  cleaned <- na.omit(cleaned) # Remove rows with missing values
  
  # Validate grade range (0 to 100)
  invalid_rows <- which(cleaned$Grade < 0 | cleaned$Grade > 100)
  if (length(invalid_rows) > 0) {
    msg <- sprintf("Notice: Removing %d record(s) with out-of-range grades.\n", 
                   length(invalid_rows))
    cat(msg)
    cleaned <- cleaned[-invalid_rows, ]
  }
  
  cat("Number of valid rows after cleaning:", nrow(cleaned), "\n")
  return(cleaned)
}
cleaned_students <- clean_and_validate(students_df)
print(cleaned_students)
cat("\n")

# 5. Function: Calculate comprehensive statistics returning a list
print("=== 5. Function to Calculate Statistics (Returns a List) ===")
get_statistics <- function(df) {
  stats_list <- list(
    MeanGrade = mean(df$Grade),
    MedianGrade = median(df$Grade),
    TotalStudents = nrow(df)
  )
  return(stats_list)
}
student_stats <- get_statistics(cleaned_students)
cat(sprintf("Total Valid Students: %d\n", student_stats$TotalStudents))
cat(sprintf("Mean Grade: %.2f\n", student_stats$MeanGrade))
cat(sprintf("Median Grade: %.2f\n\n", student_stats$MedianGrade))

# 6. Advanced Loop with Conditional Logic: Assign Letter Grades
print("=== 6. Loop with Conditional Logic for Letter Grades ===")
letter_grades <- character(nrow(cleaned_students))

for (i in seq_len(nrow(cleaned_students))) {
  g <- cleaned_students$Grade[i]
  
  # Conditional control flow
  if (g >= 90) {
    letter_grades[i] <- "A"
  } else if (g >= 80) {
    letter_grades[i] <- "B"
  } else if (g >= 70) {
    letter_grades[i] <- "C"
  } else {
    letter_grades[i] <- "F"
  }
  
  out_msg <- sprintf("Record [%d] -> Name: %s | Grade: %.1f | Letter: %s\n", 
                     i, cleaned_students$Name[i], g, letter_grades[i])
  cat(out_msg)
}

# Append the new letter grade column to the dataframe
cleaned_students$Letter <- letter_grades
cat("\n")

# 7. Stretch Challenge: Export enhanced dataset to a new CSV file
print("=== 7. Export Enhanced Dataset to CSV ===")
output_file <- "cleaned_students_advanced.csv"
write.csv(cleaned_students, file = output_file, row.names = FALSE)
cat(sprintf("Enhanced dataset successfully saved to: %s\n", output_file))