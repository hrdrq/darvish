class RecordsController < ApplicationController
	before_action :set_records, only: [:show, :edit, :update, :destroy]
	before_filter :authenticate_user!, :only => [ :new, :create, :edit, :update, :destroy]
  before_filter :only_allow_admin, :only => [ :new, :create, :edit, :update, :destroy]
  def index
  	
  end

  def new
    @record = Record.new
  end
  def create
    @record = Record.new(record_params)
    if @record.valid?
      @record.save
      flash.now[:notice] = "紀錄增加完成"
      redirect_to new_record_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @record.update(record_params)
      redirect_to records_path
    else
      render action: 'edit' 
    end
  end

  def destroy
    @record.destroy
    redirect_to records_path
  end


	def set_records
    @record = Record.find(params[:id])
  end
  def record_params
    params.require(:record).permit(:league,:type,:dt, :opp, :home,:start,:win,:cg,:sho,:sv,:svo,:ip,:ip_f,:hit,:run,:er,:hr,:hb,:bb,:ibb,:so,:np,:np_s,:era,:whip)
  end
  def only_allow_admin
    redirect_to root_path unless current_user.has_role? :admin
  end

end
