class ExercisesController < ApplicationController
  def new
    @exercise = current_user.exercises.new
  end
  def show
    @exercise = current_user.exercises.find(params[:id])
  end
  def index
    @exercises = current_user.exercises
  end
  def create
    @exercise = current_user.exercises.new(exercise_params)
    if @exercise.save
      flash[:notice] = "Exercise added!"
      redirect_to [current_user, @exercise]
    else
      flash.now[:alert] = "Exercise not saved."
      render :new
    end
  end

  def exercise_params
    params.require(:exercise).permit(:duration_in_min, :workout, :workout_date, :user)
  end
end
