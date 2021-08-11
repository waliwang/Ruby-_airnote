class NotesController < ApplicationController
    def index
        @notes = Note.all
    end

    def new
        @note = Note.new
    end

    def create
        # render html: params[:note]
        # cc = {"title"=>"2222", "content"=>"3333"}
        # note = Note.new(title: title, content: content)
        # title = params[:title]
        # content = params[:content]
   

        # Strong Parameter
        clean_note = params.require(:note).permit(:title, :content)
        # r=params.[:note].permit(:title, :content)
        @note = Note.new(clean_note)



        if @note.save
            redirect_to "/notes"
        else
            render :new
            # app/views/notes/new.html.erb
            # redirect_to "/notes/new"
            ##待處理
        end
        
    end
  
end
