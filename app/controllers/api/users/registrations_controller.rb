# frozen_string_literal: true

class Api::Users::RegistrationsController < DeviseTokenAuth::RegistrationsController
  # skip_before_action :verify_authenticity_token
  skip_before_action :authenticate_user!
  before_action :set_user_by_token, only: [:destroy, :update]
  before_action :validate_sign_up_params, only: :create
  before_action :validate_account_update_params, only: :update
  skip_after_action :update_auth_header, only: [:create, :destroy]

  def create
    build_resource

    unless @resource.present?
      raise DeviseTokenAuth::Errors::NoResourceDefinedError,
            "#{self.class.name} #build_resource does not define @resource,"\
            ' execution stopped.'
    end

    # # give redirect value from params priority
    # @redirect_url = params.fetch(
    #   :confirm_success_url,
    #   DeviseTokenAuth.default_confirm_success_url
    # )

    # # success redirect url is required
    # if confirmable_enabled? && !@redirect_url
    #   return render_create_error_missing_confirm_success_url
    # end

    # # if whitelist is set, validate redirect_url against whitelist
    # return render_create_error_redirect_url_not_allowed if blacklisted_redirect_url?(@redirect_url)

    # override email confirmation, must be sent manually from ctrl
    callback_name = defined?(ActiveRecord) && resource_class < ActiveRecord::Base ? :commit : :create
    resource_class.set_callback(callback_name, :after, :send_on_create_confirmation_instructions)
    resource_class.skip_callback(callback_name, :after, :send_on_create_confirmation_instructions)

    if @resource.respond_to? :skip_confirmation_notification!
      # Fix duplicate e-mails by disabling Devise confirmation e-mail
      @resource.skip_confirmation_notification!
    end

    if @resource.save
      yield @resource if block_given?

      # unless @resource.confirmed?
      #   # user will require email authentication
      #   @resource.send_confirmation_instructions({
      #     client_config: params[:config_name],
      #     redirect_url: @redirect_url
      #   })
      # end
      @resource.confirm

      if active_for_authentication?
        # email auth has been bypassed, authenticate user
        @token = @resource.create_token
        @resource.save!
        update_auth_header
      end

      render_create_success
    else
      clean_up_passwords @resource
      render_create_error
    end
  end
end