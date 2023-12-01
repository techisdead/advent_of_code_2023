TODAY <- "202301"
IN <- file.path("data", paste0(TODAY, ".txt"))

## REF https://adventofcode.com/2023/day/1 -------------------------------------
### PART 1 ---------------------------------------------------------------------
# get input
# strip out digits
# if one then replicate it
# sum all

inp <- readLines(IN)

inp_num <- gsub("[A-z]", "", inp)

res <- paste0(
    substr(inp_num, start = 1, stop = 1),
    substr(inp_num, start = nchar(inp_num), stop = nchar(inp_num))
    ) |>
        as.numeric() |>
        sum()


    
print(res)

## PART 2-----------------------------------------------------------------------
# convert english letters to numbers
#   - make a lookup
#   - Join it on
# repeat part 1


res <- paste0(
    substr(inp_num, start = 1, stop = 1),
    substr(inp_num, start = nchar(inp_num), stop = nchar(inp_num))
    ) |>
        as.numeric() |>
        sum()

print(res)



## from reddit tip - solution for edge cases like twone
nums <- list(
    "zero"= "z0o", "one" = "o1e", "two" = "t2o", "three" = "t3e", 
    "four" = "f4r", "five" = "f5e",
    "six" = "s6x", "seven" = "s7n", "eight" = "e8t", "nine" = "n9")

inp_num <- character(length(inp))

inp_num <- lapply(inp, FUN = function(this_string){

    for (this_num in seq_along(nums)){

       this_string <- gsub( 
        pattern = names(nums)[this_num], 
        replace = nums[this_num],
        x = this_string
        )
    }
    this_string
}) |> unlist()


inp_num <- gsub("[A-z]", "", inp_num)

res <- paste0(
    substr(inp_num, start = 1, stop = 1),
    substr(inp_num, start = nchar(inp_num), stop = nchar(inp_num))
    ) |>
        as.numeric() |>
        sum()

print(res)

## solved ----------------------------------------------------------------------
