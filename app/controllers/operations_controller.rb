class OperationsController < TenantController
  before_action :set_operation, only: [ :edit, :update, :destroy ]

  respond_to :html

  def index
    @date = Date.parse(params.fetch(:date, Date.today.to_s))
    @paid = params.fetch(:paid, false) == 'true'

    @operations = Operation.where('due_at between ? and ?', @date.beginning_of_month, @date.end_of_month).where(paid: @paid).all

    @operations_flow_in_total  = @operations.where(flow_in: true).sum(:amount)
    @operations_flow_out_total = @operations.where(flow_in: false).sum(:amount).abs
    @operations_total = @operations.sum(:amount)

    respond_with @operations
  end

  def new
    @operation = Operation.new

    respond_with @operation
  end

  def edit
  end

  def create
    @operation = Operation.new
    @operation.localized operation_params
    @operation.save

    respond_with @operation, location: -> { operations_url }
  end

  def update
    @operation.localized operation_params
    @operation.save

    respond_with @operation, location: -> { operations_url }
  end

  def destroy
    @operation.destroy

    respond_with @operation, location: -> { operations_url }
  end

  private
    def set_operation
      @operation = Operation.find params[:id]
    end

    def operation_params
      params.require(:operation).permit(:flow_in, :description, :amount, :due_at, :paid, :bank_account_id, :comment, tag_ids: [])
    end
end
