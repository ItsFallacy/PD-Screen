AddCSLuaFile("imgui.lua")

local imgui = include("imgui.lua")

include("shared.lua")

function ENT:Draw()
    self:DrawModel()

    if imgui.Entity3D2D(self, Vector(6.2, -200, 10), Angle(0, 90, 90), 0.3) then

        --draws the background of the pd screen
        surface.SetDrawColor(0, 153, 255, 255)
        surface.DrawRect(570, -90, 190, 120)

        --Draws the Text at the top that says "PD Screen"
        draw.SimpleText("PD Screen", imgui.xFont("!Roboto@19"), 630, -85)

        --Adds a button to the screen
        if imgui.xTextButton("Purchase Health", "!DermaDefaultBold@15", 620, -65, 100, 25, 1, Color(255, 255, 255), Color(0,0,255), Color (0,0 ,0)) then
            print("Success Health Given")

            net.Start("PDHEALTH")
            net.SendToServer()
        end

        if imgui.xTextButton("Purchase Armor", "!DermaDefaultBold@15", 620, -38, 100, 25, 1, Color(255, 255, 255), Color(0,0,255), Color (0,0 ,0)) then
            print("Success Armor Given")

            net.Start("PDARMOR")
            net.SendToServer()
        end

         if imgui.xTextButton("Take the easy way out", "!DermaDefaultBold@11", 620, -11, 100, 25, 1, Color(255, 255, 255), Color(0,0,255), Color (0,0 ,0)) then
            print("A player has taken the easy way out" )

            net.Start("PDPILL")
            net.SendToServer()
        end


    imgui.End3D2D()
        end
    end