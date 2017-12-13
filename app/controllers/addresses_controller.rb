class AddressesController < ApplicationController
     before_action :set_address, only: [:show, :destroy, :edit, :update]
  
  def index
    @addresses = Address.all
  end

  def create
    @address = Address.create(address_params)
    if @address.save
      flash[:success] = "#{@address.name} added"
      redirect_to student_address_path(@address)
    else
      render :new
    end
  end

  def new
    @address = Address.new
  end

  def edit
    
  end

  def show

  end

  def update
    @address.update(student_params)
    if @address.save
      flash[:success] = "#{@address.name} updated"
      redirect_to student_address_path(@address)
    else
      render :edit
    end
  end

  def destroy
    @address.destroy

    flash[:success] = "#{@address.name} deleted"
    redirect_to students_path
  end


  private

  def set_address
    @address = Address.find(params[:id])
  end

  def student_params
    params.require(:address).permit(:description, :street, :state, :city, :zip_code, :student_id)
  end
end

