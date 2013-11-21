# coding: UTF-8

class MembersController < ApplicationController
  before_filter :authenticate_user!

  def index
    @members = Member.not_deleted
  end

  def show
    @member = Member.find(params[:id])
  end

  def new
    @member = Member.new
  end

  def create
    @member = Member.new(params[:member])
    
    begin
      @member.transaction do
        @member.save!
      end

      redirect_to :action => 'show', :id => @member.id

    rescue ActiveRecord::RecordInvalid => e
      render :new
    end
  end

  def edit
    @member = Member.find(params[:id])
  end

  def update
    @member = Member.find(params[:id])
    
    begin
      @member.transaction do
        @member.attributes = params[:member]
        @member.save!
      end

      redirect_to :action => 'show', :id => @member.id

    rescue ActiveRecord::RecordInvalid => e
      render :edit
    end
  end

  def destroy
    @member = Member.find(params[:id])
    
    @member.transaction do
      @member.destroy_logically!
    end
    
    redirect_to :action => 'index'
  end

end
