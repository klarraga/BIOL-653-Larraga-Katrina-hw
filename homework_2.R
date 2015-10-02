<<<<<<< HEAD

library(ggplot2)

#### plot 1 ####

=======
install.packages('iris') # Iris is a built in dataset, it comes when R is installed so there is no need to install it.
install.packages('gapminder')

iris
library(ggplot2)

# You need to load gapminder

# plot 1
>>>>>>> f75d62915976ebbdff58daa7ff05586d7cbac01d
# why isnt this working?
ggplot2(data = gapminder, aes(x = gdpPercap, y =lifeExp)) + geom_point()

# its ggplot, not ggplot2
ggplot(data = gapminder, aes(x = year, y =lifeExp)) + geom_point()

# set it to color by country

ggplot(data = gapminder, aes(x = gdpPercap, 
                             y = lifeExp, 
                             by = country,
                             colour = country)) +
  geom_point()

# set to color by continent
ggplot(data = gapminder, aes(x = gdpPercap, 
                             y = lifeExp, 
                             by = country,
                             colour = continent)) +
  geom_point()

p1 <-
  ggplot(data = gapminder, aes(x = gdpPercap, 
                                        y = lifeExp, 
                                        by = country,
                                        colour = continent)) +
  geom_point()

plot_1
rm(plot_1)
p1
# yay! success

#### plot 2 ####
plot.new
frame()
frame.new
?frame
?transform

# I think your'e looking for: dev.new() here

# restarted R session
library(ggplot2)
ggplot(data = gapminder, aes(x = gdpPercap, 
                             y = lifeExp, 
                             by = country,
                             colour = continent)) +
  geom_point()
p1
# the above restart worked and now my plot is running

?transform
transform(loggdpPercap = log(gdpPercap
) )
ggplot
ggplot2
library(ggplot2)
library(dplyr)
gapminder
head(gapminder)
# this works cause ram taught me

# look at the arguments and examples for mutate() - the dplyr tutorial using the nycflights13 data will be useful to help you clean this up.
mutate(gapminder, loggdpPercap = log(gapminder$'gdpPercap'
) )

# trying to figure out how to view my loggdpPercap
?view
??view
view(1:10)
?show

# run to plot
ggplot(data = gapminder, aes(x = loggdpPercap, 
                             y = lifeExp, 
                             by = country,
                             colour = continent)) +
  geom_point()
loggdpPercap

log(gapminder$'gdpPercap')

mutate(gapminder, loggdpPercap = log(gapminder$'gdpPercap'
) )

loggdpPercap <- log(gapminder$'gdpPercap')
head(gapminder)
?add
rm(loggdpPercap)

# jillian taught me how to save it to new_df

mutate(gapminder, log_gdpPercap = log(gdpPercap))
new_df <- mutate(gapminder, log_gdpPercap = log(gdpPercap)) # perfect

new_df
gapminder

# try to plot now

ggplot(data = new_df, aes(x = log_gdpPercap, 
                             y = lifeExp, 
                             by = country,
                             colour = continent)) +
  geom_point()
# set to p2 for Plot 2

p2 <- ggplot(data = new_df, aes(x = log_gdpPercap, 
                                y = lifeExp, 
                                by = country,
                                colour = continent)) +
  geom_point()
# yay! success

### Plot 3 ####

#saw on website. this doesn't work
new_df
p2 +
  geom_smooth(method = lm, se = FALSE )

?smooth
?geom_smooth
?lm
p2

# Isaac taught me to add the "group" to 1 for the
# geom_smooth command so that it only sees it as
# one group

p2 +
  geom_smooth(method = lm, se = FALSE, aes(group = 1))

p3 <- p2 +
  geom_smooth(method = lm, se = FALSE, aes(group = 1))

#success


#### Plot 4 ####

# this isnt working either

# This doesn't calculate the value that we are interested in.
gapminder %>%
mutate(density = lifeExp * pop) %>%
  group_by(continent) %>%
  summarise(mean_density = mean (density))

# Same thing here, just calculating a new column of life expectancy times population (not a value we are interested in)
mean_density_df <- mutate(gapminder, density = lifeExp * pop)

# Restarted R session
library(gapminder)
library(ggplot2)
library(dplyr)
library(mean_density_df)

# you need to add fill 
ggplot(data = gapminder, aes(x = lifeExp, colour = continent)) +
  geom_density() +
  facet_wrap(~ year, ncol = 4)


dev.new()
# below does NOT have the by = year in ggplot aes
# command but still has same output

ggplot(data = mean_density_df, aes(x = lifeExp)) +
          geom_density(data = mean_density_df,
                       alpha = 0.5,
                       aes(by = continent,
                           by = year,
                           fill = continent)) +
          facet_wrap(~ year, ncol = 4)

# Isaac helped me
# realize that I didnt need to filter the years
# also that I just needed to use wrap so that it'll
# wrap it with 4 columns

p4 <- ggplot(data = mean_density_df, aes(x = lifeExp)) +
  geom_density(alpha = 0.5,
               aes(by = continent,
                   by = year,
                   fill = continent)) +
  facet_wrap(~ year, ncol = 4)
p4

# Success after 5 hours

#### Plot 5 ####

ggplot( data = gapminder, aes(x = continent,
                              y = lifeExp,
                              color = continent)) +
  geom_boxplot(data = gapminder, aes(by = year)) +
  facet_wrap(~ year, ncol = 4)

p5 <- ggplot( data = gapminder, aes(x = continent,
                                    y = lifeExp,
                                    color = continent)) +
  geom_boxplot(data = gapminder, aes(by = year)) +
  facet_wrap(~ year, ncol = 4)

# success on the first try.

?subset

#### Plot 6 ####

mean_density_df

# This works!!! Isaac helped again

mean_density_df
ggplot(data = mean_density_df) + 
  geom_density(data = mean_density_df,  alpha = (0.5), 
               aes( x = lifeExp,
                    by = continent,
                    colour = continent,
                    fill = continent)) +
  geom_line()

# to make lines black, do not specify color. only fill
mean_density_df
ggplot(data = mean_density_df) + 
  geom_density(data = mean_density_df,  alpha = (0.5), 
               aes( x = lifeExp,
                    by = continent,
                    fill = continent))

# trying with what jillian taught me
ggplot(data = gapminder) +
  geom_density(alpha = 0.5, aes(x = lifeExp,
                                by = continent,
                                fill = continent))



p6 <- ggplot(data = gapminder) +
  geom_density(alpha = 0.5, aes(x = lifeExp,
                                by = continent,
                                fill = continent))

# Success

#### Plot 7 ####
p6

# made a subset
subset(gapminder, continent == "Asia")

ggplot(subset(gapminder, continent == "Asia"), aes( x = lifeExp)) +
  geom_density(fill = "blue", alpha = 0.5) +
  ggtitle("Life Expectancy in Asia") +
  geom_vline(xintercept = 60)

p7 <- ggplot(subset(gapminder, continent == "Asia"), aes( x = lifeExp)) +
  geom_density(fill = "green", alpha = 0.5) +
  ggtitle("Life Expectancy in Asia")+
  geom_vline(xintercept = mean(gapminder$lifeExp))

#### Plot 8 ####

# this is plot 4-- as example. delete after
ggplot(data = mean_density_df, aes(x = lifeExp)) +
  geom_density(alpha = 0.5,
               aes(by = continent,
                   by = year,
                   fill = continent)) +
  facet_wrap(~ year, ncol = 4)


ggplot(gapminder, aes(x = lifeExp)) +
  geom_density(alpha =0.5,
               aes(by = continent,
                   fill = continent)) +
  facet_wrap(~ continent, ncol = 3) +
  geom_vline(xintercept = mean(gapminder, lifeExp))
mean_life_exp <- summarise(gapminder,
          mean = mean(lifeExp))
mean_life_exp

ggplot(gapminder, aes(x = lifeExp)) +
  geom_density(alpha =0.5,
               aes(by = continent,
                   fill = continent)) +
  facet_wrap(~ continent, ncol = 3) +
  geom_vline(xintercept = mean(gapminder$lifeExp)) # Is there another way to get the mean line like that? Also, is there another way to get the mean without using the $ inbetween gapminder and lifeExp?


p8 <- ggplot(gapminder, aes(x = lifeExp)) +
  geom_density(alpha =0.5,
               aes(by = continent,
                   fill = continent)) +
  facet_wrap(~ continent, ncol = 3) +
  geom_vline(xintercept = mean(gapminder$lifeExp))
p8 # I have no idea why my "mean" lines are not at the same location as on the example on the hw. Help!!

#### PART 3 ####

library(ggplot2)
hw_gapminder <- read.csv('hw_gapminder_from_site.csv')
mean_lifeExp <- mean(hw_gapminder$lifeExp)
mean_lifeExp
small_set <- hw_gapminder[c(1, 2, 3, 4, 1300:1304), c('country', 'continent', 'year')]
small_set #yay! I found it!

mean_gdp <- mean(hw_gapminder$gdpPercap)

#maybe just try gapminder?

mean(gapminder$gdpPercap)

max_country <- hw_gapminder$country[which(hw_gapminder$lifeExp = max),
                                    (hw_gapminder$lifeExp)]
