class SubsController < ApplicationController
  before_action :set_sub, only: [:show, :edit, :update, :destroy]
  before_action :ensure_logged_in, except: [:index, :show]
  before_action :require_moderator_access, only: [:edit, :update, :destroy]

  # GET /subs
  # GET /subs.json
  def index
    @subs = Sub.all
  end

  # GET /subs/1
  # GET /subs/1.json
  def show
  end

  # GET /subs/new
  def new
    @sub = Sub.new
  end

  # GET /subs/1/edit
  def edit
  end

  # POST /subs
  # POST /subs.json
  def create
    @sub = Sub.new(sub_params)
    @sub.moderators << current_user
    if @sub.save
      flash[:notice] = "Sub #{@sub.name} successfully created!"
      redirect_to @sub
    else
      flash[:errors] = @sub.errors.full_messages
      redirect_to new_sub_url
    end
  end

  # PATCH/PUT /subs/1
  # PATCH/PUT /subs/1.json
  def update
    if @sub.update(sub_params)
      flash[:notice] = "Sub #{@sub.name} successfully updated!"
      redirect_to @sub
    else
      flash[:errors] = @sub.errors.full_messages
      redirect_to @sub
    end
  end

  # DELETE /subs/1
  # DELETE /subs/1.json
  def destroy
    @sub.destroy
    redirect_to subs_url, notice: "Sub #{@sub.name} successfully deleted!"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sub
      @sub = Sub.includes(posts: [:votes]).find_by(id: params[:id])
    end

    # Only moderators can edit, update or destroy subs
    def require_moderator_access
      sub = Sub.find_by(id: params[:id])
      unless sub.moderators.include?(current_user)
        flash[:error] = "Only moderators can perform this action."
        redirect_to sub_url(sub)
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sub_params
      params.require(:sub).permit(:name, :description)
    end
end
