class MarqueesController < ApplicationController
  before_action :set_marquee, only: [:show, :edit, :update, :destroy]

  # GET /marquees
  # GET /marquees.json
  def index
    @marquees = Marquee.all
  end

  # GET /marquees/1
  # GET /marquees/1.json
  def show
  end

  # GET /marquees/new
  def new
    @marquee = Marquee.new
  end

  # GET /marquees/1/edit
  def edit
  end

  # POST /marquees
  # POST /marquees.json
  def create
    @marquee = Marquee.new(marquee_params)

    respond_to do |format|
      if @marquee.save
        format.html { redirect_to @marquee, notice: 'Marquee was successfully created.' }
        format.json { render :show, status: :created, location: @marquee }
      else
        format.html { render :new }
        format.json { render json: @marquee.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /marquees/1
  # PATCH/PUT /marquees/1.json
  def update
    respond_to do |format|
      if @marquee.update(marquee_params)
        format.html { redirect_to @marquee, notice: 'Marquee was successfully updated.' }
        format.json { render :show, status: :ok, location: @marquee }
      else
        format.html { render :edit }
        format.json { render json: @marquee.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /marquees/1
  # DELETE /marquees/1.json
  def destroy
    @marquee.destroy
    respond_to do |format|
      format.html { redirect_to marquees_url, notice: 'Marquee was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_marquee
      @marquee = Marquee.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def marquee_params
      params.require(:marquee).permit(:text, :text_color, :bg_color, :scroll_amount, :display_status)
    end
end
