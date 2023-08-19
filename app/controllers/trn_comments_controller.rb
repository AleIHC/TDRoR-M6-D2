class TrnCommentsController < ApplicationController
  before_action :set_trn_comment, only: %i[ show edit update destroy ]
  before_action only: [:new, :create] do
    authorize_request(["trn_normal_user", "trn_admin"])
  end
  before_action only: [:destroy] do
    authorize_request(["trn_admin"])
  end

  # GET /trn_comments or /trn_comments.json
  def index
    @trn_new = TrnNew.find(params[:trn_new_id])
    @trn_comments = TrnComment.all
  end

  # GET /trn_comments/1 or /trn_comments/1.json
  def show
    @trn_new = TrnNew.find(params[:trn_new_id])
    @trn_comment = @trn_new.trn_comments.find(params[:id])
  end

  # GET /trn_comments/new
  def new
    @trn_new = TrnNew.find(params[:trn_new_id])
    @trn_comment = TrnComment.new

  end

  # GET /trn_comments/1/edit
  def edit
  end

  # POST /trn_comments or /trn_comments.json
  def create
    @trn_new = TrnNew.find(params[:trn_new_id])
    @trn_comment = @trn_new.trn_comments.build(trn_comment_params)
    @trn_comment.trn_user = current_trn_user

    respond_to do |format|
      if @trn_comment.save
        format.html { redirect_to trn_new_path(@trn_new), notice: "CSomment was successfully created." }
        format.json { render :show, status: :created, location: @trn_comment }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @trn_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /trn_comments/1 or /trn_comments/1.json
  def update
    respond_to do |format|
      if @trn_comment.update(trn_comment_params)
        format.html { redirect_to trn_comment_url(@trn_comment), notice: "Comment was successfully updated." }
        format.json { render :show, status: :ok, location: @trn_comment }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @trn_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /trn_comments/1 or /trn_comments/1.json
  def destroy
    @trn_new = TrnNew.find(params[:trn_new_id])
    @trn_comment = @trn_new.trn_comments.find(params[:id])
    @trn_comment.destroy

    respond_to do |format|
      format.html { redirect_to trn_new_path(@trn_new), notice: "Comment was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_trn_comment
      @trn_comment = TrnComment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def trn_comment_params
      params.require(:trn_comment).permit(:content, :trn_user_id, :trn_new_id)
    end
end
