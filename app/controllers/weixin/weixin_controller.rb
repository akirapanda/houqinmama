class Weixin::WeixinController < ApplicationController
	skip_before_filter :verify_authenticity_token
	before_filter :check_weixin_legality
	def show
		render :text=> params[:echostr]
	end
	
	def index
		render :text=> params[:echostr]
	end
	
	def create
    msg_type = params[:xml][:MsgType]
		
		case msg_type
		when 'text'
		  @content = "Hello World"
		  render "echo",:format=>:xml
		else
		  puts 'else'
		end  
		
	end
	
	def check_weixin_legality
		array =["testtoken",params[:timestamp],params[:nonce]].sort
		render :text => "Forbidden",:status => 403 if params[:signature]!=Digest::SHA1.hexdigest(array.join)
	end
end