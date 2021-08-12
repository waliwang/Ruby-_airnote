class NotesController < ApplicationController
    before_action :find_note, only: [:show, :edit, :update, :destroy]

    def index
        # @notes = Note.all.sort.reverse x
        @notes = Note.order(id: :desc)
        # @notes = Note.all.order(id: :desc)
    end

    def show
    end

    def edit
    end

    def new
        @note = Note.new
    end

    def update
        #Strong Parameter 強參數
    
        if @note.update(note_params)
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
        # r=params.[:note].permit(:title, :content)
        @note = Note.new(note_params)

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
        @note.destroy
        redirect_to "/notes"
    end

    private
         # Strong Parameter
    def note_params
         clean_note = params.require(:note).permit(:title, :content)
    end

    def find_note
            @note = Note.find(params[:id])
    end

  
end
