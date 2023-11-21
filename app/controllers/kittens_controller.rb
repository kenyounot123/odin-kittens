class KittensController < ApplicationController

  def index
    @kittens = Kitten.all
  end

  def create
    @kitten = Kitten.new(kitten_params)
    if @kitten.save
      flash[:notice] = "New kitten created"
      redirect_to @kitten
    else
      render :new, status: :unprocessable_entity
    end 

  end

  def new
    @kitten = Kitten.new
  end

  def show
    @kitten = Kitten.find(params[:id])
  end

  def update
    @kitten = Kitten.find(params[:id])

    if @kitten.update(kitten_params)
      flash[:alert] = "You have successfully changed your kitten"
      redirect_to @kitten
    else
      render :edit, status: :unprocessable_entity
    end

  end

  def edit
    @kitten = Kitten.find(params[:id])
  end

  def destroy
    @kitten = Kitten.find(params[:id])
    @kitten.destroy
    redirect_to kittens_path, notice: 'Kitten successfully deleted'
  end

  def kitten_params
    params.require(:kitten).permit(:name, :age, :cuteness, :softness)
  end
end
