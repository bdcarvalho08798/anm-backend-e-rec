class NatdirectoratesController < ApplicationController
  before_action :set_natdirectorate, only: %i[ show edit update destroy ]

  load_and_authorize_resource
  # GET /natdirectorates or /natdirectorates.json
  def index
    @natdirectorates = Natdirectorate.all
  end

  # GET /natdirectorates/1 or /natdirectorates/1.json
  def show
  end

  # GET /natdirectorates/new
  def new
    @natdirectorate = Natdirectorate.new
  end

  # GET /natdirectorates/1/edit
  def edit
  end

  # POST /natdirectorates or /natdirectorates.json
  def create
    @natdirectorate = Natdirectorate.new(natdirectorate_params)

    respond_to do |format|
      if @natdirectorate.save
        format.html { redirect_to natdirectorate_url(@natdirectorate), notice: "Natdirectorate was successfully created." }
        format.json { render :show, status: :created, location: @natdirectorate }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @natdirectorate.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /natdirectorates/1 or /natdirectorates/1.json
  def update
    respond_to do |format|
      if @natdirectorate.update(natdirectorate_params)
        format.html { redirect_to natdirectorate_url(@natdirectorate), notice: "Natdirectorate was successfully updated." }
        format.json { render :show, status: :ok, location: @natdirectorate }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @natdirectorate.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /natdirectorates/1 or /natdirectorates/1.json
  def destroy
    @natdirectorate.destroy!

    respond_to do |format|
      format.html { redirect_to natdirectorates_url, notice: "Natdirectorate was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_natdirectorate
      @natdirectorate = Natdirectorate.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def natdirectorate_params
      params.require(:natdirectorate).permit(:natdircode, :natdirname, :directorate_id)
    end
end
