package.path = package.path..";../?.lua"

local Kernel = require("schedlua.kernel")()

local idx = 0
local essentialTasks = {}
local highPriorityTasks = {}
local basicTasks = {}

local function numbers(ending)
  local idx = 0
  local function closure()
    idx = idx + 1
    if idx > ending then
      return nil
    end
    return idx
  end

  return closure
end

local function counter(name, nCount)
  for num in numbers(nCount) do
    print(name, num);
    yield();
  end
  halt();
end

local function handleEssential(name, max)
  while next(essentialTasks) ~= nil do
    local task = essentialTasks.remove
    while idx <= task.name.max do
      print("processing"..name)
    end
  end
end

local function handlePriority(name, max)
end

local function handleBasic(name, max)
end

local function task(name, max, priority)
  if priority = "essential"
    table.insert(essentialTasks, 1, name["max"] = max)
  elseif priority = "high"
    table.insert(highPriorityTasks, 1, name["max"] = max)
  elseif priority = "basic"
    table.insert(basicTasks, 1, name["max"] = max)
  end
end

local function main()
  local t0 = spawn(counter, "counter1", 100)
  local t1 = spawn(task, "essential task1", 3, "essential")
  local t2 = spawn(task, "priority task1", 6, "high")
  local t3 = spawn(task, "basic task", 5, "basic")
  local t4 = spawn(task, "priority task2", 3, "high")
  local t5 = spawn(task, "essential task2", 5, "essential")
end

run(main)