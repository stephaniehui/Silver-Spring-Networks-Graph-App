class StaticPagesController < ApplicationController
  
  def home
  end

  def help
  end
  
  def soak
    rbox = Rye::Box.new 'it-build-03', :password => 'Sxsabj1128'
    rbox.disable_safe_mode

    rbox.cd 'svn/HEAD/eng/test-framework'
    
    @stats = rbox.execute 'net_mgr -d fd04:e37c:f2be:5b:213:5001:0154:5b40 stat kio'
    @string = @stats.to_s
    
    failures = {}
    errors = {}
    activity = {}
    
    #Code for Failures
    failures[:total_ack_failures] = @string.match(/\d\stotal\sack\sfailures/)
    @f1 = failures[:total_ack_failures]
    
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
    @f9 =  failures[:total_session_start_failures]
    
    failures[:total_send_failures] = @string.match(/\d\stotal\ssend\sfailures/)
    @f10 = failures[:total_send_failures]
    
    failures[:total_recv_failures] = @string.match(/\d\stotal\srecv\sfailures/)
    @f11 =  failures[:total_recv_failures]
    
    failures[:total_make_packet_failures] = @string.match(/\d\stotal\smake\spacket\sfailures/)
    @f12 = failures[:total_make_packet_failures]
    
    failures[:total_session_authenticate_failures] = @string.match(/\d\stotal\ssession\sauthenticate\sfailures/)
    @f13 = failures[:total_session_authenticate_failures]
    
    failures[:total_session_meter_auth_failures] = @string.match(/\d\stotal\ssession\smeter\sauth\sfailures/)
    @f14 = failures[:total_session_meter_auth_failures]
    
    @sumFailures = 0
    failures.each do |key, value|
      value.to_s.match(/(\d+)/)
      @sumFailures += $1.to_i
    end
    
    
    #Code for Errors
    errors[:total_send_errors] = @string.match(/\d\stotal\ssend\serrors/)
    @e1 = errors[:total_send_errors]
    
    errors[:total_recv_errors] = @string.match(/\d\stotal\srecv\serrors$/)
    @e2 = errors[:total_recv_errors]
    
    errors[:total_recv_errors_in_send] = @string.match(/\d\stotal\srecv\serrors\sin\ssend/)
    @e3 = errors[:total_recv_errors_in_send]
    
    errors[:total_mbuf_get_errors] = @string.match(/\d\stotal\smbuf\sget\serrors/)
    @e4 = errors[:total_mbuf_get_errors]
    
    errors[:total_mbuf_append_errors] = @string.match(/\d\stotal\smbuf\sappend\serrors/)
    @e5 = errors[:total_mbuf_append_errors]
    
    @sumErrors = 0
    errors.each do |key, value|
      value.to_s.match(/(\d+)/)
      @sumErrors += $1.to_i
    end


    #Code for Activity
    activity[:total_bad_cksum] = @string.match(/\d\stotal\sbad\scksum/)
    @a1 = activity[:total_bad_cksum]
    
    activity[:total_nacks] = @string.match(/\d\stotal\snacks$/)
    @a2 = activity[:total_nacks]
    
    activity[:total_nacks_in_send] = @string.match(/\d\stotal\snacks\sin\ssend/)
    @a3 = activity[:total_nacks_in_send]
    
    activity[:total_get_ack_fails] = @string.match(/\d\stotal\sget\sack\sfails/)
    @a4 = activity[:total_get_ack_fails]
    
    activity[:total_timeouts] = @string.match(/\d\stotal\stimeouts/)
    @a5 = activity[:total_timeouts]
    
    activity[:total_spurious_packets] = @string.match(/\d\stotal\sspurious\spackets/)
    @a6 = activity[:total_spurious_packets]
    
    activity[:total_receive_buffer_overruns] = @string.match(/\d\stotal\sreceive\sbuffer\soverruns/)
    @a7 = activity[:total_receive_buffer_overruns]
    
    activity[:total_meter_busy] = @string.match(/\d\stotal\smeter\sbusy/)
    @a8 = activity[:total_meter_busy]
    
    @sumActivity = 0
    activity.each do |key, value|
      value.to_s.match(/(\d+)/)
      @sumActivity += $1.to_i
    end
    
    
    
    
  end
  
  def contact
  end
end
