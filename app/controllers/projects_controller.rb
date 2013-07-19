class ProjectsController < ApplicationController

  def index
    @index = "Something relevant"

    @bs = BaseSpaceAPI.start
    @result_files = []
    @results = []
    # @xm = ::Builder::XmlMarkup.new(:indent => 2)
    projects = @bs.get_project_by_user('current')
    projects.each do |project|
      @results << results = project.get_app_results(@bs)
      results.each do |result|
        result.get_files(@bs).each do |file|
          @result_files << file
        end
      end
    end
  end

  def show
    @item = "It's me"
  end

  # def new
  #   @example =  Bio::Fake::Example.new
  # end

  # def create
  #   @example = Bio::Fake::Example.new(params[:example])
  #   if @example.save
  #     redirect_to example_url(@example)
  #   else
  #     # This line overrides the default rendering behavior, which
  #     # would have been to render the "create" view.
  #     render :action => "new"
  #   end
  # end

# private 

  # def plot_r_norm
  #   r = new_r
  #   r.eval "x = rnorm(100,100)"
  #   r.eval "png('public/images/out.png')"
  #   r.eval "plot(x)"
  #   r.eval "dev.off()"
  # end
  
  # def new_r
  #   r = ::RinRuby.new(echo = false, interactive = false)
  #   r.eval "options(warn=-1)"
  #   return r
  # end

end