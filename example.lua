local sync = require "sync"

local function async_test()
    print("async wait 1 sec, start time: " .. os.time())
    LuaTimer.Add(1000, function()
        print("async wait 1 sec, done time: " .. os.time())
    end)
end

local function sync_test()
    local sleep = sync(LuaTimer.Add)
    
    print("sync wait 1 sec, start time: " .. os.time())
    coroutine.wrap(function()
        sleep(1000)
        print("sync wait 1 sec, done time: " .. os.time())
    end)()
end

async_test()
sync_test()