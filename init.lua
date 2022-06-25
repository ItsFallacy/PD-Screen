AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")

include("shared.lua")

util.AddNetworkString("PDHEALTH")
util.AddNetworkString("PDARMOR")
util.AddNetworkString("PDPILL")

function ENT:Initialize()

    self:SetModel("models/props_phx/rt_screen.mdl")
    self:PhysicsInit(SOLID_VPHYSICS)
    self:SetMoveType(MOVETYPE_VPHYSICS)
    self:SetSolid(SOLID_VPHYSICS)

    local phys = self:GetPhysicsObject()

    if phys:IsValid() then

        phys:Wake()

    end

end

net.Receive("PDHEALTH", function(len, ply)

    ply:SetHealth(100)

end)

net.Receive("PDARMOR", function(len, ply)

    ply:SetArmor(100)

end)

net.Receive("PDPILL", function(len, ply)

    ply:Kill()

end)