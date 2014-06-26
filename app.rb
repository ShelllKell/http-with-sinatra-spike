require "sinatra/base"


class MyApp < Sinatra::Application


  def initialize
    super
    @students = {:student_1 => "Brad", :student_2 => "Layne", :student_3 => "Miji"}
  end


  get "/" do
    "items length: #{@students.length}" +
    "<br>" +
    "<a href='/students'>Go to students page</a>"

  end


  get "/students/?" do
    filter = params[:sort]
    filtered_students = @students
    unless filter == nil
     filtered_students = @students.select { |key, value| value.include?(filter) }
    end

  erb :students, :locals => {:students => filtered_students}

  end


  get "/students/:name" do
    name = params[:name]
    erb :student_page, :locals => {:name => name}
  end






  run! if app_file == $0
end
