--[[----------------------------------------------------------------------------

  Application Name:
  LuaDataFlowBlocks

  Summary:
  Serving Lua functions and events as data flow blocks.

  Description:
  This sample shows how functions and events from scripts can be served as data flow
  blocks. These then can be wired conveniently using the flow editor. In this sample
  two functions and one event are declared and served in the script and in the AppManifest.
  Adding 'Include data-flow' statement to the served function/event in the AppManifest
  makes them available as data flow blocks.
  An event with at least one parameter becomes a provider block.
  A function with at least one parameter and at least one return value becomes a processor block.
  A function with at least one parameter and no return value becomes a consumer block.

  How to run:
  To demo this sample, it must be loaded to any device or the emulator. The output
  of the consumer function can be seen at the console.

  Implementation:
  In order to make the created flow blocks appear in BlocksBrowser and to be opened in
  FlowEditor it is required that the App, which is serving the blocks, is deployed to
  the device.

------------------------------------------------------------------------------]]

--Start of Global Scope---------------------------------------------------------

-- Served event which acts as a provider block, it is served in the manifest
-- with 'include data-flow' statement.
Script.serveEvent('LuaDataFlowBlocks.OnNewNumber', 'OnNewNumber')

local num = 0

-- Creating timer to create numbers on expiration
local tmr = Timer.create()
tmr:setExpirationTime(1000)
tmr:setPeriodic(true)

--End of Global Scope-----------------------------------------------------------

--Start of Function and Event Scope---------------------------------------------

local function handleOnStarted()
  -- Starting timer
  tmr:start()
end
Script.register('Engine.OnStarted', handleOnStarted)

---Served function which acts as a processor block, it is served in the manifest
---with 'include data-flow' statement.
local function multiply(num1, num2)
  return num1 * num2
end
Script.serveFunction('LuaDataFlowBlocks.multiply', multiply)

---Served function which acts as a consumer block, it is served in the manifest
---with 'include data-flow' statement.
local function printResult(numResult)
  print('New number result: ' .. numResult)
end
Script.serveFunction('LuaDataFlowBlocks.printResult', printResult)

---Generating number on timer expiration and notifying 'Provider' event
local function handleOnExpired()
  num = num + 1
  Script.notifyEvent('OnNewNumber', num)
end
tmr:register('OnExpired', handleOnExpired)

--End of Function and Event Scope-----------------------------------------------
