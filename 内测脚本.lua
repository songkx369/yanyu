function SearchWrite(Search, Write, Type)
    gg.clearResults()
    gg.setVisible(false)
    gg.searchNumber(Search[1][1], Type)
    local count = gg.getResultCount()
    local result = gg.getResults(count)
    gg.clearResults()
    local data = {}
    local base = Search[1][2]
    if (count > 0) then
        for i, v in ipairs(result) do
            v.isUseful = true
        end
        for k = 2, #Search do
            local tmp = {}
            local offset = Search[k][2] - base
            local num = Search[k][1]
            for i, v in ipairs(result) do
                tmp[#tmp + 1] = {}
                tmp[#tmp].address = v.address + offset
                tmp[#tmp].flags = v.flags
            end
            tmp = gg.getValues(tmp)
            for i, v in ipairs(tmp) do
                if (tostring(v.value) ~= tostring(num)) then
                    result[i].isUseful = false
                end
            end
        end
        for i, v in ipairs(result) do
            if (v.isUseful) then
                data[#data + 1] = v.address
            end
        end
        if (#data > 0) then
            gg.toast("注入成功")
            local t = {}
            local base = Search[1][2]
            for i = 1, #data do
                for k, w in ipairs(Write) do
                    offset = w[2] - base
                    t[#t + 1] = {}
                    t[#t].address = data[i] + offset
                    t[#t].flags = Type
                    t[#t].value = w[1]
                    if (w[3] == true) then
                        local item = {}
                        item[#item + 1] = t[#t]
                        item[#item].freeze = true
                        gg.addListItems(item)
                    end
                end
            end
            gg.setValues(t)
        else
            gg.toast("没有找到  喵呜~~", false)
            return false
        end
    else
        gg.toast("没有找到  喵呜~~")
        return false
    end
end
function SearchWrite(Search, Write, Type)
    gg.clearResults()
    gg.setVisible(false)
    gg.searchNumber(Search[1][1], Type)
    local count = gg.getResultCount()
    local result = gg.getResults(count)
    gg.clearResults()
    local data = {}
    local base = Search[1][2]
    if (count > 0) then
        for i, v in ipairs(result) do
            v.isUseful = true
        end
        for k = 2, #Search do
            local tmp = {}
            local offset = Search[k][2] - base
            local num = Search[k][1]
            for i, v in ipairs(result) do
                tmp[#tmp + 1] = {}
                tmp[#tmp].address = v.address + offset
                tmp[#tmp].flags = v.flags
            end
            tmp = gg.getValues(tmp)
            for i, v in ipairs(tmp) do
                if (tostring(v.value) ~= tostring(num)) then
                    result[i].isUseful = false
                end
            end
        end
        for i, v in ipairs(result) do
            if (v.isUseful) then
                data[#data + 1] = v.address
            end
        end
        if (#data > 0) then
            gg.toast("注入成功")
            local t = {}
            local base = Search[1][2]
            for i = 1, #data do
                for k, w in ipairs(Write) do
                    offset = w[2] - base
                    t[#t + 1] = {}
                    t[#t].address = data[i] + offset
                    t[#t].flags = Type
                    t[#t].value = w[1]
                    if (w[3] == true) then
                        local item = {}
                        item[#item + 1] = t[#t]
                        item[#item].freeze = true
                        gg.addListItems(item)
                    end
                end
            end
            gg.setValues(t)
        else
            gg.toast("没有找到  喵呜~~", false)
            return false
        end
    else
        gg.toast("没有找到  喵呜~~")
        return false
    end
end
function split(szFullString, szSeparator)
    local nFindStartIndex = 1
    local nSplitIndex = 1
    local nSplitArray = {}
    while true do
        local nFindLastIndex = string.find(szFullString, szSeparator, nFindStartIndex)
        if not nFindLastIndex then
            nSplitArray[nSplitIndex] = string.sub(szFullString, nFindStartIndex, string.len(szFullString))
            break
        end
        nSplitArray[nSplitIndex] = string.sub(szFullString, nFindStartIndex, nFindLastIndex - 1)
        nFindStartIndex = nFindLastIndex + string.len(szSeparator)
        nSplitIndex = nSplitIndex + 1
    end
    return nSplitArray
end
function xgxc(szpy, qmxg)
    for x = 1, #(qmxg) do
        xgpy = szpy + qmxg[x]["offset"]
        xglx = qmxg[x]["type"]
        xgsz = qmxg[x]["value"]
        gg.setValues({
            [1] = {
                address = xgpy,
                flags = xglx,
                value = xgsz
            }
        })
        xgsl = xgsl + 1
    end
end
function xqmnb(qmnb)
    gg.clearResults()
    gg.setRanges(qmnb[1]["memory"])
    gg.searchNumber(qmnb[3]["value"], qmnb[3]["type"])
    if gg.getResultCount() == 0 then
        gg.toast(qmnb[2]["name"] .. "开启失败")
    else
        gg.refineNumber(qmnb[3]["value"], qmnb[3]["type"])
        gg.refineNumber(qmnb[3]["value"], qmnb[3]["type"])
        gg.refineNumber(qmnb[3]["value"], qmnb[3]["type"])
        if gg.getResultCount() == 0 then
            gg.toast(qmnb[2]["name"] .. "开启失败")
        else
            sl = gg.getResults(999999)
            sz = gg.getResultCount()
            xgsl = 0
            if sz > 999999 then
                sz = 999999
            end
            for i = 1, sz do
                pdsz = true
                for v = 4, #(qmnb) do
                    if pdsz == true then
                        pysz = {}
                        pysz[1] = {}
                        pysz[1].address = sl[i].address + qmnb[v]["offset"]
                        pysz[1].flags = qmnb[v]["type"]
                        szpy = gg.getValues(pysz)
                        pdpd = qmnb[v]["lv"] .. ";" .. szpy[1].value
                        szpd = split(pdpd, ";")
                        tzszpd = szpd[1]
                        pyszpd = szpd[2]
                        if tzszpd == pyszpd then
                            pdjg = true
                            pdsz = true
                        else
                            pdjg = false
                            pdsz = false
                        end
                    end
                end
                if pdjg == true then
                    szpy = sl[i].address
                    xgxc(szpy, qmxg)
                    xgjg = true
                end
            end
            if xgjg == true then
                gg.toast(qmnb[2]["name"] .. "开启成功,共修改" .. xgsl .. "条ΔΘ")
            else
                gg.toast(qmnb[2]["name"] .. "开启失败")
            end
        end
    end
end

local Choice = gg.choice
local Toast = gg.toast
local IsVisible = gg.isVisible
local SetVisible = gg.setVisible
local Sleep = gg.sleep

local Main = 1 -- 标识符
local On = "[点击开启]"
local Off = "[点击关闭]"

local SwitchA1 = On 
local SwitchB1 = On
local SwitchC1 = On
local SwitchD1 = On
local SwitchE1 = On
local SwitchF1 = On
local SwitchG1 = On
local SwitchH1 = On
local SwitchI1 = On
local SwitchJ1 = On
local SwitchK1 = On
local SwitchA2 = On 
local SwitchB2 = On
local SwitchC2 = On
local SwitchD2 = On
local SwitchE2 = On
local SwitchF2 = On
local SwitchG2 = On
local SwitchH2 = On
local SwitchI2 = On
local SwitchJ2 = On
local SwitchK2 = On
local SwitchA3 = On 
local SwitchB3 = On
local SwitchC3 = On
local SwitchD3 = On
local SwitchE3 = On
local SwitchA4 = On 
local SwitchB4 = On
local SwitchC4 = On
local SwitchD4 = On
local SwitchE4 = On
local SwitchA5 = On 
local SwitchB5 = On
local SwitchC5 = On
local SwitchD5 = On
local SwitchE5 = On
local SwitchF5 = On
local SwitchA6 = On 
local SwitchB6 = On
local SwitchC6 = On
local SwitchD6 = On
local SwitchA7 = On 
local SwitchB7 = On
local SwitchC7 = On
local SwitchD7 = On
local SwitchE7 = On
local SwitchF7 = On
local SwitchG7 = On
local SwitchH7 = On
local SwitchA8 = On 
local SwitchB8 = On
local SwitchC8 = On
local SwitchD8 = On
local SwitchE8 = On
local SwitchF8 = On
local SwitchG8 = On
local SwitchH8 = On
local SwitchI8 = On
local SwitchJ8 = On

if IsVisible(true) then
    SetVisible(false)
end
        
function Main()
    menu = gg.choice({'秒杀', '娱乐', '日常', '交易', '门派是我家', '时间加速', '词条', '测试功能', '退出脚本'}, nil,
        '')
    if menu == 1 then
        A()
    end
    if menu == 2 then
        B()
    end
    if menu == 3 then
        C()
    end
    if menu == 4 then
        D()
    end
    if menu == 5 then
        E()
    end
    if menu == 6 then
        F()
    end
    if menu == 7 then
        G()
    end
    if menu == 8 then
        H()
    end
    if menu == 9 then
        gg.saveList(gg.getFile())
        os.exit()
    
    end
XGCK = -1
    end

function A()
    Menu = Choice({
    "基础拳法" .. SwitchA1,
    "药王经" .. SwitchB1,
    "罗汉拳法" .. SwitchC1,
    "韦陀棍法" .. SwitchD1, 
    "厉斩刀法" .. SwitchE1,
    "两仪剑法" .. SwitchF1,
    "太乙长拳" .. SwitchG1,
    "泠月剑法" .. SwitchH1,
    "瑶莲掌法" .. SwitchI1,
    "苍狼枪法" .. SwitchJ1,
    "返回上级" .. SwitchK1,
    }, nil, "")
    if Menu == 1 then
        Hack = "A1"
        if SwitchA1 == On then
            SwitchA1 = Off
            HackFunction(true)
        else
            SwitchA1 = On
            HackFunction(false)
        end

    elseif Menu == 2 then
        Hack = "B1"
        if SwitchB1 == On then
            SwitchB1 = Off
            HackFunction(true)
        else
            SwitchB1 = On
            HackFunction(false)
        end

    elseif Menu == 3 then
        Hack = "C1"
        if SwitchC1 == On then
            SwitchC1 = Off
            HackFunction(true)
        else
            SwitchC1 = On
            HackFunction(false)
        end
        
    elseif Menu == 4 then
        Hack = "D1"
        if SwitchD1 == On then
            SwitchD1 = Off
            HackFunction(true)
        else
            SwitchD1 = On
            HackFunction(false)
        end

    elseif Menu == 5 then
        Hack = "E1"
        if SwitchE1 == On then
            SwitchE1 = Off
            HackFunction(true)
        else
            SwitchE1 = On
            HackFunction(false)
        end

    elseif Menu == 6 then
        Hack = "F1"
        if SwitchF1 == On then
            SwitchF1 = Off
            HackFunction(true)
        else
            SwitchF1 = On
            HackFunction(false)
        end

    elseif Menu == 7 then
        Hack = "G1"
        if SwitchG1 == On then
            SwitchG1 = Off
            HackFunction(true)
        else
            SwitchG1 = On
            HackFunction(false)
        end

    elseif Menu == 8 then
        Hack = "H1"
        if SwitchH1 == On then
            SwitchH1 = Off
            HackFunction(true)
        else
            SwitchH1 = On
            HackFunction(false)
        end
        
    elseif Menu == 9 then
        Hack = "I1"
        if SwitchI1 == On then
            SwitchI1 = Off
            HackFunction(true)
        else
            SwitchI1 = On
            HackFunction(false)
        end
        
    elseif Menu == 10 then
        Hack = "J1"
        if SwitchJ1 == On then
            SwitchJ1 = Off
            HackFunction(true)
        else
            SwitchJ1 = On
            HackFunction(false)
        end
        
    elseif Menu == 11 then
        Hack = "K1"
        if SwitchK1 == On then
            SwitchK1 = Off
            HackFunction(true)
        else
            SwitchK1 = On
            HackFunction(false)
        end            
    end
    UIA = -1
end

function B()
    Menu = Choice({
    "功德" .. SwitchA2,
    "功勋" .. SwitchB2, 
    "体力" .. SwitchC2,
    "真气" .. SwitchD2,
    "状态" .. SwitchE2,
    "采集(地图禁止有傀儡)" .. SwitchF2,
    "宝箱" .. SwitchG2,
    "清除物品记录" .. SwitchH2,
    "清除迷雾" .. SwitchI2,
    "地图移速" .. SwitchJ2,
    "返回上级" .. SwitchK2,
    }, nil, "")
    if Menu == 1 then
        Hack = "A2"
        if SwitchA2 == On then
            SwitchA2 = Off
            HackFunction(true)
        else
            SwitchA2 = On
            HackFunction(false)
        end

    elseif Menu == 2 then
        Hack = "B2"
        if SwitchB2 == On then
            SwitchB2 = Off
            HackFunction(true)
        else
            SwitchB2 = On
            HackFunction(false)
        end

    elseif Menu == 3 then
        Hack = "C2"
        if SwitchC2 == On then
            SwitchC2 = Off
            HackFunction(true)
        else
            SwitchC2 = On
            HackFunction(false)
        end

    elseif Menu == 4 then
        Hack = "D2"
        if SwitchD2 == On then
            SwitchD2 = Off
            HackFunction(true)
        else
            SwitchD2 = On
            HackFunction(false)
        end

    elseif Menu == 5 then
        Hack = "E2"
        if SwitchE2 == On then
            SwitchE2 = Off
            HackFunction(true)
        else
            SwitchE2 = On
            HackFunction(false)
        end

    elseif Menu == 6 then
        Hack = "F2"
        if SwitchF2 == On then
            SwitchF2 = Off
            HackFunction(true)
        else
            SwitchF2 = On
            HackFunction(false)
        end

    elseif Menu == 7 then
        Hack = "G2"
        if SwitchG2 == On then
            SwitchG2 = Off
            HackFunction(true)
        else
            SwitchG2 = On
            HackFunction(false)
        end

    elseif Menu == 8 then
        Hack = "H2"
        if SwitchH2 == On then
            SwitchH2 = Off
            HackFunction(true)
        else
            SwitchH2 = On
            HackFunction(false)
        end
        
    elseif Menu == 9 then
        Hack = "I2"
        if SwitchI2 == On then
            SwitchI2 = Off
            HackFunction(true)
        else
            SwitchI2 = On
            HackFunction(false)
        end
    
    elseif Menu == 10 then
        Hack = "J2"
        if SwitchJ2 == On then
            SwitchJ2 = Off
            HackFunction(true)
        else
            SwitchJ2 = On
            HackFunction(false)
        end
        
    elseif Menu == 11 then
        Hack = "K2"
        if SwitchK2 == On then
            SwitchK2 = Off
            HackFunction(true)
        else
            SwitchK2 = On
            HackFunction(false)
        end    
    end
    UIB = -1
end

function C()
    Menu = Choice({
    "藏经阁" .. SwitchA3,
    "天刀矿洞" .. SwitchB3,
    "一键重置日常" .. SwitchC3,
    "九幽" .. SwitchD3,
    "返回上级" .. SwitchE3,
    }, nil, "")
    if Menu == 1 then
        Hack = "A3"
        if SwitchA3 == On then
            SwitchA3 = Off
            HackFunction(true)
        else
            SwitchA3 = On
            HackFunction(false)
        end

    elseif Menu == 2 then
        Hack = "B3"
        if SwitchB3 == On then
            SwitchB3 = Off
            HackFunction(true)
        else
            SwitchB3 = On
            HackFunction(false)
        end

    elseif Menu == 3 then
        Hack = "C3"
        if SwitchC3 == On then
            SwitchC3 = Off
            HackFunction(true)
        else
            SwitchC3 = On
            HackFunction(false)
        end

    elseif Menu == 4 then
        Hack = "D3"
        if SwitchD3 == On then
            SwitchD3 = Off
            HackFunction(true)
        else
            SwitchD3 = On
            HackFunction(false)
        end

    elseif Menu == 5 then
        Hack = "E3"
        if SwitchE3 == On then
            SwitchE3 = Off
            HackFunction(true)
        else
            SwitchE3 = On
            HackFunction(false)
        end                 
    end
    UIC = -1
end

function D()
    Menu = Choice({
    "刷新npc商店"..SwitchA4,
    "刷新鬼市"..SwitchB4,
    "npc元宝购买变成银子"..SwitchC4,
    "清空交易赎回的内容"..SwitchD4,
    "返回上级" .. SwitchE4,
    }, nil, "")
    if Menu == 1 then
        Hack = "A4"
        if SwitchA4 == On then
            SwitchA4 = Off
            HackFunction(true)
        else
            SwitchA4 = On
            HackFunction(false)
        end

    elseif Menu == 2 then
        Hack = "B4"
        if SwitchB4 == On then
            SwitchB4 = Off
            HackFunction(true)
        else
            SwitchB4 = On
            HackFunction(false)
        end

    elseif Menu == 3 then
        Hack = "C4"
        if SwitchC4 == On then
            SwitchC4 = Off
            HackFunction(true)
        else
            SwitchC4 = On
            HackFunction(false)
        end
        
    elseif Menu == 4 then
        Hack = "D4"
        if SwitchD4 == On then
            SwitchD4 = Off
            HackFunction(true)
        else
            SwitchD4 = On
            HackFunction(false)
        end
        
    elseif Menu == 5 then
        Hack = "E4"
        if SwitchE4 == On then
            SwitchE4 = Off
            HackFunction(true)
        else
            SwitchE4 = On
            HackFunction(false)
        end    
            
    end
    UID = -1
end

function E()
    Menu = Choice({
    "天刀"..SwitchA5,
    "苍狼"..SwitchB5,
    "太乙"..SwitchC5,
    "泠月"..SwitchD5,
    "少林"..SwitchE5,
    "返回上级" .. SwitchF5,
    }, nil, "")
    if Menu == 1 then
        Hack = "A5"
        if SwitchA5 == On then
            SwitchA5 = Off
            HackFunction(true)
        else
            SwitchA5 = On
            HackFunction(false)
        end

    elseif Menu == 2 then
        Hack = "B5"
        if SwitchB5 == On then
            SwitchB5 = Off
            HackFunction(true)
        else
            SwitchB5 = On
            HackFunction(false)
        end

    elseif Menu == 3 then
        Hack = "C5"
        if SwitchC5 == On then
            SwitchC5 = Off
            HackFunction(true)
        else
            SwitchC5 = On
            HackFunction(false)
        end

    elseif Menu == 4 then
        Hack = "D5"
        if SwitchD5 == On then
            SwitchD5 = Off
            HackFunction(true)
        else
            SwitchD5 = On
            HackFunction(false)
        end

    elseif Menu == 5 then
        Hack = "E5"
        if SwitchE5 == On then
            SwitchE5 = Off
            HackFunction(true)
        else
            SwitchE5 = On
            HackFunction(false)
        end

    elseif Menu == 6 then
        Hack = "F5"
        if SwitchF5 == On then
            SwitchF5 = Off
            HackFunction(true)
        else
            SwitchF5 = On
            HackFunction(false)
        end
    end
    UIE = -1
end

function F()
    Menu = Choice({
    "时间屏蔽(核心)"..SwitchA6,
    "签到领取"..SwitchB6,
    "重置签到"..SwitchC6,
    "返回上级" .. SwitchD6,
    }, nil, "")
    if Menu == 1 then
        Hack = "A6"
        if SwitchA6 == On then
            SwitchA6 = Off
            HackFunction(true)
        else
            SwitchA6 = On
            HackFunction(false)
        end

    elseif Menu == 2 then
        Hack = "B6"
        if SwitchB6 == On then
            SwitchB6 = Off
            HackFunction(true)
        else
            SwitchB6 = On
            HackFunction(false)
        end

    elseif Menu == 3 then
        Hack = "C6"
        if SwitchC6 == On then
            SwitchC6 = Off
            HackFunction(true)
        else
            SwitchC6 = On
            HackFunction(false)
        end

    elseif Menu == 4 then
        Hack = "D6"
        if SwitchD6 == On then
            SwitchD6 = Off
            HackFunction(true)
        else
            SwitchD6 = On
            HackFunction(false)
        end
    end
    UIF = -1
end

function G()
    Menu = Choice({
    "吸血-穿甲"..SwitchA7,
    "破招架-免伤"..SwitchB7,
    "聚气-破招架"..SwitchC7,
    "聚气-破闪避"..SwitchD7,
    "反伤-免伤"..SwitchE7,
    "棍法-剑法"..SwitchF7,
    "刀法-剑法"..SwitchG7,
    "返回上级" .. SwitchH7,
    }, nil, "")
    if Menu == 1 then
        Hack = "A7"
        if SwitchA7 == On then
            SwitchA7 = Off
            HackFunction(true)
        else
            SwitchA7 = On
            HackFunction(false)
        end

    elseif Menu == 2 then
        Hack = "B7"
        if SwitchB7 == On then
            SwitchB7 = Off
            HackFunction(true)
        else
            SwitchB7 = On
            HackFunction(false)
        end
        
    elseif Menu == 3 then
        Hack = "C7"
        if SwitchC7 == On then
            SwitchC7 = Off
            HackFunction(true)
        else
            SwitchC7 = On
            HackFunction(false)
        end
        
    elseif Menu == 4 then
        Hack = "D7"
        if SwitchD7 == On then
            SwitchD7 = Off
            HackFunction(true)
        else
            SwitchD7 = On
            HackFunction(false)
        end    
        
    elseif Menu == 5 then
        Hack = "E7"
        if SwitchE7 == On then
            SwitchE7 = Off
            HackFunction(true)
        else
            SwitchE7 = On
            HackFunction(false)
        end
        
    elseif Menu == 6 then
        Hack = "F7"
        if SwitchF7 == On then
            SwitchF7 = Off
            HackFunction(true)
        else
            SwitchF7 = On
            HackFunction(false)
        end
        
    elseif Menu == 7 then
        Hack = "G7"
        if SwitchG7 == On then
            SwitchG7 = Off
            HackFunction(true)
        else
            SwitchG7 = On
            HackFunction(false)
        end
        
    elseif Menu == 8 then
        Hack = "H7"
        if SwitchH7 == On then
            SwitchH7 = Off
            HackFunction(true)
        else
            SwitchH7 = On
            HackFunction(false)
        end    
    end
    UIG = -1
end

function H()
    Menu = Choice({
    "建筑加速(先行)"..SwitchA8,
    "单洗紫脉(开关都是紫)" .. SwitchB8,
    "傀儡采集,鬼市刷新(菜单-功能-返回服务器-进入游戏)" .. SwitchC8,
    "性别转换(女)"..SwitchD8,
    "性别转换(男)"..SwitchE8,
    "打乱序列" .. SwitchF8,
    "一视同仁" .. SwitchG8,
    "学武止境" .. SwitchH8,
    "混吃等死" .. SwitchI8,
    "返回上级" .. SwitchJ8,
    }, nil, "")
    if Menu == 1 then
        Hack = "A8"
        if SwitchA8 == On then
            SwitchA8 = Off
            HackFunction(true)
        else
            SwitchA8 = On
            HackFunction(false)
        end

    elseif Menu == 2 then
        Hack = "B8"
        if SwitchB8 == On then
            SwitchB8 = Off
            HackFunction(true)
        else
            SwitchB8 = On
            HackFunction(false)
        end
        
    elseif Menu == 3 then
        Hack = "C8"
        if SwitchC8 == On then
            SwitchC8 = Off
            HackFunction(true)
        else
            SwitchC8 = On
            HackFunction(false)
        end
        
    elseif Menu == 4 then
        Hack = "D8"
        if SwitchD8 == On then
            SwitchD8 = Off
            HackFunction(true)
        else
            SwitchD8 = On
            HackFunction(false)
        end    
        
    elseif Menu == 5 then
        Hack = "E8"
        if SwitchE8 == On then
            SwitchE8 = Off
            HackFunction(true)
        else
            SwitchE8 = On
            HackFunction(false)
        end    
        
    elseif Menu == 6 then
        Hack = "F8"
        if SwitchF8 == On then
            SwitchF8 = Off
            HackFunction(true)
        else
            SwitchF8 = On
            HackFunction(false)
        end    
        
    elseif Menu == 7 then
        Hack = "G8"
        if SwitchG8 == On then
            SwitchG8 = Off
            HackFunction(true)
        else
            SwitchG8 = On
            HackFunction(false)
        end    
        
    elseif Menu == 8 then
        Hack = "H8"
        if SwitchH8 == On then
            SwitchH8 = Off
            HackFunction(true)
        else
            SwitchH8 = On
            HackFunction(false)
        end    
        
    elseif Menu == 9 then
        Hack = "I8"
        if SwitchI8 == On then
            SwitchI8 = Off
            HackFunction(true)
        else
            SwitchI8 = On
            HackFunction(false)
        end        
    
    elseif Menu == 10 then
        Hack = "J8"
        if SwitchJ8 == On then
            SwitchJ8 = Off
            HackFunction(true)
        else
            SwitchJ8 = On
            HackFunction(false)
        end         
    end
    UIH = -1
end

function HackFunction(ToF)
        if Hack == "A1" then
        gg.setRanges(32)
        local dataType = 4
        local tb1 = {{20011, 0}, {20011, 48}, {20011, 72}, {-14, 4}, }
        local tb2 = {{0, 24}, {0, 360}, {9999999, 432}, {1, 664}, {1072693248, 764}, {1011, 928}, }
        local tb3 = {{9, 24}, {1, 360}, {56, 432}, {5, 664}, {1070596096, 764}, {201, 928}, }
        if ToF == true then
        SearchWrite(tb1, tb2, dataType)
        else
        SearchWrite(tb1, tb3, dataType)
        end

    elseif Hack == "B1" then
        gg.setRanges(32)
        local dataType = 4
        local tb1 = {{22033, 0}, {22033, 48}, {22033, 72}, {-14, 4}, }
        local tb2 = {{0, 24}, {0, 360}, {999999, 432}, }
        local tb3 = {{16, 24}, {2, 360}, {600, 432}, }
        if ToF == true then
        SearchWrite(tb1, tb2, dataType)
        else
        SearchWrite(tb1, tb3, dataType)
        end

    elseif Hack == "C1" then
        gg.setRanges(32)
        local dataType = 4
        local tb1 = {{21011, 0}, {210011, 48}, {21011, 72}, {-14, 4}, }
        local tb2 = {{0, 24}, {0, 360}, {9999999, 432}, }
        local tb3 = {{9, 24}, {2, 360}, {180, 432}, }
        if ToF == true then        
        SearchWrite(tb1, tb2, dataType)
        else
        SearchWrite(tb1, tb3, dataType)
        end

    elseif Hack == "D1" then
        gg.setRanges(32)
        local dataType = 4
        local tb1 = {{21021, 0}, {21021, 48}, {21021, 72}, {-14, 4}, }
        local tb2 = {{0, 24}, {0, 360}, {9999999, 496}, }
        local tb3 = {{9, 24}, {2, 360}, {215, 496}, }
        if ToF == true then        
        SearchWrite(tb1, tb2, dataType)
        else
        SearchWrite(tb1, tb3, dataType)
        end

    elseif Hack == "E1" then
        gg.setRanges(32)
        local dataType = 4
        local tb1 = {{21511, 0}, {21511, 24}, {21511, 168}, {-14, 4}, }
        local tb2 = {{0, -24}, {0, 312}, {9999999, 384}, }
        local tb3 = {{12, -24}, {2, 312}, {250, 384}, }
        if ToF == true then        
        SearchWrite(tb1, tb2, dataType)
        else
        SearchWrite(tb1, tb3, dataType)
        end

    elseif Hack == "F1" then
        gg.setRanges(32)
        local dataType = 4
        local tb1 = {{21341, 0}, {21341, 48}, {21341, 72}, {-14, 4}, }
        local tb2 = {{0, 24}, {0, 360}, {9999999, 432}, }
        local tb3 = {{8, 24}, {2, 360}, {240, 432}, }
        if ToF == true then
        SearchWrite(tb1, tb2, dataType)
        else
        SearchWrite(tb1, tb3, dataType)
        end

    elseif Hack == "G1" then
        gg.setRanges(32)
        local dataType = 4
        local tb1 = {{21311, 0}, {21311, 48}, {21311, 72}, {-14, 4}, }
        local tb2 = {{0, 24}, {0, 360}, {9999999, 432}, }
        local tb3 = {{9, 24}, {2, 360}, {180, 432}, }
        if ToF == true then
        SearchWrite(tb1, tb2, dataType)
        else
        SearchWrite(tb1, tb3, dataType)
        end

    elseif Hack == "H1" then
        gg.setRanges(32)
        local dataType = 4
        local tb1 = {{21411, 0}, {21411, 48}, {21411, 72}, {-14, 4}, }
        local tb2 = {{0, 24}, {0, 360}, {9999999, 1672}, }
        local tb3 = {{8, 24}, {2, 360}, {240, 1672}, }
        if ToF == true then        
        SearchWrite(tb1, tb2, dataType)
        else
        SearchWrite(tb1, tb3, dataType)
        end

    elseif Hack == "I1" then
        gg.setRanges(32)
        local dataType = 4
        local tb1 = {{21441, 0}, {21441, 48}, {21441, 72}, {-14, 4}, }
        local tb2 = {{0, 24}, {0, 360}, {9999999, 432}, }
        local tb3 = {{9, 24}, {2, 360}, {200, 432}, }
        if ToF == true then      
        SearchWrite(tb1, tb2, dataType)
        else
        SearchWrite(tb1, tb3, dataType)
        end
    
    elseif Hack == "J1" then
        gg.setRanges(32)
        local dataType = 4
        local tb1 = {{21611, 0}, {21611, 48}, {21611, 72}, {-14, 4}, }
        local tb2 = {{0, 24}, {0, 360}, {9999999, 432}, }
        local tb3 = {{10, 24}, {2, 360}, {230, 432}, }
        if ToF == true then       
        SearchWrite(tb1, tb2, dataType)
        else
        SearchWrite(tb1, tb3, dataType)
end
                
    elseif Hack == "K1" then
        if ToF == true then
            Main()
        end
        
    elseif Hack == "A2" then 
        if ToF == true then 
        gg.setRanges(32)
        local dataType = 4
        local tb1 = {{3738, 0}, {-5, 12}, {59, -28}, {42, -24}, }
        local tb2 = {{3042, 0}, }
        SearchWrite(tb1, tb2, dataType)
        end

    elseif Hack == "B2" then
        if ToF == true then
        gg.setRanges(32)
        local dataType = 4
        local tb1 = {{3762, 0}, {-5, 12}, {59, -28}, {42, -24}, }
        local tb2 = {{3042, 0}, }
        SearchWrite(tb1, tb2, dataType)
        end

    elseif Hack == "C2" then
        if ToF == true then 
        gg.setRanges(32)
        local dataType = 4
        local tb1 = {{1919249989, 0}, {1767143783, 4}, {10, -4}, }
        local tb2 = {{0, 0}, {0, 4}, {0, 8}, {0, -4}, }
        SearchWrite(tb1, tb2, dataType)
        end

    elseif Hack == "D2" then
        if ToF == true then 
        gg.setRanges(32)
        local dataType = 4
        local tb1 = {{1852139610, 0}, {1767139665, 4}, {10, -4}, }
        local tb2 = {{0, 0}, {0, 4}, {0, 8}, {0, -4}, }
        SearchWrite(tb1, tb2, dataType)
end    

    elseif Hack == "E2" then
        if ToF == true then 
        gg.setRanges(32)
        local dataType = 4
        local tb1 = {{2037672259, 0}, {1717990722, 4}, {9, -4}, }
        local tb2 = {{0, 0}, {0, 4}, {0, 8}, {0, -4}, }
        SearchWrite(tb1, tb2, dataType)
        end

    elseif Hack == "F2" then
        if ToF == true then 
        gg.setRanges(32)
        local dataType = 4
        local tb1 = {{1851880779, 0}, {6, -4}, }
        local tb2 = {{0, 0}, {0, 4}, {0, -4}, }
        SearchWrite(tb1, tb2, dataType)
        end

    elseif Hack == "G2" then
        if ToF == true then 
        gg.setRanges(32)
        local dataType = 4
        local tb1 = {{1919118917, 0}, {1953460325, 8}, {13, -4}, }
        local tb2 = {{0, 0}, {0, 4}, {0, 8}, {0, 12}, {0, -4}, }
        SearchWrite(tb1, tb2, dataType)
        end
    
    elseif Hack == "H2" then
        if ToF == true then 
        gg.setRanges(32)
        local dataType = 4
        local tb1 = {{1953724755, 0}, {1867279717, 4}, {9, -4}, }
        local tb2 = {{0, 0}, {0, 4}, {0, -4}, }
        SearchWrite(tb1, tb2, dataType)
        end
    
    elseif Hack == "I2" then
        if ToF == true then 
        gg.setRanges(32)
        local dataType = 4
        local tb1 = {{1937008994, 0}, {4, -4}, }
        local tb2 = {{0, 0}, {0, -4}, }
        SearchWrite(tb1, tb2, dataType)
        end  
     
    elseif Hack == "J2" then
        gg.setRanges(32)
        local dataType = 4
        local tb1 = {{1702260557, 0}, {1701146707, 4}, {100, 8}, {9, -4}, }
        local tb2 = {{1919249989, 0}, {31079, 4}, {6, -4}, }
        local tb3 = {{0, 0}, }
        if ToF == true then 
        SearchWrite(tb1, tb3, dataType)
        gg.sleep(100)
        SearchWrite(tb2, tb1, dataType)
        end                       
            
    elseif Hack == "K2" then
        if ToF == true then
            Main()
        end
    
    elseif Hack == "A3" then
        gg.setRanges(32)
        local dataType = 4
        local tb1 = {{1601009006, 0}, {1245929324, 8}, {13, -4}, }
        local tb2 = {{0, 0}, {0, 4}, {0, 8}, {0, 12}, {0, -4}, }
        if ToF == true then     
        SearchWrite(tb1, tb2, dataType)
        else
        SearchWrite(tb1, tb2, dataType)
        end
    
    elseif Hack == "B3" then
        gg.setRanges(32)
        local dataType = 4
        local tb1 = {{1683973236, 0}, {1970235241, 4}, {9, -4}, }
        local tb2 = {{0, 8}, }
        local tb3 = {{116, 8}, }
        if ToF == true then 
        SearchWrite(tb1, tb2, dataType)
        gg.sleep(500)
        SearchWrite(tb1, tb3, dataType)
        else
        SearchWrite(tb1, tb2, dataType)
        gg.sleep(500)
        SearchWrite(tb1, tb3, dataType)
        end
        
    elseif Hack == "C3" then
        if ToF == true then 
        gg.setRanges(32)
        local dataType = 4
        local tb1 = {{1702061394, 0}, {8, -4}, }
        local tb2 = {{0, 0}, {0, 4}, {0, -4}, }
        SearchWrite(tb1, tb2, dataType)
        end
        
    elseif Hack == "D3" then
        gg.setRanges(32)
        local dataType = 4
        local tb1 = {{1601467255, 0}, {1918989427, 4}, {9, -4}, }
        local tb2 = {{0, 8}, }
        local tb3 = {{116, 8}, }
        if ToF == true then 
        SearchWrite(tb1, tb2, dataType)
        gg.sleep(500)
        SearchWrite(tb1, tb3, dataType)
        else
        SearchWrite(tb1, tb2, dataType)
        gg.sleep(500)
        SearchWrite(tb1, tb3, dataType)
        end    
                                
    elseif Hack == "E3" then
        if ToF == true then
            Main()
        end
       
    elseif Hack == "A4" then
        if ToF == true then 
        gg.setRanges(32)
        local dataType = 4
        local tb1 = {{1919118917, 0}, {1400139897, 4}, {11, -4}, }
        local tb2 = {{0, 0}, {0, 4}, {0, 8}, {0, -4}, }
        SearchWrite(tb1, tb2, dataType)
        end
        
    elseif Hack == "B4" then
        gg.setRanges(32)
        local dataType = 4
        local tb1 = {{1702458690, 0}, {5, -4}, }
        local tb2 = {{0, 4}, }
        local tb3 = {{100, 4}, }
        if ToF == true then 
        SearchWrite(tb1, tb2, dataType)
        gg.sleep(500)
        SearchWrite(tb1, tb3, dataType)
        else
        SearchWrite(tb1, tb2, dataType)
        gg.sleep(500)
        SearchWrite(tb1, tb3, dataType)
        end    

    elseif Hack == "C4" then
        if ToF == true then 
        gg.setRanges(32)
        local dataType = 4
        local tb1 = {{1684828007, 0}, {4, -4}, }
        local tb2 = {{1701736301, 0}, {121, 4}, {5, -4}, }
        SearchWrite(tb1, tb2, dataType)
        end    
    
    elseif Hack == "D4" then
        if ToF == true then 
        gg.setRanges(32)
        local dataType = 4
        local tb1 = {{1819043155, 0}, {25701, 4}, {6, -4}, }
        local tb2 = {{0, 0}, {0, 4}, {0, -4}, }
        SearchWrite(tb1, tb2, dataType)
        end                          

    elseif Hack == "E4" then
        if ToF == true then
            Main()
        end

    elseif Hack == "A5" then
        if ToF == true then 
        gg.setRanges(32)
        local dataType = 4
        local tb1 = {{1701669236, 0}, {1634301023, 8}, {16, -4}, }
        local tb2 = {{0, 0}, {0, 4}, {0, 8}, {0, 12}, {0, -4}, }
        SearchWrite(tb1, tb2, dataType)
        end

    elseif Hack == "B5" then
        if ToF == true then 
        gg.setRanges(32)
        local dataType = 4
        local tb1 = {{1701669236, 0}, {1851876191, 8}, {17, -4}, }
        local tb2 = {{0, 0}, {0, 4}, {0, 8}, {0, 12}, {0, 16}, {0, -4}, }
        SearchWrite(tb1, tb2, dataType)
        end

    elseif Hack == "C5" then
        if ToF == true then 
        gg.setRanges(32)
        local dataType = 4
        local tb1 = {{1701669236, 0}, {1767986271, 8}, {14, -4}, }
        local tb2 = {{0, 0}, {0, 4}, {0, 8}, {0, 12}, {0, -4}, }
        SearchWrite(tb1, tb2, dataType)
        end

    elseif Hack == "D5" then
        if ToF == true then 
        gg.setRanges(32)
        local dataType = 4
        local tb1 = {{1701669236, 0}, {1852402783, 8}, {16, -4}, }
        local tb2 = {{0, 0}, {0, 4}, {0, 8}, {0, 12}, {0, -4}, }
        SearchWrite(tb1, tb2, dataType)
        end

    elseif Hack == "E5" then
        if ToF == true then 
        gg.setRanges(32)
        local dataType = 4
        local tb1 = {{1701669236, 0}, {1634235231, 8}, {16, -4}, }
        local tb2 = {{0, 0}, {0, 4}, {0, 8}, {0, 12}, {0, -4}, }
        SearchWrite(tb1, tb2, dataType)
        end
        
    elseif Hack == "F5" then
        if ToF == true then
            Main()
        end
        
    elseif Hack == "A6" then
        gg.setRanges(32)
        local dataType = 4
        local tb1 = {{1634035779, 0}, {1735347316, 4}, {9, -4}, }
        local tb2 = {{1953718598, 0}, {1715561837, 8}, {15, -4}, }
        local tb3 = {{1869377621, 0}, {1767138401, 4}, {10, -4}, }
        local tb4 = {{1668246595, 0}, {1415935073, 8}, {15, -4}, }
        local tb5 = {{1818322258, 0}, {1701669204, 4}, {8, -4}, }
        local tb6 = {{0, 0}, {0, 4}, {0, 8}, {0, 12}, {0, -4}, }
        if ToF == true then       
        SearchWrite(tb1, tb6, dataType)
        gg.sleep(100)
        SearchWrite(tb2, tb6, dataType)
        gg.sleep(100)
        SearchWrite(tb3, tb6, dataType)
        gg.sleep(100)
        SearchWrite(tb4, tb6, dataType)
        gg.sleep(100)
        SearchWrite(tb5, tb6, dataType)
        end

    elseif Hack == "B6" then
        if ToF == true then 
        gg.setRanges(32)
        local dataType = 4
        local tb1 = {{1919510612, 0}, {1767143796, 4}, {10, -4}, }
        local tb2 = {{0, 0}, {0, 4}, {0, 8}, {0, -4}, }
        SearchWrite(tb1, tb2, dataType)
        end

    elseif Hack == "C6" then
        if ToF == true then 
        gg.setRanges(32)
        local dataType = 4
        local tb1 = {{1919510612, 0}, {1850308980, 4}, {11, -4}, }
        local tb2 = {{0, 0}, {0, 4}, {0, 8}, {0, -4}, }
        SearchWrite(tb1, tb2, dataType)
        end
        
    elseif Hack == "D6" then
        if ToF == true then
            Main()
        end

    elseif Hack == "A7" then
        if ToF == true then 
        gg.setRanges(32)
        local dataType = 4
        local tb1 = {{1869573218, 0}, {5, -4}, }
        local tb2 = {{1600546148, 0}, {7235433, 4}, {7, -4}, }
        SearchWrite(tb1, tb2, dataType)
        end
        
    elseif Hack == "B7" then
        if ToF == true then 
        gg.setRanges(32)
        local dataType = 4
        local tb1 = {{1885302640, 0}, {2037543521, 4}, {8, -4}, }
        local tb2 = {{1600613732, 0}, {6710895, 4}, {7, -4}, }
        SearchWrite(tb1, tb2, dataType)
        end
        
    elseif Hack == "C7" then
        if ToF == true then 
        gg.setRanges(32)
        local dataType = 4
        local tb1 = {{1650421869, 0}, {7037793, 4}, {7, -4}, }
        local tb2 = {{1885302640, 0}, {2037543521, 4}, {8, -4}, }
        SearchWrite(tb1, tb2, dataType)
        end
        
    elseif Hack == "D7" then
        if ToF == true then 
        gg.setRanges(32)
        local dataType = 4
        local tb1 = {{1650421869, 0}, {7037793, 4}, {7, -4}, }
        local tb2 = {{1683976048, 0}, {1701274735, 4}, {8, -4}, }
        SearchWrite(tb1, tb2, dataType)
        end
        
    elseif Hack == "E7" then
        if ToF == true then 
        gg.setRanges(32)
        local dataType = 4
        local tb1 = {{1600613732, 0}, {6710642, 8}, {7, -4}, }
        local tb2 = {{1600613732, 0}, {6710895, 4}, {7, -4}, }
        SearchWrite(tb1, tb2, dataType)
        end
        
    elseif Hack == "F7" then
        if ToF == true then 
        gg.setRanges(32)
        local dataType = 4
        local tb1 = {{1667855475, 0}, {1684103019, 4}, {9, -4}, }
        local tb2 = {{1919907699, 0}, {1684103012, 4}, {100, 8}, {9, -4}, }
        SearchWrite(tb1, tb2, dataType)
        end    
        
    elseif Hack == "G7" then
        if ToF == true then 
        gg.setRanges(32)
        local dataType = 4
        local tb1 = {{1684106338, 0}, {1684103013, 4}, {9, -4}, }
        local tb2 = {{1919907699, 0}, {1684103012, 4}, {100, 8}, {9, -4}, }
        SearchWrite(tb1, tb2, dataType)
        end        
        
    elseif Hack == "H7" then
        if ToF == true then
            Main()
        end
        
    elseif Hack == "A8" then
        if ToF == true then 
        gg.setRanges(32)
        local dataType = 4
        local tb1 = {{1415867973, 0}, {6647145, 4}, {7, -4}, }
        local tb2 = {{0, 0}, {0, 4}, {0, -4}, }
        SearchWrite(tb1, tb2, dataType)
        end
        
    elseif Hack == "B8" then
        gg.setRanges(32)
        local dataType = 4
        local tb1 = {{12299, 0}, {1076887552, 2408}, }
        local tb2 = {{1083127808, 1400}, }
        if ToF == true then
        SearchWrite(tb1, tb2, dataType)
        else
        SearchWrite(tb1, tb2, dataType)
        end  
        
    elseif Hack == "C8" then
        gg.setRanges(32)
        local dataType = 4
        local tb1 = {{1701669204, 0}, {4, -4}, }
        local tb2 = {{1314520, 0}, {4, -4}, }
        if ToF == true then 
        SearchWrite(tb1, tb2, dataType)
        gg.sleep(500)
        SearchWrite(tb2, tb1, dataType)
        else
        SearchWrite(tb1, tb2, dataType)
        gg.sleep(500)
        SearchWrite(tb2, tb1, dataType)
        end
        
    elseif Hack == "D8" then
        if ToF == true then 
        gg.setRanges(32)
        local dataType = 4
        local tb1 = {{12299, 0}, {1076887552, 2408}, }
        local tb2 = {{1073741824, 608}, }
        SearchWrite(tb1, tb2, dataType)
        end
        
    elseif Hack == "E8" then
        if ToF == true then 
        gg.setRanges(32)
        local dataType = 4
        local tb1 = {{12299, 0}, {1076887552, 2408}, }
        local tb2 = {{1072693248, 608}, }
        SearchWrite(tb1, tb2, dataType)
        end     
        
    elseif Hack == "F8" then
        if ToF == true then 
        gg.setRanges(32)
        local dataType = 4
        local tb1 = {{1701536077, 0}, {6581842, 4}, {7, -4}}
        local tb2 = {{0, 0}, {0, 4}, {0, -4}, }
        SearchWrite(tb1, tb2, dataType)
        end 
           
    elseif Hack == "G8" then
        if ToF == true then 
        gg.setRanges(32)
        local dataType = 4
        local tb1 = {{1852794947, 0}, {5, -4}}
        local tb2 = {{0, 0}, {0, 4}, {0, -4}, }
        SearchWrite(tb1, tb2, dataType)
        end        
        
    elseif Hack == "H8" then
        if ToF == true then 
        gg.setRanges(32)
        local dataType = 4
        local tb1 = {{1953718598, 0}, {4, -4}}
        local tb2 = {{1918985548, 0}, {1835619438, 4}, {101, 8}, {9, -4}, }
        SearchWrite(tb1, tb2, dataType)
        end    
        
    elseif Hack == "I8" then
        gg.setRanges(32)
        local dataType = 4
        local tb1 = {{1247900999, 0}, {5, -4}}
        local tb2 = {{0, 4}, }
        local tb3 = {{105, 4}, }
        if ToF == true then 
        SearchWrite(tb1, tb2, dataType)
        gg.sleep(500)
        SearchWrite(tb1, tb3, dataType)
        else
        SearchWrite(tb1, tb2, dataType)
        gg.sleep(500)
        SearchWrite(tb1, tb3, dataType)
        end
        
    elseif Hack == "J8" then
        if ToF == true then
            Main()
        end                            
    else
    end
end

-- 加载页面
Main()

-- GG隐藏或者可见
while true do
    if IsVisible(true) then
        SetVisible(false)
        XGCK = 1
    end
    Sleep(100)
    if XGCK == 1 then
        Main()
    end
end