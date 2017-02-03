class TweetsController < ApplicationController

  before_action :set_tweet, only: [:show, :edit, :update]

  # GET /cursos
  # GET /cursos.json

  def index
    @tweets = Tweet.where(nil)

    respond_to do |format|
      format.html
    end
  end

  # GET /cursos/1
  # GET /cursos/1.json
  def show

  end

  # GET /cursos/new
  def new
    @tweet = current_usuario.tweets.build

  end

  # GET /cursos/1/edit
  def edit

  end

  # POST /cursos
  # POST /cursos.json
  def create

    @tweet = current_usuario.tweets.build(tweet_params)

    respond_to do |format|
      if @tweet.save

        format.html { redirect_to @tweet, notice: 'Tweet postado com sucesso.' }
        format.json { render :show, status: :created, location: @tweet }
      else
        format.html { render :new, alert: 'Erro ao postar tweet.' }
        format.json { render json: @tweet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cursos/1
  # PATCH/PUT /cursos/1.json
  def update
    respond_to do |format|

      if @tweet.update(tweet_params)

        format.html { redirect_to @tweet, notice: 'Tweet atualizado com sucesso.' }
        format.json { render :show, status: :ok, location: @tweet }
      else
        format.html { render :edit }
        format.json { render json: @tweet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cursos/1
  # DELETE /cursos/1.json
  def destroy
    @tweet.destroy
    respond_to do |format|
      format.html { redirect_to tweets_url, notice: 'tweet deletado com sucesso.' }
      format.json { head :no_content }
    end
  end



  private


  # Use callbacks to share common setup or constraints between actions.
  def set_tweet
    @tweet = Tweet.where(id: params[:id]).first
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def tweet_params
    params.require(:tweet).permit(:title, :content)
  end


end
