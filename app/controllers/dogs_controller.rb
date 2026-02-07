class DogsController < ApplicationController

  def index
    @dogs = Dog.all
  end

  def new
    @dog = Dog.new
  end

  def create
    @dog = Dog.new(dog_params)
    
    if @dog.save
      redirect_to dogs_path, notice: "#{@dog.name} successfully added!"
    else
      render :new, status: :unprocessable_content
    end
  end

  def show
    @dog = Dog.find(params[:id])
  end

  def edit
    @dog = Dog.find(params[:id])
  end

  def update
    @dog = Dog.find(params[:id])
    
    if @dog.update(dog_params)
      redirect_to dogs_path, notice: "#{@dog.name} was successfully updated!"
    else
      render :edit, status: :unprocessable_content
    end
  end

  private

  def dog_params
    params.require(:dog).permit(:name, :weight, :breed, :age)
  end
end
