require 'socket'

server = TCPServer.new(2000)

loop do
  client = server.accept

  Thread.start(client) do |client|
    loop do
      begin
        puts "#{client.peeraddr} client-say:" + client.readline
        client.puts 'server-say: hi!'
      rescue EOFError
        puts "#{client.peeraddr} client is disconnected."
        client.close
      end
    end
  end
end

