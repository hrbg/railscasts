class DetailLayout <  MotionKit::Layout

  def initialize(episode)
    super
    @episode = episode
  end
  
  def layout
    background_color UIColor.whiteColor

    add UIView, :main do
      background_color UIColor.grayColor
      
      add UILabel, :main_text do
        text @episode['description']
        text_alignment UITextAlignmentCenter
        text_color UIColor.whiteColor
        target.numberOfLines = 0
      end
    end

    @episode['tags'].each_with_index do |tag, index|
      add UIView, "footer_#{index}".to_sym do
        background_color UIColor.lightGrayColor
        add UILabel, "footer_#{index}_text".to_sym do
          text_alignment UITextAlignmentCenter
          text_color UIColor.whiteColor
          text "##{tag["tag"]["name"]}"
        end
      end      
    end
  end

  def add_constraints

    constraints(:main) do
      top.equals(:header, NSLayoutAttributeBottom).plus(20)
      left 20
      width.equals(view).minus(40)
    end

    constraints(:main_text) do
      top_left x: 5, y: 5
      width.equals(:main_text).minus(20)
      height.equals(:main_text).minus(20)
    end

    constraints(:main_text) do
      top_left x: 10, y: 10
      width.equals(:main).minus(20)
      height.equals(:main).minus(20)
    end

    constraints(:footer_0) do
      bottom.equals(view).minus(20)
      left 20
      width.equals(:main).divided_by(2).minus(10)
      height 50
    end

    constraints(:footer_0_text) do
      top_left x: 10, y: 10
      width.equals(:footer_0).minus(20)
      height.equals(:footer_0).minus(20)
    end

    if @episode["tags"].size > 1
      constraints(:footer_1) do
        bottom.equals(:footer_0)
        left.equals(:footer_0, NSLayoutAttributeRight).plus(20)
        width.equals(:footer_0)
        height.equals(:footer_0)
      end

      constraints(:footer_1_text) do
        top_left x: 10, y: 10
        width.equals(:footer_1).minus(20)
        height.equals(:footer_1).minus(20)
      end
    end
    
  end
end
