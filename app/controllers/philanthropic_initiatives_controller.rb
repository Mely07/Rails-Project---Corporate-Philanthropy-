class PhilanthropicInitiativesController < ApplicationController
    before_action :set_philanthropic_initiative

    def index
        @philanthropic_initiatives= PhilanthropicInitiative.all
    end
        
    def new 
        @philanthropic_initiative = PhilanthropicInitiative.new(business_id: params[:business_id])
    end
    
    def create 
        @philanthropic_initiative = PhilanthropicInitiative.create(philanthropic_initiative_params)
        redirect_to philanthropic_initiatives_path
    end

    def show 
    end

    def edit 
    end

    def update 
        @philanthropic_initiative.update(philanthropic_initiative_params)
        redirect_to philanthropic_initiative_path(@philanthropic_initiative)
    end

    private
    def philanthropic_initiative_params
        params.require(:philanthropic_initiative).permit(:name, :pledged_amount, :goal, :business_id, beneficiary_attributes: [:recipient, :city, :state])
    end

    def set_philanthropic_initiative
        @philanthropic_initiative = PhilanthropicInitiative.find_by(id: params[:id]) 
    end
end


