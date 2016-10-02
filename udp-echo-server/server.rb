require 'socket'

server = UDPSocket.new
server.bind('0.0.0.0', 10000)

loop do
  begin
    data, addr = server.recvfrom(1024)
    server.send 'hi', 0, addr[3], addr[1]
    puts "client say: '%s', msg: '%s'" % [addr.join(','), data]
  rescue Exception => e
    puts e
    server.close
  end
end
