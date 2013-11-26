class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user
  helper_method :make_permalink

	#create a helper method to access whoever is logged in at the moment.
  private
  def current_user
  	# a ||= b is the same as a = a || b
  	@current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  
  #Chuyen tieng viet co dau sang tieng viet khong dau va viet thuong, 
  #thay dau cach bang dau gach, loai bo ky tu bad url de tao duong dan
  def make_permalink(str)
    str = str.downcase
    str = str.gsub(/[áàảãạăắặằẳẵâấầẩẫậ]/, "a")
    str = str.gsub(/[ÁÀẢÃẠĂẮẶẰẲẴÂẤẦẨẪẬ]/, "a")
    str = str.gsub(/[đĐ]/, "đ"=>"d", "Đ"=>"d")
    str = str.gsub(/[éèẻẽẹêếềểễệ]/, "e")
    str = str.gsub(/[ÉÈẺẼẸÊẾỀỂỄỆ]/, "e")
    str = str.gsub(/[ìíỉĩị]/, "i")
    str = str.gsub(/[ÌÍỈĨỊ]/, "i")
    str = str.gsub(/[óòỏõọôốồổỗộơớờởỡợ]/, "o")
    str = str.gsub(/[ÓÒỎÕỌÔỐỒỔỖỘƠỚỜỞỠỢ]/, "o")
    str = str.gsub(/[ùúủũụưứừửữự]/, "u")
    str = str.gsub(/[ÙÚỦŨỤƯỪỨỬỮỰ]/, "u")
    str = str.gsub(/[ỳýỷỹỵ]/, "y")
    str = str.gsub(/[ỲÝỶỸỴ]/, "y")
    str = str.gsub(/[%,:().<>{}~^]/, "")
    str = str.gsub(/[\t\n ]/, "-")
  end

end
