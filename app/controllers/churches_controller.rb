class ChurchesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_church, only: [:show, :edit, :update, :destroy]

  # GET /churches
  # GET /churches.json
  def index
    @churches = Church.all
  end

  # GET /churches/1
  # GET /churches/1.json
  def show
  end

  # GET /churches/new
  def new
    @church = Church.new
  end

  # GET /churches/1/edit
  def edit
  end

  def stats
    @church = Church.find(params[:id])
    @members = 0
    @visitors = @church.visitors.where(created_at: Date.today.beginning_of_week(:sunday).beginning_of_day..Date.today.beginning_of_week(:sunday).end_of_day).size
    @church.members.each do |member|
      member.present.each do |date|
      if date == Date.today.beginning_of_week(:sunday).strftime('%Y%m%d').to_i
        @members += 1
      end
    end
    end
    @attendance = @members + @visitors
  end

  # POST /churches
  # POST /churches.json
  def create
    @group = Group.new(group_code:SecureRandom.hex(3).upcase)
    @group.save!
    @church = @group.churches.build(church_params)
    current_user.group_id = @group.id
    current_user.save!

    respond_to do |format|
      if @church.save
        format.html { redirect_to @church, notice: 'Church was successfully created.' }
        format.json { render :show, status: :created, location: @church }
      else
        format.html { render :new }
        format.json { render json: @church.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /churches/1
  # PATCH/PUT /churches/1.json
  def update
    respond_to do |format|
      if @church.update(church_params)
        format.html { redirect_to @church, notice: 'Church was successfully updated.' }
        format.json { render :show, status: :ok, location: @church }
      else
        format.html { render :edit }
        format.json { render json: @church.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /churches/1
  # DELETE /churches/1.json
  def destroy
    @church.destroy
    respond_to do |format|
      format.html { redirect_to churches_url, notice: 'Church was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_church
      @church = Church.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def church_params
      params.require(:church).permit(:name, :group_id)
    end
end
