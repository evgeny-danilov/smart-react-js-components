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
    record.update(val: params[:setting][:date_input])

    new_val = Setting.find_by(name: 'date_input').val
    redirect_to [:datatime, :components], notice: "Date save: #{new_val}"
  end
end
