class ComentariosController < ApplicationController
  before_action :set_comentario, only: %i[ show edit update destroy ]

  # GET /comentarios or /comentarios.json
  def index
    @comentarios = Comentario.all.order(created_at: :desc)
  end

  # GET /comentarios/1 or /comentarios/1.json
  def show
  end

  # GET /comentarios/new
  def new
    @comentario = Comentario.new
  end

  # GET /comentarios/1/edit
  def edit
  end

  def create
    @post = Post.find(params[:post_id])
    @comentario = @post.comentarios.build(comentario_params)

    if current_user.present?
      @comentario.user = current_user
    else
      @comentario.user_id = User.first.id
    end

    respond_to do |format|
      if @comentario.save
        format.html { redirect_to post_path(@post), notice: "Comentario creado correctamente." }
        format.json { render :show, status: :created, location: @comentario }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end


  # PATCH/PUT /comentarios/1 or /comentarios/1.json
  def update
    respond_to do |format|
      if @comentario.update(comentario_params)
        format.html { redirect_to comentario_url(@comentario), notice: "Comentario creado correctamente." }
        format.json { render :show, status: :ok, location: @comentario }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @comentario.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comentarios/1 or /comentarios/1.json
  def destroy
    @comentario.destroy

    respond_to do |format|
      format.html { redirect_to comentarios_url, notice: "Comentario was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comentario
      @comentario = Comentario.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def comentario_params
      params.require(:comentario).permit(:comentario, :user_id, :post_id)
    end
end
