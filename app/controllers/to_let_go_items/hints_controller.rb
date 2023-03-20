class ToLetGoItems::HintsController < ApplicationController
  def show
    @ways =
      if params[:category_id] && params[:reason_id]
        LettingGoWay.optimal(params[:category_id], params[:reason_id])
      elsif params[:category_id]
        LettingGoWay.category_optimal(params[:category_id])
      else
        LettingGoWay.reason_optimal(params[:reason_id])
      end
    respond_to do |format|
      format.turbo_stream
    end
  end
end
