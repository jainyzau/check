class WorkRecordsController < ApplicationController
  before_action :set_work_record, only: [:show, :edit, :update, :destroy]
  before_action :set_user, only: [:index]

  def index
    @user = current_user
    if @user
      @work_records = WorkRecord.belongs_to_user(@user).order(:created_at)
    else
      @work_records = WorkRecord.all
    end
  end

  def new
    @work_record = WorkRecord.new
  end

  def edit

  end

  def show
    #@work_record = WorkRecord.find(work_record_params[:id])
  end

  def create
    @work_record = WorkRecord.new(work_record_params)

    respond_to do |format|
      if @work_record.save
        format.html { redirect_to @work_record.work.user, notice: 'Work record was successfully created.' }
        format.json { render :show, status: :created, location: @work_record }
        format.js { @user = @work_record.work.user }
      else
        format.html { redirect_to @work_record.work.user, notice: 'Work record is not created.' }
        format.json { render json: @work_record.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @work_record.update(work_record_params)
        format.html { redirect_to @work_record, notice: 'Work record was successfully updated.' }
        format.json { render :show, status: :ok, location: @work_record }
      else
        format.html { render :edit }
        format.json { render json: @work_record.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @work_record.destroy
    respond_to do |format|
      format.html { redirect_to work_records_url, notice: 'Work record was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  def set_work_record
    @work_record = WorkRecord.find(params[:id])
  end

  def set_user
    @user = User.find(params[:user_id]) if params[:user_id]

  end

  def work_record_params
    params.require(:work_record).permit(:work_id, :comment)
  end
end
