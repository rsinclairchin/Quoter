class MessagesController < ApplicationController

  skip_before_action :verify_authenticity_token

  def new
    @contacts = current_user.contacts
    @source = Resource.all
  end

  def create
    @contact = Contact.find(params[:id])
    @source = Resource.find(params[:api_id])

    # account_sid = ENV["TWILIO_SID"]
    # auth_token = ENV["TWILIO_AUTH_TOKEN"]


    # p account_sid
    # p auth_token

    @client = Twilio::REST::Client.new account_sid, auth_token


    resp = Net::HTTP.get_response(URI.parse(@source.link))

    data = resp.body
    quote = JSON.parse(data)
    p "#"*90
    p "Quote: ", quote
    p "#"*90
    #@text = quote["contents"]["quotes"][0]["quote"]
    # p ""*90
    # p quote
    # p "#"*90
    #@qotd = quote['contents']
    # p "#"*90
    # p @qotd
    # p "#"*90
    # @author = quote[1][0][1]
    # p "#"*90
    @text = eval(@source.access)
    p @text
    # p "#"*90


    @client.account.sms.messages.create({
      :from => "+1 985-605-0721",
      :to => @contact.number,
      #:body => @source.access,
      #:body => @quote[:contents][:quotes][0][:quote]
      :body => @text
    })

  end
end
