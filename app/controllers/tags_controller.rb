class TagsController < TenantController
  before_action :set_tag, only: %i[ edit update destroy ]

  def index
    @tags = Tag.all

    respond_with @tags
  end

  def new
    @tag = Tag.new

    respond_with @tag
  end

  def edit
    respond_with @tag
  end

  def create
    @tag = Tag.create tag_params

    respond_with @tag, location: -> { tags_url }
  end

  def update
    @tag.update tag_params

    respond_with @tag, location: -> { tags_url }
  end

  def destroy
    @tag.destroy

    respond_with @tag, location: -> { tags_url }
  end

  private
    def set_tag
      @tag = Tag.find params[:id]
    end

    def tag_params
      params.require(:tag).permit(:name)
    end
end
