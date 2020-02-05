AddCSLuaFile()
ENT.Type   = "anim"
ENT.Category = "Toybox Classics"
ENT.Spawnable = true
ENT.PrintName           = "Melon Hunt"
ENT.THEONE = false

--[[
    
    
    
    
Viewing this to cheat?
Shameful.




]]

if ( SERVER ) then
totalmelonsCW = 0 
isMelonControlSpawned=false

function ENT:Initialize()
    local ent = self.Entity
    if(isMelonControlSpawned) then
        ent:Remove()
        return
    end
    if(!isMelonControlSpawned) then
        self.THEONE = true
        isMelonControlSpawned=true
        self:CreateMelons()
    end
    ent:SetModel( "models/Combine_Helicopter/helicopter_bomb01.mdl" )
    ent:SetColor(Color(255, 255, 255, 0))
    ent:SetMaterial("color")
end

function ENT:CreateMelons()
-- TODO Melon Creation Here
    if(!timer.Exists("checksolvetimerCW")) then
    timer.Create("checksolvetimerCW", 1, 0, function()
        if (totalmelonsCW==0) then
        self:STP("You found all the melons!")
        self:Remove()
        end
    end )
    end
    totalmelonsCW=0
    local mn = string.lower(game.GetMap())
    
    if mn == "gm_construct" then
        self:MM(-3933.6394042969, 5056.2763671875, 679.54858398438)
        self:MM(-1612.7806396484, -2567.8647460938, 1287.7906494141)
        self:MM(-2960.6694335938, -1375.6282958984, -66.351806640625)
        self:MM(-5630.74609375, -3424.1696777344, 263.89654541016)
        self:MM(-2839.3120117188, -2508.3771972656, 3114.4284667969)
        self:MM(721.52655029297, -1807.7380371094, 1144.9304199219)
        self:MM(1847.7012939453, 6455.6694335938, -825.05517578125)
        self:MM(-1064.1516113281, -1065.4431152344, -136.21110534668)
        self:MM(-2718.7143554688, -952.56066894531, -504.08975219727)
        self:MM(-1113.9877929688, 6376.7309570313, -164.68003845215)
        self:MM(-4026.2954101563, 4820.4853515625, -88.648788452148)
        self:MM(-3208.1906738281, -1911.9735107422, 55.783042907715)
        self:MM(-2650.8732910156, -2655.0751953125, -249.45977783203)
        self:MM(-3257.3955078125, -2551.8894042969, -135.80807495117)
        self:Dictate()
        return
    end
    if mn == "gm_flatgrass" then
        self:MM(-963.76806640625, -27.634113311768, -12759.751953125)
        self:MM(-408.48840332031, -914.80780029297, -12535.5078125)
        self:MM(-754.42639160156, 939.77734375, -12536.486328125)
        self:MM(-5251.552734375, 120.83418273926, -15352.463867188)
        self:MM(374.58514404297, 50.741550445557, -12791.653320313)
        self:MM(-423.83654785156, 439.30853271484, -12759.009765625)
        self:MM(977.06939697266, 638.08154296875, -12536.09375)
        self:Dictate()
        return
    end
    if(mn=="gm_construct_12") then
        self:MM(1050.2, -160.9, -136)
        self:MM(-1966.3, -2142.9, -136.3)
        self:MM(-2407.4, -1012.4, -124.8)
        self:MM(-3038.9, -1890, 55.7)
        self:MM(-3264.2, -1899.3, -136.3)
        self:Dictate()
        return
    end
    if(mn=="gm_flatgrass_12") then
        self:MM(3251.3, -5279.3, 6.7)
        self:MM(-9346.4, -12081.8, 6.7)
        self:MM(-9280, 6694.4, 6.7)
        self:Dictate()
        return
    end
    if(mn=="rp_downtown_v1") then self:CVSN(2) return end
    if(mn=="rp_downtown_v3") then self:CVSN(2) return end
    if(mn=="rp_downtown_v2") then
        self:MM(-1772.7344, -2029.6722, -169.6671)
        self:MM(-1674.2896, -360.9467, -149.4921)    
        self:MM(-1009.3851, 2014.5328, -188.2810)    
        self:MM(-1947.1791, -2239.7136, -291.8292)    
        self:MM(-308.0620, -1263.6014, -162.3988)    
        self:MM(653.5953, -1295.1030, -151.0443)
        self:MM(1462.5170, -1083.8533, -140.2997)
        self:MM(1504.7767, -1565.3005, -149.8437)
        self:MM(1611.4937, 145.4244, 87.7123)
        self:MM(3158.9233, 664.5258, -511.6361)
        self:MM(-629.1885, 1230.5430, -440.5695)
        self:MM(229.9187, 1181.5775, -707.7877)
        self:MM(-2200.3669, 201.1466, -188.2085)
        self:MM(-2675.1917, -89.9388, -196.2759)
        self:MM(-2072.2754, -113.1921, 70.8277)
        self:MM(-1551.0929, 116.6229, 170.8107)
        self:MM(-736.9385, -1251.5264, -48.6159)
        self:MM(-826.2391, -961.6708, 80.5593)    
        self:MM(-891.0633, -964.7222, 203.7316)
        self:MM(-962.1940, -2361.8093, 191.5026)
        self:MM(304.1652, 332.6447, -191.3498)
        self:MM(1226.9550, 538.4940, -332.2834)
        self:MM(-1474.0919, 938.6428, -188.0699)
        self:MM(1655.0846, -2100.8931, -338.7905)
        self:MM(-633.4183, -1979.6517, -420.2827)
        self:Dictate()
        self:UnlockDoors()
        return
    end
    if(mn=="rp_evocity_v2d") then
        self:MM(5314.11,3328.73,428.172)
        self:MM(2984.29,7207.83,2.7081)
        self:MM(1996.68,3480.48,94.2161)
        self:MM(-409.923,4136.66,227.368)
        self:MM(-497.207,12.1457,72.3731)
        self:MM(-2384.23,359.189,213.247)
        self:MM(-11765.9,9543.68,103.815)
        self:MM(-11720.5,8574.45,71.7338)
        self:MM(-6782.04,-4514.63,119.11)
        self:MM(-5290.34,-4607.92,139.101)
        self:MM(-2893.68,-5851.37,333.855)
        self:MM(-5306.74,-7687.44,479.954)
        self:MM(-5319.69,-7733.85,479.815)
        self:MM(-5358.71,-7786.67,479.734)
        self:MM(-5418.49,-7829.84,479.718)
        self:MM(-5461.67,-7826.53,479.736)
        self:MM(-5506.02,-7830.85,479.732)
        self:MM(-7191.97,-7285.63,82.9375)
        self:MM(-6890.29,-7523.43,80.7292)
        self:MM(-6823.09,-7522.72,80.7254)
        self:MM(-6752.22,-7529.9,80.734)
        self:MM(-6527.81,-9075.92,847.492)
        self:MM(-8122.39,-9192.09,847.905)
        self:MM(-7552.89,-9217.54,1744.05)
        self:MM(-6881.38,-8886.17,2623.71)
        self:MM(-7065.96,-9410.12,2495.72)
        self:MM(-7202.84,-9037.17,2250.1)
        self:MM(-7887.92,-8633.28,-1407.67)
        self:MM(-9106.43,-9433.4,92.7867)
        self:MM(-7558.67,-9889.69,79.7302)
        self:MM(-7778.29,-10188,211.712)
        self:MM(-7914.77,-10394.1,79.7175)
        self:MM(-7028.93,-11570.5,79.7183)
        self:MM(6589.37,-12952.9,375.723)
        self:MM(6492.89,-12557.9,403.953)
        self:MM(6515.83,-12555.9,404.109)
        self:MM(11274.7,-13175.9,-1046.43)
        self:MM(12055.9,-12694.1,-1046.26)
        self:MM(-5044.72,-9043.3,79.6786)
        self:MM(-4861.61,-9022.93,1615.29)
        self:MM(2593.17,-8754.14,74.5513)
        self:MM(2959.81,-8255.09,130.974)
        self:MM(3676.74,-7327.5,185.394)
        self:MM(4824.27,-3977.86,79.7571)
        self:MM(11809.9,50.0903,123.797)
        self:MM(10436.1,14269.1,77.5041)
        self:MM(5649.97,14127.4,90.4353)
        self:MM(1308.06,13150.1,69.871)
        self:MM(-7500.7,13448.2,118.82)
        self:MM(2084.93,13990.6,108.705)
        self:Dictate()
        self:STP("Wow, fifty?! Better get crackin'!")
        return
    end
    if(mn=="gm_construct_flatgrass_v6") then self:CVSN(5) return end
    if(mn=="gm_construct_flatgrass_v5") then
        self:MM(12443.5,6794.27,-392.266)
        self:MM(6923.62,4230.3,-392.275)
        self:MM(8572.66,4681.19,-392.272)
        self:MM(13754.8,1149.79,7.68055)
        self:MM(7426.4,-10757.8,-36.7587)
        self:MM(-3384.98,-3073.63,8327.87)
        self:MM(-4229.99,-4283.23,-392.284)
        self:MM(-4230.47,10747.9,-392.276)
        self:MM(-6278.56,12108.3,-432.126)
        self:MM(-1850.01,1804.54,-880.282)
        self:MM(10379.8,4312.58,-880.283)
        self:Dictate()
        return
    end
    if(mn=="gm_bigcity") then
        self:MM(219.292,-71.8126,-11128.3)
        self:MM(4639.18,5725.48,-11128.3)
        self:MM(9406.21,10053.4,-11092.3)
        self:MM(3298.06,13215.1,-11408.3)
        self:MM(3297.73,2099.89,-11408.3)
        self:MM(-9086.67,-5016.72,-11128.3)
        self:MM(-6006.92,782.122,-11128.3)
        self:MM(-1418.86,4848.48,-11128.3)
        self:MM(672.811,7437.42,-11128.3)
        self:MM(12372.8,5471.8,-11128.3)
        self:MM(13231.3,4615.14,-11408.3)
        self:MM(3346.17,2202.04,-11408.3)
        self:MM(3244.23,2204.99,-11408.3)
        self:MM(13228,3830.91,-10864.2)
        self:MM(13153.2,-11264.1,-11128.3)
        self:Dictate()
        self:STP("This map is pretty big though!")
        return
    end
    if(mn=="gm_wireconstruct_rc") then
        self:MM(10433.2,8217.83,-13348.4)
        self:MM(-7786.91,9551.65,-14680.4)
        self:MM(-5136.55,10783.6,-14808.3)
        self:MM(-4193.44,9216.68,-15510.5)
        self:MM(-8909.39,12853.9,-14124.3)
        self:MM(-9672.53,9806.78,-14542.1)
        self:MM(-9672.41,9784.19,-14654.2)
        self:MM(-9672.26,9725.93,-14452.8)
        self:MM(-9672.03,9642.24,-14540.5)
        self:MM(-9672.07,9665.04,-14653.7)
        self:Dictate()
        return
    end
    if(mn=="rpw_downtown_v1") then self:CVSN(3) return end
    if(mn=="rpw_downtown_v2") then self:CVSN(3) return end
    if(mn=="rpw_downtown_v3") then
        self:MM(-1666.91,-2726.98,-188.341)
        self:MM(-755.483,-943.897,-52.3135)
        self:MM(-738.767,-1235.66,79.7215)
        self:MM(-732.155,-1044.22,220.4)
        self:MM(-825.143,-1248.96,464.569)
        self:MM(-814.432,-1223.76,464.417)
        self:MM(-60.7989,1008.69,-182.853)
        self:MM(725.722,1262.49,-144.167)
        self:MM(421.47,231.537,-192.268)
        self:MM(1268.84,-1908.61,-178.304)
        self:MM(1298.57,-375.912,-188.27)
        self:MM(5169.67,-949.059,-310.355)
        self:MM(2154.74,-1273.14,63.7195)
        self:MM(2313.6,1769.78,-188.283)
        self:MM(-331.859,3976.89,-150.054)
        self:MM(1196.62,3495.72,-32.2787)
        self:MM(93.6726,4114.19,-188.276)
        self:MM(3289.21,3254.91,-82.2346)
        self:MM(-632.185,1568.43,-391.503)
        self:MM(-1888.67,659.215,-872.276)
        self:MM(-1286.6,-687.42,-652.135)
        self:MM(-912.415,1483.71,-599.904)
        self:MM(-914.13,1562.85,-421.511)
        self:MM(-1701.85,-2049.31,-488.286)
        self:MM(3473.26,4317.76,-144.281)
        self:Dictate()
        self:UnlockDoors()
        return
    end
    if(mn=="rp_c18_v2") then self:CVSN(1) return end
    if(mn=="rp_c18_v1") then
        self:MM(3475,-3037.67,780.123)
        self:MM(1969.83,-4001.01,678.023)
        self:MM(-985.738,-1166.98,696.034)
        self:MM(-967.445,-1164.51,696.024)
        self:MM(-245.385,296.929,767.731)
        self:MM(-1749.46,-287.57,722.2)
        self:MM(-565.145,-450.428,1148.71)
        self:MM(1813.08,-682.663,1191.58)
        self:MM(1030.42,-1812.17,1191.72)
        self:MM(793.816,-1142.68,671.979)
        self:MM(5198.06,1255.83,1016.01)
        self:MM(5010.04,1439.53,1015.97)
        self:MM(-723.183,137.034,855.721)
        self:MM(-2192.09,1160.51,882.616)
        self:MM(-2192.68,1134.2,883.895)
        self:MM(-3123.48,4004.79,632.031)
        self:MM(-1522.26,4575.34,887.726)
        self:MM(-1323.58,3961.32,1263.73)
        self:MM(-1382.45,3861.85,1263.72)
        self:MM(-1434.34,3971.92,1263.74)
        self:MM(-1348.45,3040.78,752.43)
        self:MM(113.517,3917.61,893.157)
        self:MM(-616.892,2736.55,1136.01)
        self:MM(582.748,2248.03,1249.34)
        self:MM(-887.968,4476.03,1146.2)
        self:Dictate()
        self:STP("There aren't any in the nexus since it's not accessible!")
        return 
    end
    if(mn=="rp_downtown_v2_fiend_v2b" or mn=="rp_downtown_v2_fiend_v2c") then --NOPE
        self:NOPE("Sorry, this map isn't available.")
        self:STP("Try rp_downtown_v2")
        self:STP("Try rpw_downtown_v3")
        return
    end
    if(mn=="dm_richland") then
        self:MM(-1306.78,2108.61,193.929)
        self:MM(1023.66,1634.43,259.976)
        self:MM(1423.35,1697.84,321.573)
        self:MM(1294.27,-1466.15,32.1761)
        self:MM(775.914,112.54,192.163)
        self:MM(-834.378,367.713,183.733)
        self:MM(-940.244,370.945,183.74)
        self:MM(-952.161,331.577,183.867)
        self:MM(-1051.5,715.364,51.4751)
        self:MM(407.726,1819.47,91.3662)
        self:MM(-981.664,-1251.58,32.396)
        self:MM(-997.616,-239.066,271.875)
        self:MM(32.7117,-1508.54,44.0126)
        self:Dictate()
        self:STP("Watch out for impostor melons!")
        return
    end
    if(mn=="ttt_lost_temple_b1") then --NOPE
        self:NOPE("Try ttt_lost_temple_v1")
        return
    end
    if(mn=="ttt_lost_temple_b2") then --NOPE
        self:NOPE("Try ttt_lost_temple_v1")
        return
    end
    if(mn=="ttt_lost_temple_v1") then
        self:MM(-249.721,-226.212,-1168.11)
        self:MM(230.518,454.795,-1383.8)
        self:MM(-900.246,1427.9,-1388.6)
        self:MM(-1230,1439.41,-1389.28)
        self:MM(-1113.61,2035.88,-1412.31)
        self:MM(1517.26,2314.7,-1412.14)
        self:MM(722.76,-1448.89,-1622.26)
        self:MM(791.654,900.668,-1405.1)
        self:MM(-78.304,-2706.64,-1374.53)
        self:MM(-397.854,-2709.18,-1389.15)
        self:MM(803.896,-2138.22,-1355.4)
        self:MM(328.322,-2580.98,-1223.67)
        self:MM(3348.07,-973.079,-1394.2)
        self:MM(3771.09,8.74985,-1389.28)
        self:MM(1164.62,-592.343,-1346.28)
        self:Dictate()
        self:CleanTTT()
        self:STP("Eh, Citizen_001 is a pretty cool guy")
        self:STP("Makes awesome maps and doesn't afraid of nothing")
        return
    end
    if(mn=="dm_island17") then --NOPE
        self:NOPE("Try dm_island18b3")
        return
    end
    if(mn=="dm_island18b3") then
        self:MM(417.36,-165.249,47.7338)
        self:MM(99.1365,41.998,858.655)
        self:MM(96.0215,63.3936,1383.81)
        self:MM(240.183,1358.63,348.913)
        self:MM(-1186.59,1102.65,199.67)
        self:MM(-1926.12,1114.41,7.6026)
        self:MM(-2496.78,-959.09,-286.808)
        self:MM(-1441.14,-812.225,-312.306)
        self:MM(-2501.33,1518.49,-467.257)
        self:MM(-1933.54,1108.4,-228.291)
        self:Dictate()
        return
    end
    if(mn=="cs_assault") then
        self:MM(6654.89,3829.41,-568.118)
        self:MM(4613.81,5575.18,-838.88)
        self:MM(5366.71,4099.52,-776.319)
        self:MM(5973.48,7140.56,-500.668)
        self:MM(5946.75,7005.04,-504.276)
        self:MM(5800.46,7037.4,-504.214)
        self:MM(5838.5,7165.68,-503.715)
        self:MM(5885.23,7093.45,-504.521)
        self:MM(5775.6,5887.56,-823.353)
        self:MM(5639.69,5926.53,-600.274)
        self:MM(6103.53,6012.15,-600.282)
        self:MM(5508,7054.39,-615.827)
        self:MM(7352.64,5140.64,-391.026)
        self:Dictate()
        self:STP("Get your urban ninja on!")
        return
    end
    if(mn=="cs_compound") then
        self:MM(1234.95,1548.77,55.9445)
        self:MM(1350.89,1400.03,62.0494)
        self:MM(1632.55,1383.57,65.4113)
        self:MM(1729.07,1339.96,59.0172)
        self:MM(1142.93,1003.43,57.2011)
        self:MM(316.634,72.6003,30.8745)
        self:MM(1907.03,432.528,73.7516)
        self:MM(1765.03,-405.814,26.5609)
        self:MM(2925.59,-1239.49,57.8355)
        self:MM(2684.16,-1454.02,61.0845)
        self:MM(2329.19,-1852.97,64.2301)
        self:MM(1893.48,-1601.21,23.7266)
        self:MM(528.504,-802.269,265.213)
        self:MM(1727.52,834.297,7.85925)
        self:MM(2541.19,-543.268,7.21307)
        self:Dictate()
        return
    end
    if(mn=="cs_italy") then
        self:MM(899.155,2293.62,7.75715)
        self:MM(1005.56,2299.45,200.822)
        self:MM(594.447,1366.85,55.7135)
        self:MM(-707.877,2050.96,-144.282)
        self:MM(-1216.16,1858.59,-115.771)
        self:MM(-1047.78,-1259.84,-48.2925)
        self:MM(-437.999,-89.5119,-144.27)
        self:MM(448.301,-277.889,-118.276)
        self:MM(191.99,431.887,-79.7895)
        self:MM(-894.276,1534.42,144.036)
        self:Dictate()
        self:STP("Beware of shamwo... er, melon imitators!")
        return
    end
    if(mn=="cs_office") then
        self:MM(1351.9,-325.881,-152.057)
        self:MM(1609.67,820.466,-152.233)
        self:MM(-385.327,590.048,-127.33)
        self:MM(-766.895,1139.39,-274.768)
        self:MM(-846.803,165.789,-360.405)
        self:MM(-1680.08,-583.391,-232.286)
        self:MM(-273.056,-1855.14,-201.53)
        self:MM(377.858,-1425.32,-43.82)
        self:MM(741.515,-204.865,-120.258)
        self:MM(525.815,42.8707,-127.689)
        self:Dictate()
        return
    end
    if(mn=="de_dust") then self:CVSN(2) return end
    if(mn=="de_dust2") then
        self:MM(1784.47,1801.02,67.0261)
        self:MM(377.014,2736.24,142.592)
        self:MM(136.35,-55.3456,14.1389)
        self:MM(-483,-152.43,72.1102)
        self:MM(-1513.16,682.734,57.5915)
        self:MM(-1955.17,550.849,39.741)
        self:MM(-2096.69,3227.46,136.044)
        self:MM(-1152.52,2057.63,46.93)
        self:MM(749.359,695.568,7.87043)
        self:MM(-561.245,1241.98,88.4591)
        self:Dictate()
        return
    end
    if(mn=="gm_freecity_plaza") then
        self:MM(467.96,-1520.44,-920.246)
        self:MM(-109.555,-1374.24,-920.279)
        self:MM(1543.93,-1212.26,-888.171)
        self:MM(232.638,-635.702,-960.273)
        self:MM(-157.777,502.993,-1016.25)
        self:MM(-1247.94,1437.57,-888.262)
        self:MM(-482.053,1906.33,-572.28)
        self:MM(754.128,1566.76,-1005.42)
        self:MM(424.6,3236.35,38.7191)
        self:MM(848.802,3879.19,-784.142)
        self:MM(190.845,4234.9,-729.295)
        self:MM(137.131,4680.19,-743.272)
        self:MM(193.189,4680.42,-743.866)
        self:MM(3633.45,3511.06,-760.269)
        self:MM(3714.22,3455.2,-760.28)
        self:MM(3721.39,3546.95,-760.281)
        self:MM(6260.91,3764.54,-920.288)
        self:MM(7805.89,5800.41,-1079.6)
        self:MM(6972.89,6244.37,-1032.3)
        self:MM(5962.91,5776.05,-877.259)
        self:MM(5836.07,5756.57,-801.207)
        self:MM(5745.51,5843.13,-737.876)
        self:MM(4044.62,6900.33,263.719)
        self:MM(2653.74,8318.84,-732.687)
        self:MM(254.739,11239.6,-1016.26)
        self:MM(-687.729,6585.17,-248.281)
        self:MM(-736.042,6589.56,-248.281)
        self:MM(-712.776,6636.45,-248.273)
        self:MM(490.165,6588.42,-120.384)
        self:MM(-748.715,6976.36,71.7342)
        self:REQ("Cysero")
        self:Dictate()
        return
    end
    if(mn=="freespace06_v2-1") then
        self:MM(1013.19,-10496.9,-1288.29)
        self:MM(-6746.4,7462.42,-3640.26)
        self:MM(3184.14,12072,-4416.25)
        self:MM(10077.7,5203.33,-4157.43)
        self:MM(4.2803,-4705.3,-4496.27)
        self:MM(-1389.06,-1020.49,-4232.28)
        self:MM(-1818.76,37.8,-3984.24)
        self:MM(1097.06,-1431.37,-4232.27)
        self:MM(1283.75,-1719.77,-3200.29)
        self:MM(2305.87,-1133.98,-3864.28)
        self:MM(2095.34,-79.3697,-4232.27)
        self:MM(2966.74,-1.76525,-3608.28)
        self:MM(1490.21,1733.05,-3976.27)
        self:MM(702.585,2243.4,-3976.29)
        self:MM(584.75,2085.21,-3720.18)
        self:MM(-1039.54,1944.75,-3720.23)
        self:REQ("Daolpu")
        self:Dictate()
        return
    end
    if(mn=="gm_ps_hugeflatconstruct_svn") then
        self:MM(13532.8,-4016.89,-43.287)
        self:MM(10765.3,-7803.8,37.6848)
        self:MM(9554.09,-4524.22,-46.1912)
        self:MM(4597.92,5710.94,382.154)
        self:MM(8733.4,3529.25,-46.2612)
        self:MM(7509.8,-577.976,-46.2593)
        self:MM(4618.4,526.244,-46.2612)
        self:MM(1521.98,-865.757,-46.2808)
        self:MM(-680.714,2771.43,-50.2132)
        self:MM(-8864.3,-506.435,-71.434)
        self:MM(-9837.81,-517.148,24.7274)
        self:MM(-11281.2,-6713.78,-44.2623)
        self:MM(-13553.9,-3391.05,-72.7413)
        self:MM(-8556.06,2870.28,-71.2193)
        self:MM(-5433.99,-4364.83,-70.1321)
        self:REQ("Dr.HAX! [RUS]")
        self:Dictate()
        return
    end
    if(mn=="gm_minecraft") then
        self:MM(-828.648,872.637,55.7391)
        self:MM(1032.38,-474.848,103.824)
        self:MM(1053.43,-985.013,103.963)
        self:MM(-1412.96,-2929.03,199.729)
        self:MM(566.165,-1539.07,391.732)
        self:MM(-1649.81,1204.05,103.739)
        self:MM(-1572.99,1192.78,103.721)
        self:MM(-1575.13,1131.94,103.737)
        self:MM(-1574.83,1074.56,103.716)
        self:MM(-1664.61,1075.14,103.72)
        self:MM(283.375,1449.85,55.7191)
        self:MM(230.416,1447.48,55.7242)
        self:MM(-558.547,-1110.99,919.74)
        self:MM(-2155.78,-1511.66,679.72)
        self:MM(32.3488,148.193,-40.2898)
        self:REQ("garrusdg the hunter")
        self:STP("I love me some minecraft.")
        self:Dictate()
        return
    end
    if(mn=="gm_mobenix_v3_final") then
        self:MM(-9096.93,-2715.29,10380.7)
        self:MM(4064.29,-12312,81.7356)
        self:MM(6849.57,-4418.04,-222.281)
        self:MM(12537.6,-10514.7,65.7423)
        self:MM(10004.9,-10159.7,-176.287)
        self:MM(12003.1,-8634.53,-221.274)
        self:MM(15222,-8343.36,-587.89)
        self:MM(15053.7,-8220.63,-561.755)
        self:MM(2450.78,1646.83,-294.779)
        self:MM(9590.7,8590.04,-435.931)
        self:MM(6833.24,8711.96,-44.2836)
        self:MM(1694.43,9277.83,743.814)
        self:MM(-689.997,13059.4,894.099)
        self:MM(-502.977,9440.92,777.757)
        self:MM(-1439.63,3102.83,299.74)
        self:REQ("Guntz")
        self:STP("Ohgod this map is huge")
        self:Dictate()
        return
    end
    if(mn=="de_inferno") then
        self:MM(1938.06,2217.6,160.957)
        self:MM(1441.46,2945.57,167.84)
        self:MM(353.259,2803.9,181.62)
        self:MM(178.882,3132.48,280.821)
        self:MM(711.194,1837.32,243.499)
        self:MM(31.3185,1424.62,109.907)
        self:MM(275.375,518.597,28.1712)
        self:MM(727.831,677.067,120.15)
        self:MM(775.781,678.013,120.13)
        self:MM(1751.79,1479.69,189.732)
        self:MM(1824,1805.85,296.474)
        self:MM(2709.68,1278.85,167.779)
        self:MM(2681.13,1277.74,184.651)
        self:MM(2032.39,530.674,194.711)
        self:MM(1910.15,-528.864,119.91)
        self:MM(1064.47,263.588,214.197)
        self:MM(1141.96,-168.302,263.818)
        self:MM(1115.12,-507.917,282.032)
        self:MM(786.906,-519.497,103.736)
        self:MM(936.001,138.663,263.589)
        self:MM(-1276.82,576.194,-9.13214)
        self:MM(-1191.03,303.488,19.554)
        self:MM(-1051.1,593.717,35.7029)
        self:MM(-1614.32,718.787,-39.4734)
        self:MM(-84.4028,434.042,112.386)
        self:MM(95.199,6.81512,210.986)
        self:MM(-97.1988,210.364,189.736)
        self:MM(-601.96,-600.782,240.001)
        self:MM(-489.074,328.297,209.255)
        self:MM(1303.87,-114.171,135.789)
        self:REQ("Loli The Dasher")
        self:Dictate()
        self:STP("Are you ready to take on the INFERNO?")
        return
    end
    if(mn=="de_school") then
        self:MM(-414.561,1188.6,-0.274251)
        self:MM(238.846,1070.52,84.3195)
        self:MM(-1110.5,1056.32,83.7308)
        self:MM(-942.263,-713.838,100.41)
        self:MM(-497.775,-481.458,0.747046)
        self:MM(538.64,-684.745,45.673)
        self:MM(996.552,-844.774,84.0136)
        self:MM(1148.21,-765.889,95.1868)
        self:MM(1221.96,-321.886,123.374)
        self:MM(1400.09,-339.2,121.751)
        self:MM(1622.3,-735.158,11.7213)
        self:MM(1718.74,-5.46245,125.325)
        self:MM(883.204,616.621,84.712)
        self:MM(747.753,-267.149,-0.31035)
        self:MM(-874.735,-785.085,291.419)
        self:MM(-664.604,-894.57,237.167)
        self:MM(1074.35,-863.981,266.678)
        self:MM(1918.87,560.298,368.365)
        self:MM(-867.087,-700.089,364.821)
        self:MM(-666.992,-868.14,376.701)
        self:MM(692.725,-269.922,402.715)
        self:MM(1244.15,99.2813,501.717)
        self:MM(-1208.46,-1492.96,352.158)
        self:MM(-821.77,-558.99,-112.265)
        self:MM(60.6963,1355.17,266.199)
        self:REQ("Eli Vance (NINJA)")
        self:Dictate()
        self:STP("This school won't be easy.")
        return
    end
    if(mn=="gm_supersizeroom_v1") then self:CVSN(2) return end
    if(mn=="gm_supersizeroom_v2") then
        self:MM(-3524.56,-3050.92,3783.71)
        self:MM(4129,334.762,103.72)
        self:MM(5023.12,-3026.52,71.7173)
        self:MM(-2377.88,-2816.47,71.7222)
        self:MM(-859.973,2922.68,711.727)
        self:MM(485.815,2833.82,2247.73)
        self:MM(-3552.17,1875.62,359.718)
        self:MM(-1327.65,6620.46,1371.81)
        self:MM(-2481.39,4522.41,1735.73)
        self:MM(-2551.54,4519.07,1735.72)
        self:MM(-2749.34,4391.93,1735.71)
        self:MM(-3651.81,8552.97,3015.71)
        self:MM(-3694.51,8663.12,2727.73)
        self:MM(9315.92,10269.6,1543.73)
        self:MM(6123.02,10254,697.821)
        self:MM(9349.96,7011.02,3015.89)
        self:MM(8082.28,-1516.68,-2023.55)
        self:MM(1042.79,284.879,-14264.3)
        self:MM(254.443,287.753,-14264.3)
        self:MM(-509.728,275.77,-14264.3)
        self:REQ("Bubbachrissy")
        self:Dictate()
        self:STP("Wow, this map is huge! Makes me feel small.")
        return
    end
    --End Checks for Maps
    
    self:STP("This map is not supported!")
    self:STP("If you want it to be, post on the discussion at https://steamcommunity.com/workshop/filedetails/discussion/1550747990/1640918469764902737/")
    self:STP("Make sure you give me the exact name of the map, and a workshop link if it has one!")
    self:STP("You'll get credit for the suggestion!")
    self:Remove()
end

function ENT:STP(str)
    for k, v in pairs(player.GetAll()) do
        v:ChatPrint(str)
    end
end

function ENT:REQ(str)
    self:STP("This map was requested by "..str.."!")
end
function ENT:NOPE(str)
    self:STP(str)
    if(timer.Exists("checksolvetimerCW")) then
        timer.Destroy("checksolvetimerCW")
    end
end

function ENT:CVSN(num)
    self:STP("Try using version "..num.." of this map.")
    if(timer.Exists("checksolvetimerCW")) then
        timer.Destroy("checksolvetimerCW")
    end
end

function ENT:MM(a,b,c)
    self:MakeMelon(Vector(a,b,c))
end

function ENT:MakeMelon(pos)
    local melo = ents.Create("melon_cw")
    melo:SetPos(pos)
    melo:SetAngles(Angle(0,0,0))
    melo:Spawn()
    melo:Activate()
    melo:GetPhysicsObject():Sleep()
end

function ENT:Dictate()
    self:STP("You need to find "..totalmelonsCW.." melons!")
end

function ENT:UnlockDoors()
    for k,v in pairs(ents.FindByClass("prop_door_rotating")) do
        v:Fire("Unlock",0,0)
    end
end

function ENT:CleanTTT()
    --Oh TTT, you so crazy
    --Weapons
    self:RemoveAllEnt("weapon_ttt_beacon")
    self:RemoveAllEnt("weapon_ttt_binoculars")
    self:RemoveAllEnt("weapon_ttt_c4")
    self:RemoveAllEnt("weapon_ttt_confgrenade")
    self:RemoveAllEnt("weapon_ttt_cse")
    self:RemoveAllEnt("weapon_ttt_decoy")
    self:RemoveAllEnt("weapon_ttt_defuser")
    self:RemoveAllEnt("weapon_ttt_flaregun")
    self:RemoveAllEnt("weapon_ttt_health_station")
    self:RemoveAllEnt("weapon_ttt_knife")
    self:RemoveAllEnt("weapon_ttt_m16")
    self:RemoveAllEnt("weapon_ttt_phammer")
    self:RemoveAllEnt("weapon_ttt_push")
    self:RemoveAllEnt("weapon_ttt_radio")
    self:RemoveAllEnt("weapon_ttt_sipistol")
    self:RemoveAllEnt("weapon_ttt_smokegrenade")
    self:RemoveAllEnt("weapon_ttt_stungun")
    self:RemoveAllEnt("weapon_ttt_teleport")
    self:RemoveAllEnt("weapon_ttt_unarmed")
    self:RemoveAllEnt("weapon_ttt_wtester")
    self:RemoveAllEnt("weapon_zm_carry")
    self:RemoveAllEnt("weapon_zm_improvised")
    self:RemoveAllEnt("weapon_zm_mac10")
    self:RemoveAllEnt("weapon_zm_molotov")
    self:RemoveAllEnt("weapon_zm_pistol")
    self:RemoveAllEnt("weapon_zm_revolver")
    self:RemoveAllEnt("weapon_zm_rifle")
    self:RemoveAllEnt("weapon_zm_shotgun")
    self:RemoveAllEnt("weapon_zm_sledge")
    --Items
    self:RemoveAllEnt("item_ammo_357_ttt")
    self:RemoveAllEnt("item_ammo_pistol_ttt")
    self:RemoveAllEnt("item_ammo_revolver_ttt")
    self:RemoveAllEnt("item_ammo_smg1_ttt")
    self:RemoveAllEnt("item_box_buckshot_ttt")
    self:RemoveAllEnt("ttt_random_ammo")
    self:RemoveAllEnt("ttt_random_weapon")
end

function ENT:RemoveAllEnt(str)
    for k,v in pairs(ents.FindByClass(str)) do
        v:Remove()
    end
end

function ENT:RemoveMelons()
    if(timer.Exists("checksolvetimerCW")) then
        timer.Remove("checksolvetimerCW")
    end
    for k, v in pairs(ents.FindByClass("melon_cw")) do
        v:Remove()
    end
    totalmelonsCW=-1
end

function ENT:OnRemove()
    if(self.THEONE) then
        isMelonControlSpawned=false
        self:RemoveMelons()
    end
end

function ENT:SpawnFunction( ply, tr )
 
    local ent = ents.Create( ClassName )
        ent:SetPos(Vector(0,0,0))
    ent:Spawn()
    ent:Activate()
    return ent
    
end

end--End of Controller Class


--Begin Melon Class
local MELON = {}

MELON.Type   = "anim"
MELON.Base             = "base_anim"
MELON.PrintName        = "Melon"
MELON.Author            = "Charles445"
MELON.Purpose            = "Oh shyt melon"
MELON.Done = false

if (SERVER) then

function MELON:Initialize()
    self:SetModel("models/props_junk/watermelon01.mdl")
    self.Entity:PhysicsInit(SOLID_VPHYSICS)
    self.Entity:SetMoveType(MOVETYPE_VPHYSICS)
    self.Entity:SetSolid(SOLID_VPHYSICS)
    self:SetColor(255, 255, 255, 255)
    self:UpTickMelon()

end

function MELON:DownTickMelon()
    totalmelonsCW = totalmelonsCW-1
end
function MELON:UpTickMelon()
    totalmelonsCW = totalmelonsCW+1
end

 function MELON:Use(activator, caller)
     if ( activator:IsValid() and activator:IsPlayer() ) then
        self:PlayASound()
        local tmcwl = totalmelonsCW-1
        if(tmcwl>1) then
            self:STP(""..tmcwl.." melons left.")
        end
        if(tmcwl==1) then
            self:STP("1 melon left!")
        end
         self:Remove()
    end
 end

 function MELON:STP(str)
    for k, v in pairs(player.GetAll()) do
        v:ChatPrint(str)
    end
end
 
function MELON:PlayASound()
    local num = math.random(1,5)
    if (num<=2) then
        self:EmitSound("physics/flesh/flesh_squishy_impact_hard1.wav", 100,100)
        return
    end
    if (num<=3) then
        self:EmitSound("physics/flesh/flesh_squishy_impact_hard2.wav", 100,100)
        return
    end
    if (num<=4) then
        self:EmitSound("physics/flesh/flesh_squishy_impact_hard3.wav", 100,100)
        return
    end
    if (num<=5) then
        self:EmitSound("physics/flesh/flesh_squishy_impact_hard4.wav", 100,100)
        return
    end
end
 
function MELON:OnRemove()
    self:DownTickMelon()
end

end --End of Server Then

scripted_ents.Register(MELON, "melon_cw") --End of Melon Class