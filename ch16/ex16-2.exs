# 16.2 프로세스에 이름 짓기

c("ticker.ex")
# [Client, Ticker]
Node.connect :"two@light-boy"
# true
Ticker.start
# :yes
# tick
# tick
Client.start
# tick                    
# tock in client          
# tick                    
# tock in client          
# tick                    
# tock in client          
# tick                    
# tock in client


c("ticker.ex")
# [Client, Ticker]
Client.start
# {:register, #PID<0.130.0>}
# tock in client          
# tock in client          
# tock in client
