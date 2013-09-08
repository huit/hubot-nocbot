# Description:
#   Utility to interface with NOC huis tool
#
# Commands:
#   hubot huis <IP or FQDN> - Reply with Data L3 Network Data *BETA*

net = require 'net'

module.exports = (robot) ->
  robot.respond /HUIS (.*)/i, (msg) ->
    qry = escape(msg.match[1])
    #msg.send "huis isn't working currently for search #{qry}"


    domain = 'huis.noc.harvard.edu'
    port = 43

    ping = (socket, delay) ->
      #msg.send "Pinging server with #{qry}"
      socket.write "#{qry}\n"
      #nextPing = -> ping(socket, delay)
      #setTimeout nextPing, delay

    connection = net.createConnection port, domain

    connection.on 'connect', () ->
      #msg.send "Opened connection to #{domain}:#{port}"
      # Send data here
      ping connection, 4000

    connection.on 'data', (data) ->
      #msg.send "Received: #{data}"
      msg.send "#{data}"

    connection.on 'end', (data) ->
      #msg.send "Connection closed"
      #process.exit()

