require 'socket'

HOSTNAME = 'localhost'
PORT = 2000

socket = TCPSocket.open(HOSTNAME, PORT)

loop do
  sleep 1
  socket.puts 'hello'
  begin
    puts socket.readline
  rescue EOFError
    socket.close
    exit
  end
end

