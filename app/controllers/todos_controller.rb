class TodosController < ApplicationController
  def index
    render plain: Todo.all.order(:due_date).map { |todo| todo.to_pleasant_string }.join("\n")
  end

  def show
    id = params[:id]
    todo = Todo.find(id)
    render plain: todo.to_pleasant_string
  end

  def create
    todo_text = params[:todo_text]
    due_date = DateTime.parse(params[:due_date])
    todo_new = Todo.create(
      todo_text: todo_text,
      due_date: due_date,
      completed: false,
    )
    response_text = "Hey , your new todo is created with id #{todo_new.id}"
    render plain: response_text
  end
end
