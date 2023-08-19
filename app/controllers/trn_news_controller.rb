class TrnNewsController < ApplicationController
  before_action :set_trn_new, only: %i[ show edit update destroy ]
  before_action :authenticate_trn_user!, except: %i[ index show ]
  

  # GET /trn_news or /trn_news.json
  def index
    @trn_news = TrnNew.all
  end

  # GET /trn_news/1 or /trn_news/1.json
  def show
    @trn_new = TrnNew.find(params[:id])
    @trn_comments = @trn_new.trn_comments
  end

  # GET /trn_news/new
  def new
    @trn_new = TrnNew.new
  end

  # GET /trn_news/1/edit
  def edit
  end

  # POST /trn_news or /trn_news.json
  def create
    @trn_new = TrnNew.new(trn_new_params)

    respond_to do |format|
      if @trn_new.save
        format.html { redirect_to trn_new_url(@trn_new), notice: "Trn new was successfully created." }
        format.json { render :show, status: :created, location: @trn_new }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @trn_new.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /trn_news/1 or /trn_news/1.json
  def update
    respond_to do |format|
      if @trn_new.update(trn_new_params)
        format.html { redirect_to trn_new_url(@trn_new), notice: "Trn new was successfully updated." }
        format.json { render :show, status: :ok, location: @trn_new }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @trn_new.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /trn_news/1 or /trn_news/1.json
  def destroy
    @trn_new.destroy

    respond_to do |format|
      format.html { redirect_to trn_news_url, notice: "Trn new was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_trn_new
      @trn_new = TrnNew.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def trn_new_params
      params.require(:trn_new).permit(:image, :title, :description)
    end
end
