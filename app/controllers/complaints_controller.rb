class ComplaintsController < ApplicationController
  # GET /complaints
  # GET /complaints.json
  def index
    @admin = Admin.all
    @complaints = Complaint.paginate(:per_page => 15,
        :page => params[:page],
        :order => 'created_at DESC')


   respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @complaints }
    end
  end

  # GET /complaints/1
  # GET /complaints/1.json
  def show
  begin
    @complaint = Complaint.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    logger.error "Attempt to access invalid action #{params[:id]}"
    flash[:notice] = "Invalid action"
    redirect_to profile_path(current_user.profile_name)
  else
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @complaint }
    end
  end
end

  # GET /complaints/new
  # GET /complaints/new.json
  def new
    @complaint = Complaint.new


    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @complaint }
    end
  end

  # GET /complaints/1/edit
  def edit
    @complaint = Complaint.find(params[:id])
  end

  # POST /complaints
  # POST /complaints.json
  def create
    @user = User.all
    @complaint = Complaint.new(params[:complaint])

    respond_to do |format|
      if @complaint.save
        ComplaintNotifier.received(@complaint).deliver
        format.html { redirect_to profile_path(current_user.profile_name), notice: 'Your complaint has been registered.' }
        format.json { render json: @complaint, status: :created, location: @complaint }
      else
        format.html { render action: "new" }
        format.json { render json: @complaint.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /complaints/1
  # PUT /complaints/1.json
  def update
    @complaint = Complaint.find(params[:id])

    respond_to do |format|
      if @complaint.update_attributes(params[:complaint])
        format.html { redirect_to @complaint, notice: 'Complaint was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @complaint.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /complaints/1
  # DELETE /complaints/1.json
  def destroy
    @complaint = Complaint.find(params[:id])
    @complaint.destroy

    respond_to do |format|
      format.html { redirect_to complaints_url }
      format.json { head :no_content }
    end
  end
end
