class SpicesController < ApplicationController
    def index
        spices = Spice.all
        render json: spices, status: :ok
    end
    def create
        spice = Spice.create(request_params)
        render json: spice, status: :created

    end
    def update
        spice = find_spice
        spice.update(request_params)
        render json: spice
    end
    def destroy
        spice = find_spice
        spice.destroy
        head :no_content
        end

        private
        def request_params
            params.permit(:title, :image, :description, :notes, :rating)
        end

        def find_spice
            Spice.find(params[:id])
        end
end
