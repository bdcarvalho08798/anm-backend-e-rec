class DirectoratesController < ApplicationController
  before_action :set_directorate, only: %i[ show edit update destroy ]
  load_and_authorize_resource
  # GET /directorates or /directorates.json
  def index
    @directorates = Directorate.all
  end

  # GET /directorates/1 or /directorates/1.json
  def show
  end

  # GET /directorates/new
  def new
    @directorate = Directorate.new
  end

  # GET /directorates/1/edit
  def edit
  end

  # POST /directorates or /directorates.json
  def create
    @directorate = Directorate.new(directorate_params)

    respond_to do |format|
      if @directorate.save
        format.html { redirect_to directorate_url(@directorate), notice: "Directorate was successfully created." }
        format.json { render :show, status: :created, location: @directorate }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @directorate.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /directorates/1 or /directorates/1.json
  def update
    respond_to do |format|
      if @directorate.update(directorate_params)
        format.html { redirect_to directorate_url(@directorate), notice: "Directorate was successfully updated." }
        format.json { render :show, status: :ok, location: @directorate }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @directorate.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /directorates/1 or /directorates/1.json
  def destroy
    @directorate.destroy!

    respond_to do |format|
      format.html { redirect_to directorates_url, notice: "Directorate was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_directorate
      @directorate = Directorate.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def directorate_params
      params.require(:directorate).permit(:dircode, :dirname)
    end
end
