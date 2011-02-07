require 'machinist/active_record'

   Job.blueprint do
     title { "Post #{sn}" }
     location{ "Location #{sn}" }
     company {"Company #{sn}" }
     description{"Description #{sn}"} 
     approved {true}
   end
