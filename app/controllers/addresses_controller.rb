class AddressesController < ApplicationController
     before_action :set_address, only: [:show, :destroy, :edit, :update]
     before_action :set_student, only: [:create, :index, :create, :new]
  
  def index
    @addresses = @student.addresses
  end

  def create
    @address = @student.addresses.new(address_params)
    if @address.save
      flash[:success] = "#{@address.description} added"
      redirect_to student_addresses_path(@student, @address)
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
    @address.update(address_params)
    if @address.save
      flash[:success] = "#{@address.name} updated"
      redirect_to student_address_path(@address.student, @address)
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

  def set_student
    @student = Student.find(params[:student_id])
  end

  def address_params
    params.require(:address).permit(:description, :street, :state, :city, :zip_code, :student_id)
  end
end

