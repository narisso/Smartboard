class Ability
  include CanCan::Ability
  

  def initialize(user)

 # Por ahora todos los usuarios pueden hacer manage pero luego hay que configurarlo para
    # Acorde con el rol dentro del proyecto tenga distintas opciones
    user ||= User.new
    
    
    ## Permisos de acceso y administracion de proyectos ##
    can :create, Project


    can :read, Project do |project|
        project.users.include? user 

        if project.get_role(user) == "Administrator"
            can :manage, :all
        elsif project.get_role(user) == "Project Manager"
            can :manage, Task
        elsif project.get_role(user) == "Developer"   
            can :create, Task
            can :read, Task
            can :update, Task do |task|
              task.users.include? user
            end     
            
        else #Caso en el que es cliente
            ##No puede manejar tareas             
        end 

        not project.get_role(user) == "Client"
    end 

    can :update, Project do |project|
        project.get_role(user) == "Administrator" || project.get_role(user) == "Project Manager"
    end 

    can :destroy, Project do |project|
        project.get_role(user) == "Administrator"
    end 

    #Roles del proyecto
    #   Admin, project manager, developer, cliente 


    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
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
    # https://github.com/ryanb/cancan/wiki/Defining-Abilities
  end
end
