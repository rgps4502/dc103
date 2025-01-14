-- startApp("com.linegames.dcglobal")
-- ========== Settings ================
Settings:setCompareDimension(true, 1080) --模擬器寬
Settings:setScriptDimension(true, 1080)
Settings:set('MinSimilarity', 0.8) --圖片精準度
-- Settings:autoGameArea(true) --導航條必須要有

-- =========區域=======
-- Region:highlight() -- 讓紅色框框出現 ex: night:highlight() 再調用一次消失
--PVP----------------------------
night = Region(531, 982, 200, 180) --點擊夜世界
pvp_night = Region(211, 918, 200, 180) --點擊夜世界pvp
pvp_refresh = Region(570, 445, 200, 180) --刷新對戰列表
pvp_auto_config = Region(570, 400, 200, 180) --自動對戰設定
pvp_start = Region(380, 1090, 180, 80) --確認
pvp_start1 = Region(470, 690, 180, 80) --pvp開始
pvp_no_ticket = Region(325, 694, 110, 80) --pvp票券不夠
pvp_over = Region(160, 878, 410, 40) --pvp結束
pvp_over1 = Region(91, 874, 539, 40) --pvp獎勵
pvp_over_2 = Region(328, 716, 100, 80) --pvp獎勵滿通知
reward = Region(560, 509, 120, 80) --pvp獎勵領取
reward1 = Region(167, 562, 400, 65) --pvp獎勵通知
reward_confirm = Region(460, 866, 120, 80) --pvp獎勵領取
reward_OK = Region(320, 800, 120, 80) --pvp獎勵確認
money_box = Region(926, 494, 150, 150) --買體力 點主畫面的箱子
touch_money = Region(273, 1829, 100, 100)
money_buy = Region(632, 1727, 156, 100)
----------------------------------------↑pvp

--練肥---------------------------
checkpoint = Region(588, 882, 200, 180) --點擊刷圖
pointnumber = Region(360, 235, 200, 180) --點擊4-6關卡
pointnumber2 = Region(0, 300, 700, 150) --點擊4-6-1關卡
fight_setting = Region(813, 499, 260, 120) --設定刷關
fight_setting_count = Region(517, 1153, 50, 65) --設定刷關
fight_start = Region(464, 1619, 160, 60) --設定刷關
food_full = Region(85, 947, 600, 40) --腳色滿
agate = Region(520, 920, 100, 50) --點擊獎盃
agate_point = Region(592, 984, 150, 80) --點選叫出瑪瑙按鈕
agate_2 = Region(264, 1156, 180, 80) --進入瑪瑙
choose = Region(568, 549, 80, 80) --選擇換成瑪瑙的腳色
choose_confirm = Region(276, 1157, 220, 180) -- 點擊確認
choose_ok = Region(474, 726, 40, 40) -- 點擊確認
agate_exit = Region(300, 1166, 110, 80) --離開瑪瑙
exit = Region(640, 23, 80, 80) --離開瑪瑙頁面
MXA30 = Region(166, 882, 30, 35) --肥料滿等通知
MXA_confirm = Region(318, 1000, 110, 48) --肥料滿等確認
leavl_20 = Region(318, 1000, 110, 48) --肥料等級20
right_20 = Region(520, 303, 65, 65) --右側第一格肥料等級20
star3 = Region(196, 340, 80, 30) --肥料判斷3星
star2 = Region(518, 340, 80, 30) --肥料判斷2星
join_team = Region(121, 383, 140, 40) --加入隊伍
exit_team = Region(323, 1121, 110, 80) --離開隊伍介面

--打reider---------------------------------------
find_reader = Region(158, 948, 410, 45)
go_reder = Region(257, 978, 215, 1048, 75)
fight_redier = Region(572, 403, 115, 100)
redier_die = Region(609, 866, 95, 75)
send_killer_redier = Region(375, 404, 50, 50)
redier_kill = Region(17, 387, 88, 80)

--打好友
friend_pk = Region(69, 330, 160, 80)
pk = Region(769, 580, 110, 1110) --開始PK
victory = Region(371, 755, 300, 300) --戰鬥結束勝利
lose = Region(482, 997, 112, 70) --戰鬥結束失敗
--==========  main program ===========
function pvp() --打pvp
    night:existsClick('night.png', 5) --點擊夜世界
    if pvp_night:exists('pvp_night.png', 5) then
        while true do
            pvp_night:existsClick('pvp_night.png', 0) --點擊夜世界pvp
            sleep(1)
            if not pvp_night:exists('pvp_night.png', 0) then
                break
            end
        end
    end
    while (true) do
        sleep(1)
        pvp_refresh:existsClick('pvp_refresh.png', 0) --刷新對戰列表
        sleep(2)
        pvp_auto_config:existsClick('pvp_auto_config.png', 2) --自動對戰設定
        pvp_start:existsClick('pvp_start.png', 2) --確認
        pvp_start1:existsClick('pvp_start1.png', 2) --pvp開始
        repeat
            sleep(5)
        until pvp_over:exists('pvp_over.png', 0) or pvp_over1:exists('pvp_over1.png', 0) or
            pvp_no_ticket:exists('no_ticket.png', 0) or
            reward1:exists('reward1.png', 0) or
            reward:exists('reward.png', 0) or
            pvp_over1:exists('pvp_over3.png', 0)

        if pvp_no_ticket:exists('no_ticket.png', 0) and feed_food == true then
            pvp_no_ticket:existsClick('no_ticket.png', 0)
            --沒有票了回到主畫面
            exit:existsClick('exit.png', 3)
            sleep(1)
            exit:existsClick('exit.png', 3)
            break
        else
            pvp_no_ticket:existsClick('no_ticket.png', 0)
        end
        if pvp_over1:exists('pvp_over3.png', 0) then --獎勵池滿
            click(Location(359, 952))
            sleep(1)
            if reward1:exists('reward1.png', 0) then
                click(Location(356, 736))
                sleep(1)
                click(Location(611, 526))
                sleep(1)
                reward:existsClick('reward.png', 1) --領取PVP獎勵
                reward_confirm:existsClick('pvp_start1.png', 1) --領取PVP確認
                reward_OK:existsClick('agate_exit.png', 1)
            elseif pvp_over1:exists('pvp_over1.png', 0) then --領取PVP獎勵
                click(Location(365, 950))
                pvp_over_2:existsClick('agate_exit.png', 1)
                sleep(1)
                reward:existsClick('reward.png', 1) --領取PVP獎勵
                reward_confirm:existsClick('pvp_start1.png', 1) --領取PVP確認
                sleep(1)
                reward_OK:existsClick('agate_exit.png', 1)
            else
                click(Location(365, 950))
            end
        end
    end
    --等帶回主畫面
    repeat
        sleep(2)
    until checkpoint:exists('checkpoint.png', 0)
end

function friend_PVP() --打好友
    --設定要移動的位置距離
    p1 = Location(392, 971)
    p2 = Location(392, 203)
    -- maxDistance: 每次移動最遠距離，如果移動距離超過，會插入每次多個距離為maxDistance的移動點，初始值為5
    -- insertWaitTimeMs: 如果需要插入移動點，會再前面同時插入等待insertWaitTime毫秒(millisecond)，初始值為1
    -- 調整適當的參數，可以在速度與正確性取得平衡
    setManualTouchParameter(150, 1)
    actionList = {
        {action = 'touchDown', target = p1}, --設定actionlist P1點按下
        {action = 'wait', target = 0.4}, --等待0.4秒
        {action = 'touchMove', target = p2}, --移動到p2點
        {action = 'wait', target = 0.4}, --等待0.4秒
        {action = 'touchUp', target = p2}
    } --放開
    if not friend_pk:exists('friend.png', 0) then
        click(Location(996, 2236))
    end
    while (true) do
        if pk:exists('pk.png', 0) then
            pk:existsClick('pk.png', 0)
            sleep(5)
            repeat
                sleep(3)
            until victory:existsClick('victory.png', 0) or lose:existsClick('lose.png', 0) or
                friend_pk:exists('friend.png', 0) or
                pk:exists('pk.png', 0)
            sleep(5)
        else
            repeat
                manualTouch(actionList) --調用actionList 無障礙7.0不支援 -- swipe(Location(555, 1000), Location(555, 530))
            until pk:exists('pk.png', 0.7)
        end
    end
end

function food(hot) --練肥
    --如果沒有找到戰鬥按鈕就重主介面尋找球圖標
    -- if not fight_start:exists('fight_start.png', 1) then
    --     if checkpoint:existsClick('checkpoint.png', 30) then --點擊刷圖
    --         sleep(2)
    --         if wave == '簡單1-4-6' then
    --             for i = 1, 3 do
    --                 click(Location(361, 87))
    --                 sleep(0.7)
    --             end
    --             click(Location(256, 985)) --選擇簡單
    --             sleep(1)
    --             click(Location(360, 1058)) --選擇第4關
    --             sleep(1)
    --             pointnumber:existsClick('4-6.png', 20) --點擊4-6關卡
    --             sleep(2)
    --             pointnumber2:existsClick('4-6-1.png', 20) --點擊4-6-1關卡
    --         elseif wave == '困難1-4-6' then
    --             for i = 1, 3 do
    --                 click(Location(361, 87))
    --                 sleep(0.7)
    --             end
    --             click(Location(360, 988)) --選擇HARD
    --             sleep(1)
    --             click(Location(360, 1058)) --選擇第4關
    --             sleep(1)
    --             pointnumber:existsClick('4-6.png', 20) --點擊4-6關卡
    --             sleep(2)
    --             pointnumber2:existsClick('4-6-1.png', 20) --點擊4-6-1關卡
    --         elseif wave == '困難4-5-1' then
    --             for i = 1, 3 do
    --                 click(Location(359, 931))
    --                 sleep(0.7)
    --             end
    --             click(Location(360, 988)) --選擇HARD
    --             sleep(0.7)
    --             click(Location(290, 1058)) --點選4-5關卡
    --             sleep(0.7)
    --             click(Location(172, 797)) --點選4-5關卡
    --             pointnumber2:existsClick('4-5-1.png', 20) --點擊4-6-1關卡
    --         end
    --     end
    -- end
    while (true) do
        time = os.date('%H')
        if time ~= ('18' or '19') then
            if fight_setting:exists('fight_setting.png', 0) then --設定刷關
                fight_setting:existsClick('fight_setting.png', 0)
                sleep(1)
                if fight_setting_count:exists('fight_setting_count.png', 0) then
                    repeat
                        click(Location(755, 1192))
                    until fight_setting_count:exists('fight_setting_count6.png', 0)
                    fight_start:existsClick('fight_start.png', 0)
                    click(Location(742, 1314))
                end
            end
            if food_full:exists('food_full.png', 0) then --如果腳色滿了 執行換瑪瑙
                click(Location(355, 1025))
                sleep(1)
                click(Location(355, 250)) --進入隊伍花面
                if not agate:exists('agate.png', 2) then
                    agate_point:existsClick('agate_point.png', 0)
                    agate:existsClick('agate.png', 5)
                    agate_2:existsClick('agate_2.png', 5)
                else
                    agate:existsClick('agate.png', 2)
                    agate_2:existsClick('agate_2.png', 5)
                end
                choose:existsClick('choose.png', 5)
                choose_confirm:existsClick('choose_confirm.png', 1)
                choose_ok:existsClick('choose_ok.png', 1)
                agate_exit:existsClick('agate_exit.png', 60)
                agate_exit:waitVanish('agate_exit.png', 60)
                exit:existsClick('exit.png', 1)
                choose_confirm:waitVanish('choose_confirm.png', 20)
                exit:existsClick('exit.png', 1)
                agate_2:waitVanish('agate_2.png', 20)
                sleep(1)
                if right_20:exists('leavl20.png', 1) then --如果同時肥料滿 又20等的設定(判斷最右邊的肥料是否20等) 判斷是否有肥料20等
                    food20_max20()
                    sleep(5)
                else
                    exit:existsClick('exit.png', 1)
                    sleep(5)
                end
            elseif MXA30:exists('food_MAX30.png', 0) then --肥料滿等
                MXA_confirm:existsClick('MAX_confirm.png', 0)
                sleep(1)
                click(Location(355, 250)) --進入隊伍花面
                sleep(1)
                food20_max20()
                sleep(5)
            elseif find_reader:exists('find_reader.png', 0) then --發現redier
                MXA_confirm:existsClick('MAX_confirm.png', 0)
                if go_reder:exists('go_reder.png', 3) then --判斷打redier介面
                    go_reder:existsClick('go_reder.png', 1)
                    if fight_redier:exists('fight_redier.png', 30) then
                        sleep(3)
                        fight_redier:existsClick('fight_redier.png', 0)
                    end
                    repeat
                        sleep(4)
                    until redier_die:exists('redier_die.png', 0) or redier_kill:exists('redier_kill.png', 0) or
                        pvp_no_ticket:exists('no_ticket.png', 0) --等待打完 點球回主畫面
                    if redier_die:exists('redier_die.png', 0) or redier_kill:exists('redier_kill.png', 0) then
                        redier_die:existsClick('redier_die.png', 0)
                        redier_kill:existsClick('redier_kill.png', 0)
                        if send_killer_redier:exists('send_killer_redier.png', 30) then --發送殺手模式
                            sleep(1)
                            send_killer_redier:existsClick('send_killer_redier.png', 0) --發送殺手模式
                            sleep(5)
                            pvp_no_ticket:existsClick('no_ticket.png', 2)
                            sleep(3)
                            exit:existsClick('exit.png', 3)
                        end
                        if not send_killer_redier:exists('send_killer_redier.png', 0) then
                            exit:existsClick('exit.png', 0) --如果沒有辦法發送殺手模式就離開
                            sleep(5)
                        end
                    elseif pvp_no_ticket:exists('no_ticket.png', 0) then --如果沒體力直接離開
                        pvp_no_ticket:existsClick('no_ticket.png', 0)
                        exit:existsClick('exit.png', 1)
                        sleep(3)
                        if send_killer_redier:exists('send_killer_redier.png', 30) then --發送殺手模式
                            sleep(1)
                            send_killer_redier:existsClick('send_killer_redier.png', 0) --發送殺手模式
                            sleep(3)
                            pvp_no_ticket:existsClick('no_ticket.png', 2)
                            exit:existsClick('exit.png', 1)
                        end
                    end
                    break
                end
            end
        end
    end
end

function food20_max20() --當肥料20等換肥
    if star3:exists('star3.png', 0) then --如果第二格是2星就更換 1 更換 0 不更換
        c = 0
        swipe(Location(380, 300), Location(380, 500)) --倒數第三格
        wait(2)
        swipe(Location(480, 300), Location(480, 500)) --倒數第二格
        wait(2)
        swipe(Location(580, 300), Location(580, 500)) --最後一格
    else --一帶四
        c = 1
        swipe(Location(280, 300), Location(280, 500))
        wait(2)
        swipe(Location(380, 300), Location(380, 500))
        wait(2)
        swipe(Location(480, 300), Location(480, 500))
        wait(2)
        swipe(Location(580, 300), Location(580, 500))
    end
    sleep(0.7)
    star2:waitVanish('star2.png', 60) --等待60秒肥料被更換拉下
    --換肥邏輯
    while not star2:exists('star2.png', 0) do
        if not star2:exists('star2.png', 0) then
            click(Location(266, 561))
            join_team:existsClick('join_team.png', 0)
            if join_team:exists('join_team.png', 0) then
                sleep(2)
            elseif pvp_no_ticket:existsClick('no_ticket.png', 0) then
            end
        end
    end
    exit_team:existsClick('agate_exit.png', 0)
end

function buy_h() ---用錢買體力
    if money_box:exists('money_box.png', 1) then
        while true do
            money_box:existsClick('money_box.png', 0)
            sleep(1)
            if not money_box:exists('money_box.png', 0) then
                break
            end
        end
    end

    touch_money:existsClick('touch_money.png', 0)
    click(Location(742, 1280))
    if money_buy:exists('money_buy.png', 0) then
        while true do
            money_buy:existsClick('money_buy.png', 0)
            click(Location(742, 1280))
        end
    end
end

--==使用者自訂=========
-- 按鈕選單
allTroops = {
    '困難4-5-1',
    '困難1-4-6',
    '簡單1-4-6'
}
allTroops1 = {
    '是',
    '否'
}
dialogInit()
addCheckBox('feed_food', '練肥', false) --是否打練肥
-- addSpinner('wave', allTroops, allTroops[1]) --選擇關卡的群組按鈕
-- newRow() --換下一排
addCheckBox('hotTime', '加倍時段', false) --是否打練肥
addSpinner('hot', allTroops1, allTroops1[1]) --選擇關卡的群組按鈕
newRow() --換下一排
addCheckBox('pvp_fight', 'pvp', false) --是否打PVP
addCheckBox('friend', '朋友決鬥', false) --是否打好友
newRow() --換下一排
addCheckBox('buy', '用錢買體力', false) --是用錢買體力
dialogShowFullScreen('關卡設定')

while (true) do
    --用錢買體力
    if buy == true then
        buy_h()
    end
    -- 打PVP
    if pvp_fight == true then
        pvp()
    end
    --練肥
    if feed_food == true then
        food(hot)
    end
    -- 打好友
    if friend == true then
        friend_PVP()
    end

    -- click(Location(1000, 2221))
end
