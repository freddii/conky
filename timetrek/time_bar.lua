--[[
Time Bar 19 June 2011
by mrpeach
Edited by Etles_Team in 19 January 2016.

20 June 2011 script for HOURS, MINUTES & SECONDS added by Sector11

Call this script as follow in conkyrc file before (TEXT) :
    lua_load ~/.conky/Conky-Name/scripts/lua/time_bar.lua
    lua_draw_hook_pre draw_boxes

]] 

require 'cairo'

function rgb_to_r_g_b(color, alpha)
return ((color / 0x10000) % 0x100) / 255., ((color / 0x100) % 0x100) / 255., (color % 0x100) / 255., alpha
end

function conky_draw_boxes()
if conky_window == nil then return end
local cs = cairo_xlib_surface_create(conky_window.display, conky_window.drawable, conky_window.visual, conky_window.width, conky_window.height)
cr = cairo_create(cs)
local updates=tonumber(conky_parse('${updates}'))
if updates>1 then
--======================================================================================================================--
--hour box settings
----------------------------
local hour_start_x=10           -- left &right
local hour_start_y=15            -- up & down
local hour_width=12             -- Actually it's the height
local hour_total_length=200     -- total length of all boxes and gaps
local hour_bg_color=0xFFFFFF    -- background color of box
local hour_fg_color=0x90EE90    -- foreground color
local hour_gap=2                -- if display shows no divisions this is probably set too high
----------------------------
--minute box settings
----------------------------
local minute_start_x=10         -- left &right
local minute_start_y=31         -- up & down
local minute_width=12           -- Actually it's the height
local minute_total_length=400   -- total length of all boxes and gaps
local minute_bg_color=0xFFFFFF  -- background color of box
local minute_fg_color=0xFFA300  -- foreground color
local minute_gap=2              -- if display shows no divisions this is probably set too high
----------------------------
--second box settings
----------------------------
local second_start_x=10         -- left &right
local second_start_y=47         -- up & down
local second_width=12           -- Actually it's the height
local second_total_length=400   -- total length of all boxes and gaps
local second_bg_color=0xFFFFFF  -- background color of box
local second_fg_color=0x55ABFF  -- foreground color
local second_gap=2              -- if display shows no divisions this is probably set too high

--=====================================================================================================================--
-- Hour Settings
----------------------------
local hour_bits=12
local hour2num=tonumber(os.date("%I"))
-------------------------------------------------
local box_total=hour_total_length-(hour_gap*(hour_bits-1))
local box_len=box_total/hour_bits
cairo_set_source_rgba(cr,rgb_to_r_g_b(hour_bg_color,0.2))
for i=1,hour_bits do
if i<=tonumber(hour2num) then
cairo_set_source_rgba(cr,rgb_to_r_g_b(hour_fg_color,1))
else
cairo_set_source_rgba(cr,rgb_to_r_g_b(hour_bg_color,0.2))
end
cairo_rectangle(cr,hour_start_x+(box_len*(i-1))+(hour_gap*(i-1)),hour_start_y, box_len, hour_width)
cairo_fill (cr)
end
----------------------------
-- Minute Settings
----------------------------
local minute_bits=60
local minute2num=tonumber(os.date("%M"))
-------------------------------------------------
local box_total=minute_total_length-(minute_gap*(minute_bits-1))
local box_len=box_total/minute_bits
cairo_set_source_rgba(cr,rgb_to_r_g_b(minute_bg_color,0.2))
for i=1,minute_bits do
if i<=tonumber(minute2num) then
cairo_set_source_rgba(cr,rgb_to_r_g_b(minute_fg_color,1))
else
cairo_set_source_rgba(cr,rgb_to_r_g_b(minute_bg_color,0.2))
end
cairo_rectangle(cr,minute_start_x+(box_len*(i-1))+(minute_gap*(i-1)),minute_start_y, box_len, minute_width)
cairo_fill (cr)
end
----------------------------
-- Second Settings
----------------------------
local second_bits=60
local second2num=tonumber(os.date("%S"))
-------------------------------------------------
local box_total=second_total_length-(second_gap*(second_bits-1))
local box_len=box_total/second_bits
cairo_set_source_rgba(cr,rgb_to_r_g_b(second_bg_color,0.2))
for i=1,second_bits do
if i<=tonumber(second2num) then
cairo_set_source_rgba(cr,rgb_to_r_g_b(second_fg_color,1))
else
cairo_set_source_rgba(cr,rgb_to_r_g_b(second_bg_color,0.2))
end
cairo_rectangle(cr,second_start_x+(box_len*(i-1))+(second_gap*(i-1)),second_start_y, box_len, second_width)
cairo_fill (cr)
end
-------------------------------------------------
--##############################################################################
--##############################################################################
end-- if updates>5
cairo_destroy(cr)
cairo_surface_destroy(cs)
cr=nil
end-- end main function
--============================================ Regards, Etles_Team =====================================================--
