class StaticPagesController < ApplicationController
  
  def home
  end

  def help
  end
  
  def about
    rbox = Rye::Box.new 'it-build-03', :password => 'Sxsabj1128'
    rbox.disable_safe_mode

    rbox.cd 'svn/HEAD/eng/test-framework'
    
    @stats = rbox.execute 'net_mgr -d fd04:e37c:f2be:5b:213:5001:0154:5b40 stat kio'
    @string = @stats.to_s
    
    failures = {}
    errors = {}
    activity = {}
    
    @array = Array.new
    
    failures[:total_ack_failures] = @string.match(/\d\stotal\sack\sfailures/)
    @f1 = failures[:total_ack_failures].to_s.match(/\d/)
    
    failures[:total_socket_open_failures] = @string.match(/\d\stotal\ssocket\sopen\sfailures/)
    @f2 = failures[:total_socket_open_failures]
    
    failures[:total_socket_connection_failures] = @string.match(/\d\stotal\ssocket\sconnection\sfailures/)
    @f3 = failures[:total_socket_connection_failures]
    
    failures[:total_session_identify_failures] = @string.match(/\d\stotal\ssession\sidentify\sfailures/)
    @f4 = failures[:total_session_identify_failures]
    
    failures[:total_session_negotiation_failures] = @string.match(/\d\stotal\ssession\snegotiation\sfailures/)
    @f5 = failures[:total_session_negotiation_failures]
    
    failures[:total_session_logon_failures] = @string.match(/\d\stotal\ssession\slogon\sfailures/)
    @f6 = failures[:total_session_logon_failures]
    
    failures[:total_session_security_failures] = @string.match(/\d\stotal\ssession\ssecurity\sfailures/)
    @f7 = failures[:total_session_security_failures]
    
    failures[:total_session_termination_failures] = @string.match(/\d\stotal\ssession\stermination\sfailures/)
    @f8 = failures[:total_session_termination_failures]
    
    failures[:total_session_start_failures] = @string.match(/\d\stotal\ssession\sstart\sfailures/)
    
    failures[:total_send_failures] = @string.match(/\d\stotal\ssend\sfailures/)
    
    failures[:total_recv_failures] = @string.match(/\d\stotal\srecv\sfailures/)
    
    failures[:total_make_packet_failures] = @string.match(/\d\stotal\smake\spacket\sfailures/)
    
    failures[:total_session_authenticate_failures] = @string.match(/\d\stotal\ssession\sauthenticate\sfailures/)
    
    failures[:total_session_meter_auth_failures] = @string.match(/\d\stotal\ssession\smeter\sauth\sfailures/)
    
    @sum = 0
    failures.each do |key, value|
      value.to_s.match(/(\d+)/)
      @sum += $1.to_i
    end
    
    


    
    
    
    
    
    @steph = "hi steph"
  end
  
  def contact
  end
end
