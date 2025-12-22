local sandboxFns = {}

function sandboxFns.getOpt(path, fallback)
  -- path like {"STNIMBLE_B42","XPPerPulse"}
  local t = SandboxVars
  for i = 1, #path do
    if type(t) ~= "table" then
      return fallback
    end
    t = t[path[i]]
  end
  if t == nil then
    return fallback
  end
  return t
end

return sandboxFns
