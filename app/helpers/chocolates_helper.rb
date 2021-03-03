module ChocolatesHelper
  def human_boolean(boolean)
    boolean ? "Yes" : "No"
  end

  def count_display(reviews)
    if reviews.count > 1 || reviews.count == 0
      "#{reviews.count}" + " reviews"
    else
      "#{reviews.count}" + " review"
    end
  end
end
