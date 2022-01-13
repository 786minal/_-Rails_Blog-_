class FilterJob < ApplicationJob
 #queue_as :mailer
  def perform(article_id)
    # Enqueue a job to be performed as soon as the queuing system is free.
    puts "job running....."
  end
end





#def some_mailer(user_id)
 # @user = User.find(user_id)
  #@email = @user.email
#  @subject ="Reminder"
 # mail(to: @email, 
  #  subject: @subject,  
    
   # )
 # end
#end
