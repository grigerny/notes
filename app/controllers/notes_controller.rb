class NotesController < ApplicationController
  before_filter :authenticate_user!, :except => [:about]
  include RailsBookmarklet
  
  # GET /notes
  # GET /notes.json
  def index
    @q = current_user.notes.scoped.search(params[:q])
    @notes = @q.result(:distinct => true).paginate(:page => params[:page], :per_page => 5).order('created_at DESC')
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @notes }
    end
  end

  # GET /notes/1
  # GET /notes/1.json
  def show
    @note = Note.find(params[:id])
    @q = current_user.notes.scoped.search(params[:q])
    @notes = @q.result(:distinct => true).paginate(:page => params[:page], :per_page => 5).order('created_at DESC')  
    

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @note }
      end
  end

  # GET /notes/new
  # GET /notes/new.json
  def new
    @note = Note.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @note }
    end
  end

  # GET /notes/1/edit
  def edit
    @note = Note.find(params[:id])
  end

  # POST /notes
  # POST /notes.json
  def create
    @note = Note.new(params[:note])
    @note.user = current_user
    
     unless @note.link[/^https?:\/\//]
        @note.link = 'http://' + @note.link
      end

    respond_to do |format|
      if @note.save
        format.html { redirect_to root_url, notice: 'You added a note.' }
        format.json { render json: @note, status: :created, location: @note }
      else
        format.html { redirect_to root_url, notice: 'Hmm..I cannot process a blank link. Please try again .' }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /notes/1
  # PUT /notes/1.json
  def update
    @note = Note.find(params[:id])

    respond_to do |format|
      if @note.update_attributes(params[:note])
        format.html { redirect_to @note, notice: 'Your Note was successfully updated.' }
        format.json { respond_with_bip(@note) }
      else
        format.html { render action: "edit" }
        format.json { respond_with_bip(@note) }
      end
    end
  end

  # DELETE /notes/1
  # DELETE /notes/1.json
  def destroy
    @note = Note.find(params[:id])
    @note.destroy

    respond_to do |format|
      format.html { redirect_to @note, notice: 'You have deleted your note.' }
      format.json { head :no_content }
    end
  end


end