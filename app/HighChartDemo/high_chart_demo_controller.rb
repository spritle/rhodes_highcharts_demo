require 'rho/rhocontroller'
require 'helpers/browser_helper'

class HighChartDemoController < Rho::RhoController
  include BrowserHelper

  # GET /HighChartDemo
  def index
    @highchartdemos = HighChartDemo.find(:all)
    render :back => '/app'
  end

  # GET /HighChartDemo/{1}
  def show
    @highchartdemo = HighChartDemo.find(@params['id'])
    if @highchartdemo
      render :action => :show, :back => url_for(:action => :index)
    else
      redirect :action => :index
    end
  end

  # GET /HighChartDemo/new
  def new
    @highchartdemo = HighChartDemo.new
    render :action => :new, :back => url_for(:action => :index)
  end

  # GET /HighChartDemo/{1}/edit
  def edit
    @highchartdemo = HighChartDemo.find(@params['id'])
    if @highchartdemo
      render :action => :edit, :back => url_for(:action => :index)
    else
      redirect :action => :index
    end
  end

  # POST /HighChartDemo/create
  def create
    @highchartdemo = HighChartDemo.create(@params['highchartdemo'])
    redirect :action => :index
  end

  # POST /HighChartDemo/{1}/update
  def update
    @highchartdemo = HighChartDemo.find(@params['id'])
    @highchartdemo.update_attributes(@params['highchartdemo']) if @highchartdemo
    redirect :action => :index
  end

  # POST /HighChartDemo/{1}/delete
  def delete
    @highchartdemo = HighChartDemo.find(@params['id'])
    @highchartdemo.destroy if @highchartdemo
    redirect :action => :index  
  end
end
