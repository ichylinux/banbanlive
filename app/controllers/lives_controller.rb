# coding: UTF-8

class LivesController < ApplicationController

  def index
    @lives = Live.not_deleted
  end

  def show
    @live = Live.find(params[:id])
  end

  def new
    @live = Live.new
  end

  def new_entry
    e = Entry.new
    render :partial => 'entry_fields', :locals => {:entry => e, :index => params[:index]}
  end

  def search_bands
    @condition = BandCondition.new
    @bands = Band.search(@condition)
    render :layout => false
  end

  def create
    @live = Live.new(params[:live])
    
    begin
      @live.transaction do
        @live.save!
      end

      redirect_to :action => 'show', :id => @live.id

    rescue ActiveRecord::RecordInvalid => e
      render :new
    end
  end

  def edit
    @live = Live.find(params[:id])
  end

  def update
    @live = Live.find(params[:id])
    
    begin
      @live.transaction do
        @live.attributes = params[:live]
        @live.save!
      end

      redirect_to :action => 'show', :id => @live.id

    rescue ActiveRecord::RecordInvalid => e
      render :edit
    end
  end

  def destroy
    @live = Live.find(params[:id])
    
    @live.transaction do
      @live.destroy_logically!
    end
    
    redirect_to :action => 'index'
  end

end
