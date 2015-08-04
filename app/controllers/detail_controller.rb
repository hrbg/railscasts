class DetailController < UIViewController

  def initialize(args)
    @episode = args
  end

  def loadView
    @layout    = DetailLayout.new(@episode)
    self.view  = @layout.view
    self.title = @episode["name"]
    @layout.add_constraints
  end

end
