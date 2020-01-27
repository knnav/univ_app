class LoginsController < ApplicationController

  def new

  end

  def create
    student = Student.find_by(email: params[:logins][:email].downcase)
    if student && student.authenticate(params[:logins][:password])
      flash[:notice] = "Logged in!"  
      session[:student_id] = student.id
      redirect_to student
    else
      flash.now[:notice] = "Something was wrong with your login information"
      render :new
    end
  end

  def destroy
    session[:student_id] = nil
    flash[:notice] = "Successfully logged out, bye!"
    redirect_to root_path
  end

end