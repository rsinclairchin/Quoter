class ContactsController < ApplicationController

def index
  @contacts = Contact.all
end

def new
  @contact = Contact.new
end

def edit
  @contact = Contact.find(params[:id])
end

def create
  @contact = Contact.new(first_name: params[:name], number: params[:number])
end

def show
  @contact = Contact.find(params[:id])
end

def update
    @contact = Contact.find(params[:id])
    if @contact.update(contact_params)
      redirect_to contacts
    else
      render 'edit'
    end
end

def destroy
  @contact = Contact.find(params[:id]).destroy
  redirect_to contacts
end

end