install.packages('iris') # Iris is a built in dataset, it comes when R is installed so there is no need to install it.
install.packages('gapminder')

iris
library(ggplot2)

# plot 1
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

# plot 2
plot.new
frame()
frame.new
?frame
?transform

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
new_df <- mutate(gapminder, log_gdpPercap = log(gdpPercap))

new_df
gapminder

# try to plot now

ggplot(data = new_df, aes(x = log_gdpPercap, 
                             y = lifeExp, 
                             by = country,
                             colour = continent)) +
  geom_point()
