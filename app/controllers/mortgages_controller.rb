class MortgagesController < ApplicationController

  def index
    @mortgages = Mortgage.all
  end

  def show
    @mortgage = Mortgage.find_by_id(params[:id])

    if @mortgage
      @table = @mortgage.amortization_table
    end
  end

  def edit
  end

  def new
    @mortgage = Mortgage.new
  end

  def create
    @mortgage = Mortgage.new(params[:mortgage])

    if @mortgage.save
      flash[:success] = "Mortgage created successfully"
      redirect_to mortgage_url(@mortgage.id)
    else
      render 'new'
    end
  end

  def destroy
    if Mortgage.find_by_id(params[:id]).destroy
      flash[:success] = "Mortgage was successfully deleted"
    else
      flash[:error] = "There was an issue deleting mortgage"
    end
    redirect_to mortgages_path
  end
end
