class MessagesController < ApplicationController
  before_action :set_message, only: [:show, :edit, :update, :destroy]

  # GET /messages
  # GET /messages.json
  def index
    @conversation = Conversation.where("(conversations.sender_id = ? AND conversations.receiver_id =?) OR (conversations.sender_id = ? AND conversations.receiver_id =?)", current_user.id, params[:userId].to_i, params[:userId].to_i, current_user.id)
    @messages = @conversation.present? ? @conversation.first.messages.for_display : []
    @message = Message.new
    @user = User.find(params[:userId])
  end

  # GET /messages/1
  # GET /messages/1.json
  def show
  end

  # GET /messages/new
  def new
    @message = Message.new
  end

  # GET /messages/1/edit
  def edit
  end

  # POST /messages
  # POST /messages.json
  def create
    conversation = fetch_conversation(message_params[:sender_id], params[:receiver_id])
    @message = conversation.messages.new(message_params)

    respond_to do |format|
      if @message.save
          ActionCable.server.broadcast 'room_channel',
                                   content:  @message.content,
                                   created_at: @message.message_time,
                                   username: @message.user.full_name,
                                   sender_id: @message.sender_id.to_s,
                                   receiver_id: params[:receiver_id]
        # format.html { redirect_to messages_path, notice: 'Message was successfully created.' }
        format.json { render :show, status: :created, location: @message }
      else
        format.html { render :new }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  def fetch_conversation(user_1, user_2)
    conversation = Conversation.where("(conversations.sender_id = ? AND conversations.receiver_id =?) OR (conversations.sender_id = ? AND conversations.receiver_id =?)", user_1, user_2, user_2, user_1)
    if conversation.present?
      conversation.first
    else
      Conversation.create(sender_id: user_1, receiver_id: user_2)
    end
  end

  # PATCH/PUT /messages/1
  # PATCH/PUT /messages/1.json
  def update
    respond_to do |format|
      if @message.update(message_params)
        format.html { redirect_to @message, notice: 'Message was successfully updated.' }
        format.json { render :show, status: :ok, location: @message }
      else
        format.html { render :edit }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /messages/1
  # DELETE /messages/1.json
  def destroy
    @message.destroy
    respond_to do |format|
      format.html { redirect_to messages_url, notice: 'Message was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_message
      @message = Message.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def message_params
      params.require(:message).permit(:content, :sender_id, :status, :conversation_id)
    end
end
