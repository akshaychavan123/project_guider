first condition
suppose our post have status which is we are selecting from  given 
values 


in migration add default status value run migration 

    # validates :status ,  inclusion: {in: %w[published draft incomplete active ]}
    # STATUSES =  %w[published draft incomplete active ]

    # scope :published , -> {where(status: "published")}
    # scope :active , -> {where(status: "active")}
    # scope :draft , -> {where(status: "draft")}

    # scope :incomplete , -> {where(status: "incomplete")}
now we can access like Post::STATUSES
check in console for Post.publised or Post.draft or Post.active 
    and in our form 
    <%= form.select :status ,Post::STATUSES %>
===================================================================================
    above much of code we can replace with enum 
    add datatype of status as integer 

    t.integer :status , default:  :published  run mmigration
in our model 

    enum status: {active: 0 , draft: 1 , published: 2 , banned: 3}
    and in form 

    <%= form.select :status ,Post.statuses %> 

    now check in console for Post.publised or Post.draft or Post.active
====================================================================================
