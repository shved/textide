class TidesController < ApplicationController
  def index
    @quote = Tide.kenko_quote
    @tides = Tide.all.order(updated_at: :desc)
  end

  def new
  end

  def create
    respond_to do |format|
      format.json do
        unless params[:text].blank?
          @tide = Tide.find_or_initialize_by(hex: params[:hex])
          if @tide.new_record?
            @tide.update(body: params[:text])
            render json: { status: :ok, message: :saved }
          else
            if params[:text].length > @tide.body.length
              @tide.update(body: params[:text])
              render json: { status: :ok, message: :updated }
            else
              render json: { status: :ok, message: :not_modified }
            end
          end
          render json: { status: :error, message: @tide.errors.full_messages.first }.to_json if @tide.errors.any?
        end
      end
    end
  end
end
