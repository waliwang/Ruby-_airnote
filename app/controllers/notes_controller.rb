class NotesController < ApplicationController
    def index
    end

    def new
        @note = Note.new
    end

    def create
        title = params[:title]
        content = params[:content]
        note = Note.new(title: title, content: content)

        if note.save
            redirect_to "/notes"
        else
            ##待處理
        end
        # render html: params
    end
  
end
