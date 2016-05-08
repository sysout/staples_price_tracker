class AlertsController < ApplicationController
  before_action :set_alert, only: [:show, :edit, :update, :destroy]
  before_action :logged_in_user

  # GET /alerts
  # GET /alerts.json
  def index
    @title = "Price alerts"
    @alert = current_user.alerts.build
    @alert.build_product
    @alerts = current_user.alerts.all.order(updated_at: :desc)
  end

  # GET /alerts/1
  # GET /alerts/1.json
  def show
  end

  # GET /alerts/new
  def new
    @alert = Alert.new
  end

  # GET /alerts/1/edit
  def edit
  end

  # POST /alerts
  # POST /alerts.json
  def create
    @alert = Alert.new(alert_params)
    @alert.user=current_user
    @alerts = current_user.alerts.all
    update_flag = false
    p=Product.find_by_staples_pid(@alert.product.staples_pid)
    if p and Alert.where(user: current_user, product: p).first
      @alert = Alert.where(user: current_user, product: p).first
      update_flag = true
    end
    respond_to do |format|
      # if (update_flag and @alert.update(alert_params)) || (!update_flag and @alert.save)
      if @alert.update(alert_params)
        format.html { redirect_to alerts_path, notice: "Alert was successfully #{update_flag ? 'updated':'created.'}" }
        format.json { render :show, status: :created, location: @alert }
      else
        format.html { render :index }
        format.json { render json: @alert.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /alerts/1
  # PATCH/PUT /alerts/1.json
  def update
    create
  end

  # DELETE /alerts/1
  # DELETE /alerts/1.json
  def destroy
    @alert.destroy
    respond_to do |format|
      format.html { redirect_to alerts_path, notice: 'Alert was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_alert
      @alert = Alert.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def alert_params
      params.require(:alert).permit(:desired, product_attributes: [:staples_pid])
    end
end
