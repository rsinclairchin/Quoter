require 'twilio-ruby'

class MessagesController < ApplicationController

  skip_before_action :verify_authenticity_token

  def new
    @contacts = current_user.contacts
    @source = Resource.all
  end

  def create
    @contact = Contact.find(params[:id])
    @source = Resource.find(params[:api_id])

    account_sid = ""
    auth_token = ""

    @client = Twilio::REST::Client.new account_sid, auth_token

    @client.messages.create(
      from: '+4242752339',
      to: '+17072309768',
      body: 'ghliesfjbk'
      )

    redirect_to user_url(@user)

  end
end
