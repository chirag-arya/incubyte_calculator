class CalculatorsController < ApplicationController
  def index
  end

  def calculate
    input = params[:numbers]

    respond_to do |format|
      begin
        @result = StringCalculator.add(input)
        @error = nil
      rescue ArgumentError => e
        @result = nil
        @error = e.message
      end

      format.turbo_stream
      format.html { render :index }
    end
  end
end
