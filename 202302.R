library(data.table)


TODAY <- "202302"
IN <- file.path("data", paste0(TODAY, ".txt"))

## REF https://adventofcode.com/2023/day/2 -------------------------------------
### PART 1 ---------------------------------------------------------------------
# get input and parse into game configs
# find game numbers possible if 12 red, 13 green ,14 blue
# sum game numbers

#### functions -----------------------------------------------------------------
get_colour_max <- function(x, colour){

    vec <- unlist( strsplit(x, ";|,")  ) # get each cube group
    idx <- grep( colour, vec ) # get the colour I want

    if(length(idx) == 0 ){
        return(0L)
    }else{
        # I only need the max_val
        # strip out the numbers and return the max
        return( gsub("\\D", "", vec[idx]) |>
         as.numeric() |>
            max()
        )
    }


   
}

#### start answer --------------------------------------------------------------

inp <- readLines(IN)

# each line is a list item
# each game is a data.table

dt_games <- rbindlist(
    lapply(inp, FUN = function(x){
        game_res <- gsub("(^Game\\ )(\\d+:\\ )(.*)", "\\3", x) 

        dt <- data.table(
            game = as.numeric( gsub("(^Game\\ )(\\d+)(.*)", "\\2", x) ),
            red = get_colour_max(game_res, "red"),
            green = get_colour_max(game_res, "green"),
            blue = get_colour_max(game_res, "blue")
        )
    })
)

dt_games
# find game numbers possible if 12 red, 13 green ,14 bluev

dt_games[red <= 12 & green <= 13 & blue <= 14, sum(game)]

# PART 2------------------------------------------------------------------------
##
## The power of a set of cubes is equal to the numbers of red, 
## green, and blue cubes multiplied together.
##
## For each game, find the minimum set of cubes that must have been present. 
## What is the sum of the power of these sets?
#

dt_games[, sum(red*green*blue)]
