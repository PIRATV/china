class PortfoliosController < ApplicationController
  before_action :set_portfolio, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /portfolios
  # GET /portfolios.json
  def index
    @portfolios = current_user.portfolios.paginate(per_page: 30, page: params[:page])
  end

  # GET /portfolios/1
  # GET /portfolios/1.json
  def show
  end

  # GET /portfolios/new
  def new
    @portfolio = Portfolio.new
  end

  # GET /portfolios/1/edit
  def edit
  end

  # POST /portfolios
  # POST /portfolios.json
  def create
    @portfolio = Portfolio.new(portfolio_params)

    respond_to do |format|
      @portfolio.user_id = current_user.id
      if @portfolio.save
        format.html { redirect_to @portfolio, notice: t('Portfolio was successfully created') }
        format.json { render action: 'show', status: :created, location: @portfolio }
      else
        format.html { render action: 'new' }
        format.json { render json: @portfolio.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /portfolios/1
  # PATCH/PUT /portfolios/1.json
  def update
    respond_to do |format|
      @portfolio.user_id = current_user.id
      if @portfolio.update(portfolio_params)
        format.html { redirect_to @portfolio, notice: t('Portfolio was successfully updated') }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @portfolio.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /portfolios/1
  # DELETE /portfolios/1.json
  def destroy
    @portfolio.destroy
    respond_to do |format|
      format.html { redirect_to portfolios_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_portfolio
      @portfolio = Portfolio.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def portfolio_params
      params.require(:portfolio).permit(:image, :video, :title)
    end
end
