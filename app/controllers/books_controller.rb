class BooksController < ApplicationController
	def top
	end

	def new
        @book = Book.new
    end

	def index
		@book = Book.new
		@books = Book.all
	end

	def create
        # ストロングパラメーターを使用
        @book = Book.new(book_params)
        if @book.save
        	flash[:notice] = "Book was successfully created."
    		redirect_to book_path(@book)
    	else
    		@books = Book.all
    		render 'index'
    	end
    end



    def edit
    	@book = Book.find(params[:id])
    end

    def update
        @book = Book.find(params[:id])
        if @book.update(book_params)
        	flash[:notice] = "Book was successfully created."
    		redirect_to book_path(@book)
    	else
    		@books = Book.all
    		render 'edit'
    	end
	end

    def show
    	@book = Book.find(params[:id])
    end

    def destroy
    	book = Book.find(params[:id])
        book.destroy
        redirect_to books_path
    end
    private

    def book_params
        params.require(:book).permit(:title, :body)
    end
end
