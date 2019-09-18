class ContactsController < ApplicationController

  def index  
    #if current_user
    @contacts = Contact.all

      # if params[:first_name]
      #   @contacts = Contact.where("first_name iLIKE ?", "%#{params[:first_name]}%")
      # elsif params[:last_name]
      #   @contacts = Contact.where("last_name iLIKE ?", "%#{params[:last_name]}%")
      # elsif params[:middle_name]
      #   @contacts = Contact.where("middle_name iLIKE ?", "%#{params[:middle_name]}%")
      # elsif params[:bio]
      #   @contacts = Contact.where("bio iLIKE ?", "%#{params[:bio]}%")
      # elsif params[:email]
      #   @contacts = Contact.where("email iLIKE ?", "%#{params[:email]}%")
      # elsif params[:phone_number]
      #   @contacts = Contact.where("phone_number iLIKE ?", "%#{params[:phone_number]}%") 
      # end
    render 'index.html.erb'
  end

  def new
    render 'new.html.erb'
  end

  def create
    @contact = Contact.new(
      first_name: params[:first_name],
      middle_name: params[:middle_name],
      last_name: params[:last_name],
      phone_number: params[:phone_number],
      email: params[:email],
      user_id: params[:user_id]
      )
    if @contact.save
      redirect_to "/contacts/#{@contact.id}"
    else
      render json: {errors: @contact.errors.full_messages}, status: 422
    end
  end

  def show
    @contact = Contact.find(params[:id])
    render 'show.html.erb'
  end

  def edit
    @contact = Contact.find(params[:id])
    render 'edit.html.erb'
  end

  def update
    @contact = Contact.find(params[:id])
    @contact.update(
      first_name: params[:first_name],
      middle_name: params[:middle_name],
      last_name: params[:last_name],
      phone_number: params[:phone_number],
      email: params[:email],
      user_id: params[:user_id]
        )
    redirect_to "/contacts/#{@contact.id}"
  end

  def destroy
    @contact = Contact.find(params[:id])
    @contact.destroy
    redirect_to "/contacts"
  end
end