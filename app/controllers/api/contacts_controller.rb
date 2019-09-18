class Api::ContactsController < ApplicationController


  def index

    
    #if current_user

  @contacts = Contact.all

  if params[:first_name]
    @contacts = Contact.where("first_name iLIKE ?", "%#{params[:first_name]}%")
    elsif params[:last_name]
      @contacts = Contact.where("last_name iLIKE ?", "%#{params[:last_name]}%")
    elsif params[:middle_name]
      @contacts = Contact.where("middle_name iLIKE ?", "%#{params[:middle_name]}%")
    elsif params[:bio]
      @contacts = Contact.where("bio iLIKE ?", "%#{params[:bio]}%")
    elsif params[:email]
      @contacts = Contact.where("email iLIKE ?", "%#{params[:email]}%")
    elsif params[:phone_number]
      @contacts = Contact.where("phone_number iLIKE ?", "%#{params[:phone_number]}%") 
    end

    render 'index.json.jb'

    #else
     # render json: []
    #end

  end

  def show
    @contact = Contact.find_by(id: params[:id])
    render 'show.json.jb' 
  end

  def create

    coordinates = Geocoder.coordinates(params[:address])

    @contact = Contact.new(
      first_name: params[:first_name],
      middle_name: params[:middle_name],
      last_name: params[:last_name],
      bio: params[:bio],
      email: params[:email],
      phone_number: params[:phone_number],
      address: params[:address],
      latitude: coordinates[0],
      longitude: coordinates[1],
      user_id: current_user.id
      )
      

    if @contact.save
      render 'show.json.jb'
    else
      render json: {message: @contact.errors.full_messages}
    end
  end

  def update
    @contact = Contact.find_by(id: params[:id])

    @contact.first_name = params[:first_name] || @contact.first_name
    @contact.middle_name = params[:middle_name] || @contact.middle_name
    @contact.last_name = params[:last_name] || @contact.last_name
    @contact.bio = params[:bio] || @contact.bio
    @contact.email = params[:email] || @contact.email
    @contact.phone_number = params[:phone_number] || @contact.phone_number
    @contact.address = params[:address] || @contact.address

    if @contact.save
      render 'show.json.jb'
    else
      render json: {message: @contact.errors.full_messages}
    end
  end

  def destroy
    contact = Contact.find_by(id: params[:id])
    contact.destroy

    render json: {message: "Contact deleted!"}
  end





end