# Exercise 7: DPLYR practice with NBA data
install.packages('dplyr')
library(dplyr)
# Read in the NBA player data into a variable called `team.data` using `read.csv`
team.data <- read.csv(file = 'm9-dplyr/exercise-7/data/teams.csv')
# The data.frame team.data should now be accessible to you. 
# View it, and get some basic information about the number of rows/columns.
View(team.data)
# Note the "X" preceding some of the column titles as well as the "*" 
# following the names of teams that made it to the playoffs that year.

# Add a column that gives the turnovers to steals ratio (TOV / STL) for each team
team.data <- mutate(team.data, turnovers_data = TOV / STL)

# Sort the teams from lowest turnover/steal ratio to highest
# Which team has the lowest ratio?
arrange(team.data,turnovers_data)
lowest_ratio <- filter(team.data,turnovers_data == min(turnovers_data)) %>% 
    select(Team)
# Using the pipe operator, create a new column of assists per game (AST / G) AND
# sort the data.frame by this new column in DESCENDING order.
team.data <- mutate(team.data, assists_game = AST / G) %>% 
    arrange(assists_game)
# Create a data.frame called `good.offense` of teams that scored more than 8700 points (PTS)
good.offense <- filter(team.data, PTS > 8700)
# Create a data.frame called `good.defense` of teams that had more than 470 blocks (BLK)
good.defense <- filter(team.data, BLK > 470)
# Create a data.frame called `defense.stats` that only shows defensive rebounds (DRB), steals (STL),
# and blocks (BLK) along with the team name.
defense.stats <- select(team.data, Team, DRB, STL, BLK)
# Create a data.frame called `offense.stats` that only shows offensive rebounds (ORB), 
# field-goal % (FG.), and assists (AST) along with the team name.
offense.stats <- select(team.data, Team, ORB, FG., AST)
### Bonus ###
# Create a function called `BetterShooters` that takes in two teams and returns
# a data.frame of the team with the better field-goal percentage. The returned 
# data.frame should include the team name, field-goal percentage, and points.
