class MessagesController < ApplicationController

  skip_before_action :verify_authenticity_token

  def new
    @contacts = current_user.contacts
    @source = Resource.all
  end

  def create
    @contact = Contact.find(params[:id])
    @source = Resource.find(params[:api_id])

    account_sid = ENV["TWILIO_SID"]
    auth_token = ENV["TWILIO_AUTH_TOKEN"]

    @client = Twilio::REST::Client.new account_sid, auth_token

    resp = Net::HTTP.get_response(URI.parse(@source.link))

    data = resp.body
    quote = JSON.parse(data)

    @qotd = quote[1][0][0]
    @author = quote[1][0][1]

    @text = eval(@source.access)


    @client.account.sms.messages.create({
      :from => "+1 985-605-0721",
      :to => @contact.number,
      :body => @text,
    })

  end
end
