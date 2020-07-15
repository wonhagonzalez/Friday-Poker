Friday_Poker <- read.csv("C:/Users/wonha/Desktop/My Projects/Friday_Poker.csv")
Friday_Poker$Poker_Earnings <- Friday_Poker$Poker_Winnings - Friday_Poker$Poker_Wagered 
Friday_Poker$Side_WinPct <- Friday_Poker$Side_Bets_Won/Friday_Poker$Side_Bets
Friday_Poker$Total_Action <- Friday_Poker$Buy.ins + Friday_Poker$Side_Bets
Friday_Poker$Total_Earnings <- Friday_Poker$Poker_Earnings + Friday_Poker$Side_Earnings

##dealing with NaN for win pct.
sum(is.na(Friday_Poker$Side_WinPct))
Friday_Poker$Side_WinPct[is.na(Friday_Poker$Side_WinPct)] <- NA
sum(is.na(Friday_Poker$Side_WinPct))

library(ggplot2)
library(plotly)

p <- ggplot(Friday_Poker) + aes(x = Total_Earnings, y = Total_Action) + geom_point()
ggplotly(p)

p1 <- ggplot(Friday_Poker) +
 aes(x = Total_Action, y = Total_Earnings, colour = Participants) +
 geom_point(size = 3L) +
 scale_color_hue() +
 labs(x = "# of Bets", y = "Earnings ($)", title = "Friday Poker", subtitle = "Total Earnings vs. Total Bets Made", color = "Players") +
 theme_minimal()
ggplotly(p1)

p2 <- ggplot(Friday_Poker) +
 aes(x = Buy.ins, y = Victories, colour = Participants, size = Poker_Winnings) +
 geom_point() +
 scale_color_hue() +
 labs(x = "# of Buy-Ins", y = "Games Won", title = "Friday Poker", subtitle = "Poker Results", color = "Players", size = "Money Earned") +
 theme_minimal()
ggplotly(p2)

p3 <- ggplot(Friday_Poker) +
 aes(x = Side_Bets, y = Side_Earnings, colour = Participants, size = Side_WinPct) +
 geom_point() +
 scale_color_hue() +
 labs(x = "# of Side Bets", y = "Side Earnings ($)", title = "Friday Poker", subtitle = "Side Bets", color = "Players", size = "Win Pct.") +
 theme_minimal()
ggplotly(p3)

