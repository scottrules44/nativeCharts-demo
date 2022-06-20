local nativeCharts = require "plugin.nativeCharts"
local json = require "json"
local bg = display.newRect( display.contentCenterX, display.contentCenterY, display.actualContentWidth, display.actualContentHeight )
bg:setFillColor( 1,1,1 )

local title = display.newText( {text = "Native Charts", fontSize = 30} )
title.width, title.height = 300, 168
title.x, title.y = display.contentCenterX, 168*.5
title:setFillColor(0,1,0)

--Colors should be HTML colors


--Chart Callback
function chartCallback(event)
    if (event.data == "profitPart") then
        print("yay money")
    elseif (event.data == "lossesPart") then
        print("not the losses")
    elseif (event.data == "lossesPart") then
        print("not the losses")
    elseif (event.data == "mexicoBigNumber" or event.data == "bigNumber2020") then
        print("that is a high number")
    else
        print(json.encode(event))
    end

end

--Pie Chart
local pieChart = nativeCharts.newChart("pie", {listener=chartCallback,x = display.contentCenterX, y=display.contentCenterY,  width=200, height=200})

pieChart:setData({{colors={"#046681", "#337AFF"}, label="Cool Pie Chart", data={{value=20, label = "Profit", data="profitPart" }, {value=80, label="Losses", data="lossesPart" }}}})

pieChart:setProperties({pieHoleRadiusPercent=0, pieHoleColor="#ffffff", pieHoleVisible=false, rotation=190, enableRotation=false, pieShowPercentValue=true })-- radius between 0-1


--You can do these changes with any chart
pieChart.x, pieChart.y = 100, 100
pieChart.width, pieChart.height = 50, 50
pieChart:setProperties({enableInteraction = false, legendEnabled=false, legendFontSize=20, legendTextColor="#FF0000", backgroundColor="#FFFF00", chartDescription="My Test Chart"})


--[[
timer.performWithDelay(5000, function()
    pieChart:destroy()
end)
]]--


--Line Chart
--local lineChart = nativeCharts.newChart("line", {listener=chartCallback, x = display.contentCenterX, y=display.contentCenterY,  width=150, height=200})
--lineChart:setData({{color="#046681", lineWidth=2, circleColor="#09FF7D", label="Mexico", data={{x=20, y=20 }, {x=30, y=30}, {x=50, y=50, data="mexicoBigNumber" }}}, {color="#337AFF", lineWidth=1.5,  circleColor="#FF0909", label="USA", data={{x=10, y=10 }, {x=20, y=15}, {x=30, y=20 }}}})
--lineChart:setProperties({gridLines=false, pinchZoomEnabled=false, dragEnabled=false, enableRightAxisGridLines=false, setRightAxisLabelSize=20, setRightAxisLabelColor ="#337AFF", setRightAxisMin=2,setRightAxisMax=100, setRightAxisLabels={[20]="test1", [40]="test2", [60]="test3"}, enableLeftAxisGridLines=false, setLeftAxisLabelSize=20, setLeftAxisLabelColor ="#337AFF", setLeftAxisMin=2,setRightAxisMax=100, setLeftAxisLabels={[20]="test1", [40]="test2", [60]="test3"}   })

--Bar Chart
--local barChart = nativeCharts.newChart("bar", {listener=chartCallback, x = display.contentCenterX, y=display.contentCenterY,  width=150, height=200})


--barChart:setData({{color="#046681", barBorderWidth=2,formLineWidth=5, label="2020", data={{x=20, y=20 }, {x=30, y=30}, {x=40, y=50, data="bigNumber2020" }}}, {color="#FF0909", barBorderWidth=2,formLineWidth=5, label="2021", data={{x=22, y=30 }, {x=32, y=40}, {x=42, y=60 }}}})
--barChart:setProperties({gridLines=false, pinchZoomEnabled=false, dragEnabled=false, enableRightAxisGridLines=true, enableRightAxisLabels=true, setRightAxisLabelSize=8, setRightAxisLabelColor ="#337AFF", setRightAxisMin=2,setRightAxisMax=100, setRightAxisLabels={[20]="test1", [40]="test2", [60]="test3"}, enableLeftAxisGridLines=true, enableLeftAxisLabels=true,  setLeftAxisLabelSize=8, setLeftAxisLabelColor ="#337AFF", setLeftAxisMin=2,setRightAxisMax=100, setLeftAxisLabels={[20]="test1", [40]="test2", [60]="test3"}   })
