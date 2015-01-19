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

terms = [
  {
    name: 'P/E'
  },
  {
    name: 'P/B'
  },
  {
    name: 'PEG'
  },
  {
    name: 'Volume'
  },
  {
    name: 'Market Cap'
  },
  {
    name: 'Moving Average'
  },
  {
    name: 'Beta'
  },
  {
    name: '52 Week Range'
  },
  {
    name: 'Value Stock'
  },
  {
    name: 'Volatile Stock'
  },
  {
    name: 'Momentum Stock'
  },
]

pages = [
  {
    title: 'Active Stocks (by Volume)'
  },
  {
    title: 'Active Stocks (by Price Change)'
  },
  {
    title: 'Value Stocks'
  },
  {
    title: 'Momentum Stocks'
  },
  {
    title: 'Volatile Stocks'
  },
  {
    title: 'Small Cap Stocks'
  },
  {
    title: 'Tech Stocks'
  },
  {
    title: 'Energy Stocks'
  },
  {
    title: 'Finance Stocks'
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

#nasdaq_data = open("http://download.finance.yahoo.com/d/quotes.csv?s=%5E;IXIC&f=l1,c").read
#if !Ticker.exists?(symbol: '^IXIC')
  #Ticker.create(symbol: '^IXIC', name: 'NASDAQ')
#else
  #nasdaq = Ticker.find_by(symbol: '^IXIC')
  #nasdaq.update(name: 'NAME', price: nasdaq_data[0], daily_change: nasdaq_data[2].split(" - ")[1].to_f.round(1))
#end

#sp_data = open("http://download.finance.yahoo.com/d/quotes.csv?s=%5E;GSPC&f=l1,c").read
#if !Ticker.exists?(symbol: '^GSPC')
  #Ticker.create(symbol: '^GSPC', name: 'S&P 500')
#else
  #sp = Ticker.find_by(symbol: '^GSPC')
  #sp.update(name: 'NAME', price: sp_data[0], daily_change: sp_data[2].split(" - ")[1].to_f.round(1))
#end
