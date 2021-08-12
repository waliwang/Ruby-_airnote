class NotesController < ApplicationController
    def index
        # @notes = Note.all.sort.reverse x
        @notes = Note.order(id: :desc)
        # @notes = Note.all.order(id: :desc)
    end

    def show
        @note = Note.find(params[:id])
    end

    def edit
        @note = Note.find(params[:id])
    end

    def new
        @note = Note.new
    end

    def update
        #Strong Parameter 強參數
        clean_note = params.require(:note).permit(:title, :content)
        @note = Note.find(params[:id])
    
        if @note.update(clean_note)
            redirect_to "/notes"
        else
             ##待處理
            render :edit
            # redirect_to "/notees/new"
        end
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

    def destroy
        @note = Note.find(params[:id])
        @note.destroy
        redirect_to "/notes"
    end
  
end
