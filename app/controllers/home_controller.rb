class HomeController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
  end

  def retrieve
    # validation need to put in service
    start_date = Date.parse(params[:start_date])
    end_date = Date.parse(params[:end_date])
    unless start_date < end_date
      return render json: { msg: I18n.t(:date_error) }, status: :unprocessable_entity
    end

    unless [start_date, end_date].all? { |date| date < Date.today }
      return render json: { msg: I18n.t(:date_error_future) }, status: :unprocessable_entity
    end

    if (start_date - end_date).to_i.abs >= NBP::API::Base::MAX_DAYS
      return render json: { msg: I18n.t(:date_error_distance) }, status: :unprocessable_entity
    end

    RangeDateRates.perform_async params[:currency], start_date, end_date
    render json: { msg: 'ok' }
  rescue ArgumentError
    return render json: { msg: I18n.t(:date_empty) }, status: :unprocessable_entity
  end
end
