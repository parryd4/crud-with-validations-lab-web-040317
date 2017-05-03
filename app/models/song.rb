class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :title, :artist_name, uniqueness: { scope: :release_year, message: "An artist can not release same song twice in 1 year" }
  validates :released, inclusion: { in: [true, false] }

  validate :using_custom_because_forget_learning_conditional_im_falling_behind_because_of_the_starting_point_of_this_lab

  def using_custom_because_forget_learning_conditional_im_falling_behind_because_of_the_starting_point_of_this_lab

    # if released, need year
    # year cant be in future
    # if not released, doesnt need year
    if released && !release_year.present?
      errors.add(:release_year, "needs a year to be released, duh")
    end

    if release_year.present? && release_year > Date.today.year
      errors.add(:release_year, "that's in the future! Time Cops have been notified.")
    end
  end


end
