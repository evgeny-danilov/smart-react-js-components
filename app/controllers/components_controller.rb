class ComponentsController < ApplicationController
  def index
  end

  def money
  end

  def datatime
    @data = Setting.find_or_create_by(name: 'date_input')
  end

  def datatime_save
    record = Setting.find_by(name: 'date_input')

    record.date = params[:setting][:date]
    record.time = params[:setting][:time]
    record.datetime = params[:setting][:datetime]

    record.save

    redirect_to [:datatime, :components],
      notice: "Date save: #{record.date};<br>Time save: #{record.time};<br>DateTime save: #{record.datetime}"
  end
end
