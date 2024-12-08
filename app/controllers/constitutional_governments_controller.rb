class ConstitutionalGovernmentsController < ApplicationController
  before_action :set_constitutional_government, only: %i[ show edit update destroy ]

  # GET /constitutional_governments or /constitutional_governments.json
  def index
    @constitutional_governments = ConstitutionalGovernment.all
  end

  # GET /constitutional_governments/1 or /constitutional_governments/1.json
  def show
  end

  # GET /constitutional_governments/new
  def new
    @constitutional_government = ConstitutionalGovernment.new
  end

  # GET /constitutional_governments/1/edit
  def edit
  end

  # POST /constitutional_governments or /constitutional_governments.json
  def create
    @constitutional_government = ConstitutionalGovernment.new(constitutional_government_params)

    respond_to do |format|
      if @constitutional_government.save
        format.html { redirect_to constitutional_government_url(@constitutional_government), notice: "Constitutional government was successfully created." }
        format.json { render :show, status: :created, location: @constitutional_government }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @constitutional_government.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /constitutional_governments/1 or /constitutional_governments/1.json
  def update
    respond_to do |format|
      if @constitutional_government.update(constitutional_government_params)
        format.html { redirect_to constitutional_government_url(@constitutional_government), notice: "Constitutional government was successfully updated." }
        format.json { render :show, status: :ok, location: @constitutional_government }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @constitutional_government.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /constitutional_governments/1 or /constitutional_governments/1.json
  def destroy
    @constitutional_government.destroy!

    respond_to do |format|
      format.html { redirect_to constitutional_governments_url, notice: "Constitutional government was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_constitutional_government
      @constitutional_government = ConstitutionalGovernment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def constitutional_government_params
      params.require(:constitutional_government).permit(:sequential_number, :constitutional_government_name)
    end
end
