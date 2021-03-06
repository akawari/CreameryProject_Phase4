class EmployeesController < ApplicationController
  before_action :set_employee, only: [:show, :edit, :update, :destroy]
  has_scope :active
  has_scope :inactive
  has_scope :alphabetical
  has_scope :admins
  has_scope :managers
  has_scope :regulars
  has_scope :younger_than_18
  has_scope :is_18_or_older

  # GET /employees
  # GET /employees.json
  def index
    @employees = apply_scopes(Employee).alphabetical.paginate(:page => params[:page]).per_page(10)
    @employee_ids = @employees.map(&:id)
    @users = User.where(:employee_id => @employee_ids)
  end
  
  # GET /employees/1
  # GET /employees/1.json
  def show
  end

  # GET /employees/new
  def new
    @employee = Employee.new
    @employee.build_user
  end

  # GET /employees/1/edit
  def edit
  end

  # POST /employees
  # POST /employees.json
  def create
    @employee = Employee.new(employee_params)

    respond_to do |format|
      if @employee.save
        format.html { redirect_to @employee, notice: "Employee: #{@employee.name} was successfully created." }
        format.json { render :show, status: :created, location: @employee }
      else
        format.html { render :new }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /employees/1
  # PATCH/PUT /employees/1.json
  def update
    respond_to do |format|
      if @employee.update(employee_params)
        format.html { redirect_to @employee, notice: "Employee: #{@employee.name} was successfully updated." }
        format.json { render :show, status: :ok, location: @employee }
      else
        format.html { render :edit }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /employees/1
  # DELETE /employees/1.json
  def destroy
    @employee.destroy
    respond_to do |format|
      format.html { redirect_to employees_url, notice: "Employee: #{@employee.name} was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_employee
      @employee = Employee.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def employee_params
      params.require(:employee).permit(:id, :first_name, :last_name, :ssn, :date_of_birth, :phone, :role, :active, user_attributes: [:id, :email, :password, :_destroy])
    end
end
