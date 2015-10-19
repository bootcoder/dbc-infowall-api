class TextScrollsController < ApplicationController
  before_action :set_text_scroll, only: [:show, :edit, :update, :destroy]

  # GET /text_scrolls
  # GET /text_scrolls.json
  def index
    @text_scrolls = TextScroll.all
  end

  # GET /text_scrolls/1
  # GET /text_scrolls/1.json
  def show
  end

  # GET /text_scrolls/new
  def new
    @text_scroll = TextScroll.new
  end

  # GET /text_scrolls/1/edit
  def edit
  end

  # POST /text_scrolls
  # POST /text_scrolls.json
  def create
    @text_scroll = TextScroll.new(text_scroll_params)

    respond_to do |format|
      if @text_scroll.save
        format.html { redirect_to @text_scroll, notice: 'Text scroll was successfully created.' }
        format.json { render :show, status: :created, location: @text_scroll }
      else
        format.html { render :new }
        format.json { render json: @text_scroll.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /text_scrolls/1
  # PATCH/PUT /text_scrolls/1.json
  def update
    respond_to do |format|
      if @text_scroll.update(text_scroll_params)
        format.html { redirect_to @text_scroll, notice: 'Text scroll was successfully updated.' }
        format.json { render :show, status: :ok, location: @text_scroll }
      else
        format.html { render :edit }
        format.json { render json: @text_scroll.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /text_scrolls/1
  # DELETE /text_scrolls/1.json
  def destroy
    @text_scroll.destroy
    respond_to do |format|
      format.html { redirect_to text_scrolls_url, notice: 'Text scroll was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_text_scroll
      @text_scroll = TextScroll.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def text_scroll_params
      params.require(:text_scroll).permit(:text, :text_color, :bg_color, :scroll_amount)
    end
end
