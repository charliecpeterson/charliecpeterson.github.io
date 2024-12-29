# Load necessary library
library(quarto)

directory <- "/Users/charlie/projects/charliecpeterson.github.io"

# Read the original .qmd file
qmd_file <- file.path(directory, "CV.qmd")
qmd_content <- readLines(qmd_file)

# Remove collapsible sections and the entire Skills section
skills_start <- grep("## Skills", qmd_content)
if (length(skills_start) > 0) {
  skills_end <- grep("^## ", qmd_content[(skills_start + 1):length(qmd_content)])
  if (length(skills_end) > 0) {
    skills_end <- skills_end[1] + skills_start
    qmd_content <- qmd_content[-(skills_start:(skills_end - 1))]
  } else {
    qmd_content <- qmd_content[-(skills_start:length(qmd_content))]
  }
}
qmd_content <- qmd_content[!grepl("collapse: true", qmd_content)]

# Remove callout collapse parts but retain the text
callout_lines <- grep("^::: \\{\\.callout", qmd_content)
for (line in rev(callout_lines)) {
  end_line <- grep("^:::$", qmd_content[(line + 1):length(qmd_content)])
  if (length(end_line) > 0) {
    end_line <- end_line[1] + line
    qmd_content <- c(qmd_content[1:(line - 1)], qmd_content[(line + 1):(end_line - 1)], qmd_content[(end_line + 1):length(qmd_content)])
  } else {
    qmd_content <- c(qmd_content[1:(line - 1)], qmd_content[(line + 1):length(qmd_content)])
  }
}

# Remove specific lines: 'Back to Top' and 'Download Full CV'
qmd_content <- qmd_content[!grepl("\\[Back to Top\\]", qmd_content)]
qmd_content <- qmd_content[!grepl("\\[Download Full CV \\(PDF\\)\\]", qmd_content)]
qmd_content <- qmd_content[!grepl("# Curriculum Vitae", qmd_content)]

# Save the modified .qmd file in the same directory
modified_qmd_file <- file.path(directory, "CV_modified.qmd")
writeLines(qmd_content, modified_qmd_file)

# Change working directory to the target directory
setwd(directory)

# Render the modified .qmd file to PDF
quarto_render(input = "CV_modified.qmd", output_format = "pdf", output_file = "CV.pdf")

# Remove the modified .qmd file
if (file.exists("CV_modified.qmd")) {
  file.remove("CV_modified.qmd")
}

# Inform the user
cat("PDF file has been successfully generated in the specified directory:", file.path(directory, "CV.pdf"), "\n")
cat("Temporary modified .qmd file has been removed.\n")