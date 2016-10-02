require 'socket'

socket = UDPSocket.new

loop do
  begin
    sleep 1
    socket.send('hello', 0, '127.0.0.1', 10000)
    data, addr = socket.recvfrom(1024)
    puts "server say: '%s', msg: '%s'" % [addr.join(','), data]
  rescue Exception => e
    puts e
    socket.close
  end
end
