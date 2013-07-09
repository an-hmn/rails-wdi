class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def sendtxt
    #raise params.inspect
    name = params["first"]
    body = params["body"]
    user = User.where(:name => name).first

    client = Twilio::REST::Client.new(ENV['TW_SID'], ENV['TW_TOK'])
    client.account.sms.messages.create(:from => '+17863759474',
                                       :to => user.phone,
                                       :body => body)
    redirect_to(root_path)
  end
end