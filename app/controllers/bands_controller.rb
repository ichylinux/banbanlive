# coding: UTF-8

class BandsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @bands = Band.not_deleted
  end

  def show
    @band = Band.find(params[:id])
  end

  def logo
    @band = Band.find(params[:id])
    if @band.band_logo
      send_file @band.band_logo.file.thumb.path, :type => @band.band_logo.content_type
    else
      render :nothing => true
    end
  end

  def new
    @band = Band.new
    @band.band_logo ||= BandLogo.new
  end

  def new_band_member
    bm = BandMember.new
    render :partial => 'band_member_fields', :locals => {:band_member => bm, :index => params[:index]}
  end

  def search_members
    @condition = MemberCondition.new
    @members = Member.search(@condition)
  end

  def create
    @band = Band.new(params[:band])
    
    begin
      @band.transaction do
        @band.save!
      end

      redirect_to :action => 'show', :id => @band.id

    rescue ActiveRecord::RecordInvalid => e
      render :new
    end
  end

  def edit
    @band = Band.find(params[:id])
    @band.band_logo ||= @band.build_band_logo
  end

  def update
    @band = Band.find(params[:id])
    
    begin
      @band.transaction do
        @band.attributes = params[:band]
        @band.save!
      end

      redirect_to :action => 'show', :id => @band.id

    rescue ActiveRecord::RecordInvalid => e
      render :edit
    end
  end

  def destroy
    @band = Band.find(params[:id])
    
    @band.transaction do
      @band.destroy_logically!
    end
    
    redirect_to :action => 'index'
  end

end
