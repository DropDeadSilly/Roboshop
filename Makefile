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

mysql: common
mysql:	 	###	Install MySQL Database Components
	@sh components/mysql.sh

mongodb: common
mongodb:	 	###	Install MongoDB Database Components
	@sh components/mongodb.sh