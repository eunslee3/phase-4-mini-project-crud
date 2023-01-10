class SpicesController < ApplicationController
    def index
        spices = Spice.all 
        render json: spices
    end

    def show
        spice = find_by
        render json: spice
    end

    def create
        spice = Spice.create(strong_params)
        render json: spice, status: :created
    end

    def update
        spice = find_by
        spice.update(strong_params)
        render json: spice
    end

    def destroy
        spice = find_by
        spice.destroy
    end
    

    private

    def strong_params
        params.permit(
            :title,
            :image,
            :description,
            :notes,
            :rating
        )
    end

    def find_by
        Spice.find(params[:id])
    end

    def not_found
        render json: { error: "Spice not found" }, status: :not_found
    end
end
