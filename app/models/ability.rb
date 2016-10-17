class Ability
  include CanCan::Ability

  def initialize(user)
    if user.has_role? :admin
      can :manage, :all
    else
      can :show, TutorProfile
    end

    if user.has_role? :student
      can [:show], StudentProfile
      can [:manage], StudentProfile, user_id: user.id
      cannot [:index], StudentProfile
      can [:create], TutorBooking, student_id: user.id
      can [:create, :destroy], Message, user_id: user.id
    end

    if user.has_role? :tutor
      can :manage, TutorProfile, user_id: user.id
      can :read, StudentProfile
      can [:create], TutorBooking, tutor_id: user.id
      can [:create, :destroy], Message, user_id: user.id
    end

    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
  end
end
