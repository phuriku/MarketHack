require 'CSV'
require 'open-uri'

tickers = [
  {
    symbol: 'AAPL',
    name: 'Apple',
    sector: 'Tech',
    beta: 1.31
  },
  {
    symbol: 'GOOG',
    name: 'Google',
    sector: 'Tech',
    beta: 1.15
  },
  {
    symbol: 'YHOO',
    name: 'Yahoo!',
    sector: 'Tech',
    beta: 0.93
  },
  {
    symbol: 'IBM',
    name: 'IBM Inc.',
    sector: 'Tech',
    beta: 0.91
  },
  {
    symbol: 'HPQ',
    name: 'Hewlett-Packard',
    sector: 'Tech',
    beta: 1.29
  },
  {
    symbol: 'TSLA',
    name: 'Tesla Motors',
    sector: 'Tech',
    beta: 1.46
  },
  {
    symbol: 'DDD',
    name: '3D Systems',
    sector: 'Tech',
    beta: 1.32
  },
  {
    symbol: 'P',
    name: 'Pandora',
    sector: 'Tech',
    beta: 0.54
  },
  {
    symbol: 'MSFT',
    name: 'Microsoft',
    sector: 'Tech',
    beta: 0.71
  },
  {
    symbol: 'ORCL',
    name: 'Oracle',
    sector: 'Tech',
    beta: 1.24
  },
  {
    symbol: 'SNE',
    name: 'Sony',
    sector: 'Tech',
    beta: 2.08
  },
  {
    symbol: 'LNKD',
    name: 'LinkedIn',
    sector: 'Tech',
    beta: 1.28
  },
  {
    symbol: 'TWTR',
    name: 'Twitter',
    sector: 'Tech',
    beta: 0
  },
  {
    symbol: 'FB',
    name: 'Facebook',
    sector: 'Tech',
    beta: 0.77
  },
  {
    symbol: 'T',
    name: 'AT&T',
    sector: 'Tech',
    beta: 0
  },
  {
    symbol: 'VZ',
    name: 'Verizon',
    sector: 'Tech',
    beta: 0.23
  },
  {
    symbol: 'S',
    name: 'Sprint',
    sector: 'Tech',
    beta: -1.36
  },
  {
    symbol: 'INTC',
    name: 'Intel',
    sector: 'Tech',
    beta: 0.91
  },
  {
    symbol: 'TXN',
    name: 'Texas Instr.',
    sector: 'Tech',
    beta: 1.33
  },
  {
    symbol: 'AMD',
    name: 'AMD Inc.',
    sector: 'Tech',
    beta: 2.55
  },
  {
    symbol: 'AMZN',
    name: 'Amazon',
    sector: 'Tech',
    beta: 1.09
  },
  {
    symbol: 'NFLX',
    name: 'Netflix',
    sector: 'Tech',
    beta: 1.04
  },
  {
    symbol: 'SN',
    name: 'Sanchez Energy',
    sector: 'Energy',
    beta: 1.01
  },
  {
    symbol: 'REXX',
    name: 'Rex Energy',
    sector: 'Energy',
    beta: 0.75
  },
  {
    symbol: 'BP',
    name: 'British Petroleum',
    sector: 'Energy',
    beta: 1.43
  },
  {
    symbol: 'TM',
    name: 'Toyota',
    sector: 'Auto',
    beta: 0.71
  },
  {
    symbol: 'GM',
    name: 'General Motors',
    sector: 'Auto',
    beta: 1.7
  },
  {
    symbol: 'F',
    name: 'Ford',
    sector: 'Auto',
    beta: 1.44
  },
  {
    symbol: 'CHK',
    name: 'Chesapeake E.',
    sector: 'Energy',
    beta: 1.22
  },
  {
    symbol: 'HAL',
    name: 'Halliburton',
    sector: 'Energy',
    beta: 1.59
  },
  {
    symbol: 'SLB',
    name: 'Schlumberger',
    sector: 'Energy',
    beta: 1.63
  },
  {
    symbol: 'BHI',
    name: 'Baker Hughes',
    sector: 'Energy',
    beta: 1.58
  },
  {
    symbol: 'XOM',
    name: 'Exxon Mobile',
    sector: 'Energy',
    beta: 0.88
  },
  {
    symbol: 'SDRL',
    name: 'Seadrill',
    sector: 'Energy',
    beta: 1.72
  },
  {
    symbol: 'RIG',
    name: 'Transocean',
    sector: 'Energy',
    beta: 1.80
  },
  {
    symbol: 'MHR',
    name: 'Magnum H.',
    sector: 'Energy',
    beta: 1.82
  },
  {
    symbol: 'EQT',
    name: 'EQT Corp.',
    sector: 'Energy',
    beta: 0.99
  },
  {
    symbol: 'CVX',
    name: 'Chevron',
    sector: 'Energy',
    beta: 1.12
  },
  {
    symbol: 'COP',
    name: 'ConocoPhillips',
    sector: 'Energy',
    beta: 1.28
  },
  {
    symbol: 'GS',
    name: 'Goldman Sachs',
    sector: 'Finance',
    beta: 1.74
  },
  {
    symbol: 'JPM',
    name: 'JP Morgan',
    sector: 'Finance',
    beta: 1.81
  },
  {
    symbol: 'DB',
    name: 'Deutsche Bank',
    sector: 'Finance',
    beta: 1.78
  },
  {
    symbol: 'CS',
    name: 'Credit Suisse',
    sector: 'Finance',
    beta: 1.57
  },
  {
    symbol: 'BLK',
    name: 'Blackstone',
    sector: 'Finance',
    beta: 1.46
  },
  {
    symbol: 'BCS',
    name: 'Barclays',
    sector: 'Finance',
    beta: 1.88
  },
  {
    symbol: 'V',
    name: 'Visa',
    sector: 'Finance',
    beta: 0.82
  },
  {
    symbol: 'MA',
    name: 'Mastercard',
    sector: 'Finance',
    beta: 0.93
  },
  {
    symbol: 'AXP',
    name: 'Am. Express',
    sector: 'Finance',
    beta: 1.11
  },
  {
    symbol: 'COF',
    name: 'Capital One',
    sector: 'Finance',
    beta: 1.21
  },
  {
    symbol: 'AIG',
    name: 'AIG Inc.',
    sector: 'Finance',
    beta: 1.78
  },
  {
    symbol: 'AFL',
    name: 'AFLAC Inc.',
    sector: 'Finance',
    beta: 1.50
  },
  {
    symbol: 'AET',
    name: 'Aetna',
    sector: 'Finance',
    beta: 1.01
  },
  {
    symbol: 'ANTM',
    name: 'Anthem',
    sector: 'Finance',
    beta: 0.57
  },
  {
    symbol: 'MET',
    name: 'Metlife',
    sector: 'Finance',
    beta: 1.87
  },
  {
    symbol: 'C',
    name: 'Citigroup',
    sector: 'Finance',
    beta: 1.79
  }
]

pages = [
  {
    title: 'Active Stocks (by Volume)',
  },
  {
    title: 'Active Stocks (by Price Change)'
  },
  {
    title: 'Value Stocks',
    description: 'Value stocks are defined as stocks that have good fundamentals and profit expectations relative to market expectations, regardless of recent price movement. In technical terms, this means that the profit expectation as expounded by P/E is undervalued, and in time the stock is bound to move higher.',
    advantages: 'This is a low risk, strong reward strategy, but one that requires a great deal more analysis than other strategies like momentum investing or volatility investing. Many of the world\'s most famous and successful investors are self-proclaimed value investors, like Warren Buffett, Paul Graham, and David Einhorn.',
    warnings: 'Measures that value investors often use in their assessments like P/E and P/B are overemphasized by amateur value investors, who can get taken to the cleaners when their analyses are insufficient. Value investing requires deep analysis and confidence in one\'s own quantitative abilities.'
  },
  {
    title: 'Momentum Stocks',
    description: '"Momentum stocks" are stocks that have been rising lately. Usually, the best way to decide if a stock has been rising lately is to compare its current price to its 50-day (or 200-day) moving average.

    Some types of investors focus on buying up momentum stocks, thinking that a stock which has been going up lately is probably going to continue its upward trajectory.',
    advantages: 'It is often true that market sentiment swings up or down and stays in that direction for months at a time. Traders conscious of such swings with sharp analytical ability can make a handy profit through momentum plays.',
    warnings: 'As quickly as stocks can move up, they can just as quickly move down. In addition to knowing when to buy, momentum traders also need to have a clear strategy of when to sell. It is easy to get attached to a particular stock when it has gone up considerably and earned you a great profit; knowing when to take profits and sell is much more difficult than knowing when to make an initial purchase.'
  },
  {
    title: 'Volatile Stocks',
    description: 'Volatile stocks are stocks that undergo rapid changes in stock price due to a variety of factors, usually because the stock has a small market cap or there is great uncertainty about the short-term future of the stock.

    High-frequency traders often use algorithms on volatile stocks to profit off of fluctuations.',
    advantages: 'Volatile stocks can rise quickly under the right conditions. Even if a stock doesn\'t undergo a rise in price, certain trading techniques and algorithms can result in a profit for the astute trader.

    Martingales provide an an interesting approach to a certain class of volatile stocks with relatively stable futures, and can often result in a guaranteed profit. Of course, a high degree of caution (and market knowledge) is always necessary.',
    warnings: 'Volatile stocks can dip in a hurry. Just because a volatile stock has oscillated around a certain price point for a few weeks or months doesn\'t mean it won\'t undergo a substantial dip in stock price and oscillate around a lower number in the near future.'
  },
  {
    title: 'Small Cap Stocks',
    description: 'Small cap stocks, by our definition, are stocks whose market cap lies below $5B. Many companies fit into this category, such as firms that are new to the market and trying to expand their business, corporations that operate in high-profit markets but are in precarious straits due to tough competition, and successful companies that work in relatively low-profit markets.',
    advantages: 'Small cap stocks are famed for their high volatility. Skilled investors who know the market can make a high profit through small cap companies. Warren Buffett has even stated that he misses the times when he could invest in small cap stocks, as the sector is one of the easiest in which to make a profit. (Berkshire Hathaway operates with too much money, which affects the liquidity of small cap stocks.)',
    warnings: 'Small cap stocks are often much riskier than large cap stocks. It is not uncommon for small cap stocks to be unprofitable, have substantial debt, and even be on the verge of bankruptcy.'
  },
  {
    title: 'Tech Stocks',
    description: 'Tech companies are some of the most interesting, and some of the most dangerous, stocks on the market. Tech is a quickly changing field; those companies that adapt quickly will succeed, and those that are slow to change will quickly die off.

    Entire sectors of the tech market remain relatively difficult to analyze, with no past indicators of potential profit. As such, not just individual stocks, but entire sectors of the tech market are extremely overvalued or undervalued. This scenario provides an inviting landscape for the adventurous investor, but even Warren Buffett abstains from the tech market, saying it is beyond his comprehension.',
    advantages: 'Find a good tech stock in its infancy, and you might make 1,000% off a single trade. Netflix (NFLX) and Tesla (TSLA) are two examples of companies rising over 500% over a single year after a major change in expectations for the companies.',
    warnings: 'While there is a lot of volatility in tech stocks, it\'s a volatility qualitatively different from the volatility experienced in, say, the energy market. While the energy market oscillates due to supply and demand, the tech market\'s volatility is due to changing views on the profitability of certain sectors and companies. As such, it is a volatility that is much more difficult to play.'
  },
  {
    title: 'Energy Stocks',
    description: 'Energy stocks deal with the exploration and retrieval of oil, natural gas, and other fuel sources. Unlike many other sectors of the stock market, there is a great deal of variation in the size of public energy firms. Many small cap companies thrive, and those that perform particularly well can increase their stock price by thousands of percent.

    Unique among energy companies is the amount of financial leverage many small firms are operating under, as well as the fact that the success of a particular company may be determined more by worldwide energy prices than by good corporate strategy.',
    advantages: 'Many small-cap energy firms experience a great amount of volatility, which makes them very tempting to volatility traders. Energy companies, including those with high market caps, are often susceptible to violent swings in momentum one way or another, so that momentum traders also like to get in on the fun.',
    warnings: 'Many oil and natural gas companies, especially those associated with the recent fracking boom, are highly leveraged and risk bankruptcy is energy prices decline. Most oil wells in the U.S. have a profitability threshold of $60-$80/bbl, which means if oil falls below that point, many U.S. energy firms cannot turn a profit, even if they don\'t have any debt.

    Also notable is that in many parts of the world, like Saudi Arabia, oil can be extracted for as little as $10/bbl, so if the major international oil markets wish to gain market share by increasing (or even maintaining) production, the U.S. shale movement may come to a screeching halt.'
  },
  {
    title: 'Finance Stocks',
    description: 'Investing in finance companies is best left to the experts that understand how banks are run and who is best at running them. Financial companies rarely emerge as good value or momentum stocks without deep analysis, although they occasionally appear as decent volatility stocks. Although they are fun to watch, it\'s usually best to leave these companies to the experts.',
    advantages: 'Financial corporations thrive on talent. Those lacking great minds will fail miserably, and those with great leaders will profit at their expense. If you know which companies are winning the talent game, you can make a pretty reasonable estimate of the winners and losers.',
    warnings: 'Banks often have P/E\'s around 10 and P/B\'s around 1, making them seem like good values to novice investors. There is a mathematically good reason why this is so: banks have less room for profit expansion than general industrial companies, and their few profit-making measures are inherently risky and extremely competitive.'
  }
]

terms = [
  {
    name: 'P/E',
    definition: 'P/E stands for Price/Earnings, and is the market cap of the stock divided by annual earnings. It is intended to measure how expensive a stock is relative to the company\'s current annual earnings, and the kind of growth that investors are assuming.

    An accepted standard of the financial community is that, given a stable larger market, a company with no growth will have a P/E of 10. A company with positive growth will have a P/E of over 10, while a shrinking company will have a P/E of under 10.',
    example: 'In 2012, after the death of Steve Jobs, Apple (AAPL) was trading at an ex-cash P/E of ~5. This was despite the fact that the company\'s profits were increasing steadily, with solid plans to expand in China. While fearful investors were running in every direction, those with a basic understanding of P/E and market psychology were able to get in and make a substantial profit. Apple went on to rise over 100% over the next 2 years.'
  },
  {
    name: 'P/B',
    definition: 'P/B is short for Price/Book. Book means book value, which is defined as the estimated price of all cash and physical assets (minus debt) of a company if sold on the market today. In other words, if the company ceased operation today, its book value is what the stock would be worth.

    P/B is useful for investors because if a company\'s P/B is low, it means its book value is relatively high compared to the price of the stock. In this case, the company\'s stock is fairly safe, as even if the company ceases operation, the stock will maintain the worth of its book value. Looking for companies with a low P/B is a solid tenet of value investing, and is heavily emphasized by Warren Buffett.',
    example: 'In some cases, a companies P/B can go below 1, and its book value exceeds its market cap. These stocks can often be great plays, but there are some caveats. For instance, if a company is bleeding cash, then its book value is decreasing with time, and so the prudent investor must be cautious. Another reason for an extremely low P/B would be if Wall Street thinks the company risks going into bankruptcy for restructuring purposes. In bankruptcy, shareholder value is among the first assets to disappear, even before cash and physical assets. So regardless of a company\'s book value, investors can lose everything in a bankruptcy.

    At the time of this writing, the P/B of Rex Energy (REXX) is an incredibly low 0.2. Value investors might initially jump at a chance to invest in this stock, but there is a lot of risk. REXX is losing money fast with the sudden collapse of oil prices, so its book value is constantly decreasing. In addition, it is highly leveraged and very susceptible to bankruptcy. Finally, its book value may be overstated since much of REXX\'s physical assets is land whose value depends on the oil residing beneath it. It is the prudent investor\'s responsibility to take all of these factors into account when making an investment decision.'
  },
  {
    name: 'Volume',
    definition: 'Volume is the number of shares traded in a day. It is important because it\'s an indication of how popular or unpopular a stock is on a particular day. It is a great tool for those interested in making investments based on market psychology.',
    example: 'Often, volume and volatility are correlated rather strongly. When good or bad news emerges, more buyers or sellers appear on the market and drag the stock price up or down. Volatility traders therefore carefully consider stocks that are recently experiencing high daily volume.'
  },
  {
    name: 'Market Cap',
    definition: 'A stock\'s market cap is how much the total number of shares on the market are worth. It may be calculated by multiplying a stock\'s price by the number of outstanding shares.

    When making value calls, the market cap is the first statistics an investor should look at. The market cap for mature companies should approximately equal the projected profit over the next 10 years for that company. If the market cap is substantially above (resp. below) that figure, then the stock is likely overvalued (resp. undervalued).

    (In practice, the above explanation is a slight oversimplification. Especially with high-growth companies, the market cap actually represents 10x the profit expected for the company in 10 years.)',
    example: 'At the time of this writing (2015), Amazon has consistently maintained a market cap between $100 and $150 billion. To be worth this valuation, Amazon should be making a $10-$15 billion profit annually by 2025. In the last quarter, Amazon actually suffered a loss of $200 million. So at first, it might seem that Amazon isn\'t worth its market cap.

    But Amazon is famous for investing its revenue back into the company, in order to make even more outstanding profits in the future. In fact, Amazon has sales (i.e. revenue) of over $80 billion annually. So it is probably not entirely unreasonable to expect that Amazon will be able to turn a $10-15B annual profit by 2025.

    There are many things that investors must consider when investing. A single statistic, whether P/E or P/B or P/S, won\'t tell the whole story. The first step an investor must take is to consider a company\'s market cap and determine (through a variety of analytical means) whether or not the company can make 1/10 of that in profits in 10 years.'
  },
  {
    name: '50-Day Moving Average',
    definition: 'The 50-Day Moving Average of a particular stock measures the average price of the stock over the previous 50 days. It is a metric often employed to determine the momentum of a stock, and in particular whether it is in an uptrend or downtrend.',
    example: 'Momentum traders and value investors are conflicted in their usage of the 50-day Moving Average.

    On the one hand, momentum traders see an upswing in stock price as an indication that sentiment is positive and the stock is clear to move further upward.

    On the other hand, value investors similarly interpret an upswing in stock price as an increase in positive sentiment, but realize that this sentiment can be artificial and temporary. As such, value investors actually occasionally look for stocks trading below their 50-day Moving Average, since stocks with temporary negative sentiment may take quick strides upward.'
  },
  {
    name: 'Profit Margin',
    definition: 'A company\'s profit margin is defined as the percentage of its revenue it retains as profit. Product costs, operating expenses and employee compensation, taxes, and a variety of other factors must be subtracted from revenue to find total profit.

    When doing stock analysis, it\'s important to factor in any potential increases or decreases to a company\'s profit margin. A mere 1% decrease in total profit margin in the airline industry could force a company into bankruptcy.',
    example: 'Profit margin varies largely by industry. Tech companies are famous for having high profit margins, while the transportation sector suffers from razor-thin margins.

    Operating margin is closely related to the concepts of "pricing power" and "market competition". The more competition within an industry, the less the operating margin of its companies will be. The reason FedEx (FDX) and UPS (UPS) have such tiny margins (~5%) is because they are constantly competing with each other. On the other hand, Apple (AAPL) occupies a unique position in the high-end tech market and therefore has impressive gross margins (~40%). '
  },
  {
    name: 'P/S',
    definition: 'An abbreviation for Price over Sales (i.e., Price over Revenue). Although not directly useful for determining what a stock\'s market cap should be, it has an indirect function. By looking at a stock\'s P/S and making deductions about future profit margin (via pricing power, etc.) and expansion of sales, one can reasonably estimate an appropriate P/E for the company at hand.',
    example: 'At the time of this writing, Facebook (FB) had a P/E of 70. However, its P/S is just 20. (This implies that Facebook has a total profit margin of 20/70, or a little under 30%.)

    These two statistics can help us evaluate FB from a value perspective. If FB needs to get to a P/E of 10 in 10 years, this means either its P/S needs to go down (via increased sales) and/or its profit margin needs to go up. In particular, if FB\'s P/S is even 20, then even if FB\'s profit margin were to increase to 100%, then its P/S would have to decrease to 10, i.e. its sales would have to double.

    This is quite an assumption. Under these conditions, it would be very difficult to view FB as a value stock, and many value investors would even recommend a short sell.'
  }
]

tickers.each do |ticker|
  data = open("http://download.finance.yahoo.com/d/quotes.csv?s=" + ticker[:symbol] + "&f=l1,c,j1,r,r5,p6,v,a2,m3,m4,j,k,y").read
  data_array = data.split(",")
  ticker[:price] = data_array[0].to_f.round(1)
  ticker[:daily_change] = data_array[2].split(" - ")[1].to_f.round(1)
  ticker[:daily_change_abs] = ticker[:daily_change].abs
  cap_buffer = data_array[4]
  if cap_buffer.include?("M")
    ticker[:market_cap_num] = cap_buffer.gsub("m","").to_f*1000000
    ticker[:market_cap] = (ticker[:market_cap_num].to_f/1000000).round(0).to_s + "M"
  elsif cap_buffer.include?("B")
    ticker[:market_cap_num] = cap_buffer.gsub("b","").to_f*1000000000
    ticker[:market_cap] = (ticker[:market_cap_num].to_f/1000000000).round(1).to_s + "B"
  end
  ticker[:pe] = data_array[6].to_f.round(1) if data_array[6].to_i != 0
  ticker[:peb] = data_array[10].to_f.round(1)
  if ticker[:pe] != nil
    ticker[:pe_peb_avg] = ticker[:pe]*ticker[:peb]
  end
  ticker[:volume] = (data_array[12].to_f/1000000).round(1)
  ticker[:volume_avg] = (data_array[14].to_f/1000000).round(1)
  ticker[:volume_cmp] = ticker[:volume]/ticker[:volume_avg]
  ticker[:mov_avg_50] = data_array[16].to_f.round(1)
  ticker[:mov_avg_50_cmp] = (((ticker[:price]/ticker[:mov_avg_50]) - 1)*100).round(1)
  ticker[:mov_avg_200] = data_array[18].to_f
  ticker[:low_52] = data_array[20].to_f.round(1)
  ticker[:high_52] = data_array[22].to_f.round(1)
  ticker[:daily_annual_change_avg] = ((ticker[:high_52]-ticker[:low_52]).abs)/ticker[:low_52]*ticker[:beta]
end

tickers.each do |ticker|
  if !Ticker.exists?(symbol: ticker[:symbol])
    Ticker.create(symbol: ticker[:symbol], name: ticker[:name], sector: ticker[:sector], price: ticker[:price], daily_change: ticker[:daily_change], daily_change_abs: ticker[:daily_change_abs], market_cap: ticker[:market_cap], market_cap_num: ticker[:market_cap_num], pe: ticker[:pe], peb: ticker[:peb], volume: ticker[:volume], volume_avg: ticker[:volume_avg], volume_cmp: ticker[:volume_cmp], pe_peb_avg: ticker[:pe_peb_avg], mov_avg_50: ticker[:mov_avg_50], mov_avg_50_cmp: ticker[:mov_avg_50_cmp], mov_avg_200: ticker[:mov_avg_200], beta: ticker[:beta], daily_annual_change_avg: ticker[:daily_annual_change_avg], low_52: ticker[:low_52], high_52: ticker[:high_52])
  else
    ticker_buffer = Ticker.find_by(symbol: ticker[:symbol])
    ticker_buffer.update(name: ticker[:name], sector: ticker[:sector], price: ticker[:price], daily_change: ticker[:daily_change], daily_change_abs: ticker[:daily_change_abs], market_cap: ticker[:market_cap], market_cap_num: ticker[:market_cap_num], pe: ticker[:pe], peb: ticker[:peb], volume: ticker[:volume], volume_avg: ticker[:volume_avg], volume_cmp: ticker[:volume_cmp], pe_peb_avg: ticker[:pe_peb_avg], mov_avg_50: ticker[:mov_avg_50], mov_avg_50_cmp: ticker[:mov_avg_50_cmp], mov_avg_200: ticker[:mov_avg_200], beta: ticker[:beta], daily_annual_change_avg: ticker[:daily_annual_change_avg], low_52: ticker[:low_52], high_52: ticker[:high_52])
  end
end

pages.each do |page|
  if !Page.exists?(title: page[:title])
    Page.create(title: page[:title], description: page[:description], advantages: page[:advantages], warnings: page[:warnings])
  else
    page_buffer = Page.find_by(title: page[:title])
    page_buffer.update(description: page[:description], advantages: page[:advantages], warnings: page[:warnings])
  end
end

terms.each do |term|
  if !Term.exists?(name: term[:name])
    Term.create(name: term[:name], definition: term[:definition], example: term[:example])
  else
    term_buffer = Term.find_by(name: term[:name])
    term_buffer.update(definition: term[:definition], example: term[:example])
  end
end
