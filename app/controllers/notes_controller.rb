class NotesController < ApplicationController

	before_action :get_note,only: [:show,:update,:destroy,:edit]
	def index
		@notes = Note.all.order("created_at DESC")
	end

	def show
	end

	def new
		@note = current_user.notes.build
	end

	def update
		if @note.update(notes_params)
			redirect_to @note
		else
			render 'edit'
		end
	end

	def create
		@note = current_user.notes.build(notes_params)
		if @note.save
			redirect_to @note
		else
			render 'new'
		end
	end

	def destroy
		@note.destroy
		redirect_to notes_path
	end

	def edit
	end


	private
		def get_note
			@note = Note.find(params[:id])
		end

		def notes_params
			params.require(:note).permit(:title,:content)
		end
end
