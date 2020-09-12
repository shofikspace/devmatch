class Users::RegistrationsController < Devise::RegistrationsController
  # Extend default devise gem behaviar so tha users signing up with pro account (plan 2) 
  # save with special Stripe subscription function.
  # otherwise Devise sign up users as usual.
  
  def create
    super do |resource|
      if params[:plan]
        resource.plan_id = params[:plan]
        if resource.plan_id == 2
          resource.save_with_subscription
        else
          resource.save
        end
      end
    end
  end
end
