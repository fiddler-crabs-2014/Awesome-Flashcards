FLASHLOGGER = true

def flashlogger(message)
  puts "[LOG] #{caller[0]} #{message}" if FLASHLOGGER
end
