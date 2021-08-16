require_relative 'server'
require_relative 'thebot'

t1 = Thread.new{web()}
t2 = Thread.new{bot()}
t1.join
t2.join