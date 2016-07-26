class ContactsController < ApplicationController

  def index
    @contacts = Contact.all
  end

  def new
  end

  def create
    coordinates = Geocoder.coordinates(params[:address])
    @contact = Contact.new(
    first_name: params[:first_name],
    last_name:  params[:last_name],
    phone_number: params[:phone_number],
    email: params[:email],
    bio: params[:bio],
    latitude: coordinates[0],
    longitude: coordinates[1]
    )
    @contact.save
    render 'new.html.erb'
  end

  def show
    @contact = Contact.find_by(id: params[:id])
  end
end
