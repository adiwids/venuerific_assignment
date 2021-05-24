module Admin
  class UsersController < BaseController
    load_and_authorize_resource

    before_action :find_user, except: %i[index new create]

    def index
      @users = User.all
    end

    def new
      @user = User.new
    end

    def create
      @user = User.new(user_params)

      if @user.save
        flash[:notice] = 'User created'
        redirect_to admin_users_path
      else
        flash[:error] = @user.errors.full_messages.first
        render :new
      end
    end

    def show; end

    def edit; end

    def update
      if @user.update(user_params)
        flash[:notice] = 'User updated'
        redirect_to admin_user_path(id: params[:id])
      else
        flash[:error] = @user.errors.full_messages.first
        render :edit
      end
    end

    def destroy
      if @user.destroy
        flash[:notice] = 'User deleted'
      else
        flash[:error] = @user.errors.full_messages.first
      end

      redirect_to admin_users_path
    end

    private

    def user_params
      params.require(:user).permit(User.permitted_attributes)
    end

    def find_user
      @user = User.find(params[:id])
    end
  end
end
