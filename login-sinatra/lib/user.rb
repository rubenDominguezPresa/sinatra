class User
	attr_accessor :username, :password
	def initialize
		@username
		@password
	end
	def setUsername username
		(username!="" && username.lenght>0)? @username =username : false
	end
	def setPassowrd password
		(password!="" && password.lenght>5)? @password = password : false
	end
end