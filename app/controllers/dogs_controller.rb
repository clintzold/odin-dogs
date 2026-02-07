class DogsController < ApplicationController

  def index
    @dogs = Dog.all

    respond_to do |format|
      format.html
      format.json { render json: @dogs}
    end
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

    respond_to do |format|
      format.html
      format.json { render json: @dog}
    end
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

  def destroy
    @dog = Dog.find(params[:id])

    if @dog.destroy
      redirect_to dogs_path, notice: "@dog.name successfully deleted"
    else
      render :show, notice: "@dog.name could not be deleted"
    end
  end

  private

  def dog_params
    params.require(:dog).permit(:name, :weight, :breed, :age)
  end
end
