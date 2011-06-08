require 'spec_helper'

describe QuestsController do

  should_deny_unauthenticated_user_to [:new, :create, :edit, :update, :destroy], Factory(:quest)

end
