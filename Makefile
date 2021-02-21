help:
	@fgrep -h "###" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/###//'

common:
	@sh components/common.sh

cart: common
cart: 			###	Install Cart Components
	@sh components/cart.sh

catalogue: common
catalogue: 		###	Install Catalogue Components
	@sh components/catalogue.sh

frontend: common
frontend: 		###	Install FrontEnd Components
	@sh components/frontend.sh

user: common
user:	 	###	Install User Components
	@sh components/user.sh

redis: common
redis:	 	###	Install Redis Components
	@sh components/redis.sh

mysqldb: common
mysqldb:	 	###	Install MySQL Database Components
	@sh components/mysqldb.sh

mongodb: common
mongodb:	 	###	Install MongoDB Database Components
	@sh components/mongodb.sh

shipping: common
shipping:	 	###	Install MongoDB Database Components
	@sh components/shipping.sh

rabbitmq: common
rabbitmq:	 	###	Install MongoDB Database Components
	@sh components/rabbitmq.sh

payment: common
payment:	 	###	Install MongoDB Database Components
	@sh components/payment.sh