class DogsController < ApplicationController

  def index
    @dogs = Dog.all
  end

  def new
    @dog = Dog.new
  end

  def create
    @dog = Dog.new(dog_params)
  end

  def show
    @dog = Dog.find(params[:id])
  end

  def edit
  end

  def update
  end

  private

  def dog_params
    params.require(:dog).permit(:name, :weight, :breed, :age)
  end
end
