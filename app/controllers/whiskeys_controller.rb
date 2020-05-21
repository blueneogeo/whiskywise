# frozen_string_literal: true

# typed: true

# Manage whiskey ratings.
# Note: assumes that the ApplicationController.current_user is valid
class WhiskeysController < ApplicationController
  extend T::Sig

  # before_action :set_whiskey, only: %i[show edit update destroy]

  # GET /whiskeys
  # GET /whiskeys.json
  def index
    @whiskeys = Whiskey.where(user_id: T.must(current_user).id)
  end

  # GET /whiskeys/1
  # GET /whiskeys/1.json
  def show
    # set_whiskey
    @whiskey = find_whiskey
  end

  # GET /whiskeys/new
  def new
    @whiskey = Whiskey.new(user_id: T.must(current_user).id)
  end

  # GET /whiskeys/1/edit
  def edit; end

  # POST /whiskeys
  # POST /whiskeys.json
  def create
    @whiskey = Whiskey.new(whiskey_params)
    validate_whiskey

    respond_to do |format|
      if @whiskey.save
        format.html { redirect_to '/', notice: 'Whiskey was successfully created.' }
        format.json { render :show, status: :created, location: @whiskey }
      else
        format.html { render :new }
        format.json { render json: @whiskey.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /whiskeys/1
  # PATCH/PUT /whiskeys/1.json
  def update
    respond_to do |format|
      if @whiskey.update(whiskey_params)
        format.html { redirect_to @whiskey, notice: 'Whiskey was successfully updated.' }
        format.json { render :show, status: :ok, location: @whiskey }
      else
        format.html { render :edit }
        format.json { render json: @whiskey.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /whiskeys/1
  # DELETE /whiskeys/1.json
  def destroy
    @whiskey.destroy
    respond_to do |format|
      format.html { redirect_to whiskeys_url, notice: 'Whiskey was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # find all whiskeys given some parameters
  # GET /whiskeys/search.json?contains=&taste=&color=&smokey=
  sig { void }
  def search
    @whiskeys = search_whiskey(
      T.must(current_user),
      contains: params[:contains] && params[:contains].to_s,
      taste: params[:taste] && params[:taste].to_i,
      color: params[:color] && params[:color].to_i,
      smokey: params[:smokey] && params[:smokey].to_i
    )
  end

  private

  # this method should be a Whiskey concern, but could not get that to work,
  # so it is here for now
  sig do
    params(
      user: User,
      contains: T.nilable(String),
      taste: T.nilable(Integer),
      color: T.nilable(Integer),
      smokey: T.nilable(Integer)
    )
      .returns(T.nilable(Whiskey::ActiveRecord_Relation))
  end
  def search_whiskey(user, contains: nil, taste: nil, color: nil, smokey: nil)
    whiskeys = Whiskey.where user_id: user.id
    whiskeys = whiskeys.where 'LOWER(name) LIKE :name', name: "%#{contains}%" if contains
    whiskeys = whiskeys.where 'rate_taste >= :taste', taste: taste if taste
    whiskeys = whiskeys.where 'rate_color >= :color', color: color if color
    whiskeys = whiskeys.where 'rate_smokey >= :smokey', smokey: smokey if smokey
    whiskeys
  end

  # throw an error if the whiskey_user is not the current_user
  def validate_whiskey
    raise 'Not the logged in user' if @whiskey.user_id != T.must(current_user).id
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_whiskey
    @whiskey = Whiskey.find(params[:id])
  end

  def find_whiskey
    Whiskey.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def whiskey_params
    params
      .require_typed(:whiskey, TA[ActionController::Parameters].new)
      .permit(
        :user_id,
        :name,
        :description,
        :rate_taste,
        :rate_color,
        :rate_smokey
      )
  end
end
