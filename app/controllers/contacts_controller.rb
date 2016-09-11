class ContactsController < ApplicationController
  before_action :authenticate_user!

  def index
    @contacts = current_user.contacts
    group = Group.find_by(name: params[:group])
    @contacts = group.contacts.where(user_id: current_user.id)
  end

  def new
    @contact = Contact.new
  end

  def create
    coordinates = Geocoder.coordinates(params[:address])
    @contact = Contact.new(
    first_name: params[:first_name],
    last_name:  params[:last_name],
    phone_number: params[:phone_number],
    email: params[:email],
    bio: params[:bio],
    user_id: current_user.id,
    latitude: coordinates[0],
    longitude: coordinates[1]
    )
    if @contact.save
      redirect_to 'new.html.erb'
    else
      flash[:warning] = @contact.errors.full_messages
      render 'new.html.erb'
    end
  end

  def show
    contact = Contact.find_by(id: params[:id])
    current_user.contacts.include?(contact) ? @contact = contact : nil
  end
end
