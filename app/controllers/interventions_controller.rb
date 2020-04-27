class InterventionsController < ApplicationController
  
  before_action :set_intervention, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /interventions
  # GET /interventions.json
  def index
    @interventions = Intervention.all
  end

  # GET /interventions/1
  # GET /interventions/1.json
  def show
  end

  # GET /interventions/new
  def new
    @intervention = Intervention.new
  end

  # GET /interventions/1/edit
  def edit
  end

  # POST /interventions
  # POST /interventions.json

  def create
    @intervention = Intervention.new(intervention_params)
    @intervention.intervention_result = "incomplete"
    @intervention.intervention_status = "pending"
    @currentusername = current_user.full_name
	  @currentuserid = current_user.id
    @intervention.employee_id = @currentuserid
    @intervention.intervention_start_date = time.now
     respond_to do |format|
       if verify_recaptcha(model: @intervention) && @intervention.save
         format.html { redirect_to @intervention, notice: 'Intervention was successfully created.' }
         client = ZendeskAPI::Client.new do |config|
                 config.url = ENV['ZENDESK_URL']
                   config.username = ENV['ZENDESK_USERNAME']
                   config.token = ENV['ZENDESK_TOKEN']
               end
               client = ZendeskAPI::Client.new do |config|
                config.url = 'https://rocketalexis.zendesk.com/api/v2'
                        config.username = ENV['ZENDESK_USERNAME']
                        config.token = ENV['ZENDESK_TOKEN']
                    end
                 ZendeskAPI::Ticket.create!(client,
                    :subject => "**NEW INTERVENTION** created by : " + @currentusername.to_s ,
                    :comment => "The customer ID :  #{params['intervention'][:customer_id]} 
                    Building ID :  #{params['intervention'][:building_id]} 
                    Battery ID :  #{params['intervention'][:battery_id]} 
                    Column ID :  #{params['intervention'][:column_id]} 
                    Elevator ID :  #{params['intervention'][:elevator_id]} 
                    Affected employee ID :  #{params['intervention'][:employee_id]} 
                    Description :  #{params['intervention'][:intervention_report]} ",
                    :priority => "urgent",
                    :type => "question")
                  else
                    flash.now[:error] = "fail no intervention has been sent"
                    flash.now[:recaptcha_error]
                    format.html { render :new }
                  end
                end
              end
              
  


  # PATCH/PUT /interventions/1
  # PATCH/PUT /interventions/1.json
  def update
    respond_to do |format|
      if @intervention.update(intervention_params)
        format.html { redirect_to @intervention, notice: 'Intervention was successfully updated.' }
        format.json { render :show, status: :ok, location: @intervention }
      else
        format.html { render :edit }
        format.json { render json: @intervention.errors, status: :unprocessable_entity }
      end
    end
  end


   ########################## BUILDING ################ REF from : CUSTOMER ######################
   def building_select
    p params["customer_id"]
      @buildings = Building.where(customer_id: params["customer_id"])
      respond_to do |format |
         format.json {
             render json: {
                 buildings: @buildings
             }
         }
      end
  end
########################## BATTERY ################## REF from : BUILDING ######################
  def battery_select
    p params["building_id"]
      @batteries = Battery.where(building_id: params["building_id"])
      respond_to do |format |
        format.json {
            render json: {
                batteries: @batteries
            }
        }
      end
  end
########################## COLUMN ################### REF from : BATTERY ######################
  def column_select
    p params["battery_id"]
    @columns = Column.where(battery_id: params["battery_id"])
    respond_to do |format |
       format.json {
           render json: {
               columns: @columns
           }
       }
    end
  end
########################## ELEVATOR ################### REF from : COLUMN ######################
  def elevator_select
    p params["column_id"]
    @elevators = Elevator.where(column_id: params["column_id"])
    respond_to do |format |
       format.json {
           render json: {
               elevators: @elevators
           }
       }
    end
  end


 private
    # Use callbacks to share common setup or constraints between actions.
    def set_intervention
      @intervention = Intervention.find(params[:id])
    end

    
    def intervention_params
        params.fetch(:intervention, {}).permit(:customer_id, :building_id, :battery_id, :column_id, :elevator_id, :employee_id, :intervention_report)
    end
  end