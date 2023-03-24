module ToLetGoItems
  class HintsController < ApplicationController
    def show
      @ways = LettingGoWay.optimal(category_id: params[:category_id], reason_id: params[:reason_id])
      respond_to do |format|
        format.turbo_stream
      end
    end
  end
end
