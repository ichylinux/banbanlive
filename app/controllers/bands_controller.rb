# coding: UTF-8

class BandsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @bands = Band.not_deleted
  end

  def show
    @band = Band.find(params[:id])
  end

  def new
    @band = Band.new
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
