express = require 'express'
app = express()

app.set 'view engine', 'jade'
app.set 'views', "#{__dirname}/views"

app.get '/', (req, res) ->
    res.sendfile 'views/index.html'

app.get /^\/((?:js|css|img|public)\/.+)$/, (req, res) ->
    res.sendfile req.params
    
app.get /^\/room\/([A-Za-z0-9]+)$/, (req, res) ->
    res.render 'room.jade', { roomname: req.params }

app.get /^\/class$/, (req, res) ->
    res.render 'class.jade'

server = require('http').createServer(app).listen 80

count = require("#{__dirname}/bin/socket_server.coffee") server