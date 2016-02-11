class TidesController < ApplicationController
  def index
    @tides = Tide.all.order(updated_at: :desc)
  end

  def new
  end

  def create
    respond_to do |format|
      format.json do
        unless params[:text].blank?
          @tide = Tide.find_or_create_by(hex: params[:hex])
          if params[:text].length > @tide.body.length
            @tide.update(body: params[:text])
          end
          if @tide.errors.empty?
            render json: { status: 'tide updated' }
          else
            render json: { status: @tide.errors.full_messages.first }
          end
        end
      end
    end
  end
end
