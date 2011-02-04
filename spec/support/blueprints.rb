require 'machinist/active_record'

   Job.blueprint do
     title { "Post #{sn}" }
     location{ "Location #{sn}" }
     company {"Company #{sn}" }
     approved {true}
   end
