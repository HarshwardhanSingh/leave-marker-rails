class CalendarsController < ApplicationController
  before_action :find_calendar, only: [:edit, :update]

  def index
    calendars = Calendar.where(admin_id: current_user.id).order(created_at: :asc)
    render :index, locals: { calendars: calendars}
  end

  def show
  end

  def new
    calendar = Calendar.new
    render :new, locals: { calendar: calendar}
  end

  def create
    calendar = Calendar.new(calendar_params)
    calendar.admin_id = current_user.id
    if calendar.save
      respond_to do |format|
        format.html { redirect_to calendars_path }
      end
    else
      render :new, locals: { calendar: calendar}
    end
  end

  def edit
    render :edit, locals: { calendar: @calendar}
  end

  def update
    if @calendar.update(calendar_params)
      respond_to do |format|
        format.html { redirect_to calendars_path }
      end
    end
  end

  private

  def calendar_params
    params.require(:calendar).permit(:name, :description)
  end

  def find_calendar
    @calendar = Calendar.find(params[:id])
  end

end
