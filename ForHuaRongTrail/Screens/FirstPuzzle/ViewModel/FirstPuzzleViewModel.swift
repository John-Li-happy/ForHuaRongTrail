//
//  FirstPuzzleViewModel.swift
//  ForHuaRongTrail
//
//  Created by Zhaoyang Li on 11/6/20.
//

import Foundation

class FirstPuzzleViewModel {
    var matrix = [
        [3, 1, 1, 3],
        [3, 1, 1, 3],
        [3, 2, 2, 3],
        [3, 4, 4, 3],
        [4, 0, 0, 4]
    ]
    var caoCaoPosition = [[0, 1], [0, 2], [1, 1], [1, 2]] // topLeft // topRight // botLeft // botRight
    var guanYuPosition = [[2, 1], [2, 2]] // left // right
    var zhangFeiPosition = [[0, 0], [1, 0]] // top // bot
    var zhaoYunPosition = [[0, 3],[1, 3]] // top // right
    var maChaoPosition = [[2, 0], [3, 0]] // top // right
    var huangZhongPosition = [[2, 3], [3, 3]] // top // right
    var firstSoilderPosition = [4, 0]
    var secondSoldierPostion = [3, 1]
    var thirdSoldierPostiion = [3, 2]
    var fourthSoldierPosition = [4, 3]
}

extension FirstPuzzleViewModel { // 1 * 1 logics
    func soliderUpCheck(soldier: Soldiers) -> Bool {
        var soldierPosition = [Int]()
        switch soldier {
        case .soldierOne:
            soldierPosition = firstSoilderPosition
        case .soldierTwo:
            soldierPosition = secondSoldierPostion
        case .soldierThree:
            soldierPosition = thirdSoldierPostiion
        case .soldierFour:
            soldierPosition = fourthSoldierPosition
        }
        if soldierPosition[0] <= 0 { return false }
        
        if matrix[soldierPosition[0] - 1][soldierPosition[1]] == 0 {
            matrix[soldierPosition[0]][soldierPosition[1]] = 0
            soldierPosition[0] -= 1
            matrix[soldierPosition[0]][soldierPosition[1]] = 4
            
            switch soldier {
            case .soldierOne:
                firstSoilderPosition = soldierPosition
            case .soldierTwo:
                secondSoldierPostion = soldierPosition
            case .soldierThree:
                thirdSoldierPostiion = soldierPosition
            case .soldierFour:
                fourthSoldierPosition = soldierPosition

            }
            return true
        } else { return false }
    }
    
    func soliderDownCheck(soldier: Soldiers) -> Bool {
        var soldierPosition = [Int]()
        switch soldier {
        case .soldierOne:
            soldierPosition = firstSoilderPosition
        case .soldierTwo:
            soldierPosition = secondSoldierPostion
        case .soldierThree:
            soldierPosition = thirdSoldierPostiion
        case .soldierFour:
            soldierPosition = fourthSoldierPosition
        }
        if soldierPosition[0] >= 4 { return false }
        
        if matrix[soldierPosition[0] + 1][soldierPosition[1]] == 0 {
            matrix[soldierPosition[0]][soldierPosition[1]] = 0
            soldierPosition[0] += 1
            matrix[soldierPosition[0]][soldierPosition[1]] = 4
            
            switch soldier {
            case .soldierOne:
                firstSoilderPosition = soldierPosition
            case .soldierTwo:
                secondSoldierPostion = soldierPosition
            case .soldierThree:
                thirdSoldierPostiion = soldierPosition
            case .soldierFour:
                fourthSoldierPosition = soldierPosition
            }
            return true
        } else { return false }
    }
    
    func soliderLeftCheck(soldier: Soldiers) -> Bool {
        var soldierPosition = [Int]()
        switch soldier {
        case .soldierOne:
            soldierPosition = firstSoilderPosition
        case .soldierTwo:
            soldierPosition = secondSoldierPostion
        case .soldierThree:
            soldierPosition = thirdSoldierPostiion
        case .soldierFour:
            soldierPosition = fourthSoldierPosition
        }
        if soldierPosition[1] <= 0 { return false }
        
        if matrix[soldierPosition[0]][soldierPosition[1] - 1] == 0 {
            matrix[soldierPosition[0]][soldierPosition[1]] = 0
            soldierPosition[1] -= 1
            matrix[soldierPosition[0]][soldierPosition[1]] = 4
            
            switch soldier {
            case .soldierOne:
                firstSoilderPosition = soldierPosition
            case .soldierTwo:
                secondSoldierPostion = soldierPosition
            case .soldierThree:
                thirdSoldierPostiion = soldierPosition
            case .soldierFour:
                fourthSoldierPosition = soldierPosition

            }
            return true
        } else { return false }
    }
    
    func soliderRightCheck(soldier: Soldiers) -> Bool {
        var soldierPosition = [Int]()
        switch soldier {
        case .soldierOne:
            soldierPosition = firstSoilderPosition
        case .soldierTwo:
            soldierPosition = secondSoldierPostion
        case .soldierThree:
            soldierPosition = thirdSoldierPostiion
        case .soldierFour:
            soldierPosition = fourthSoldierPosition
        }
        if soldierPosition[1] >= 3 { return false }
        
        if matrix[soldierPosition[0]][soldierPosition[1] + 1] == 0 {
            matrix[soldierPosition[0]][soldierPosition[1]] = 0
            soldierPosition[1] += 1
            matrix[soldierPosition[0]][soldierPosition[1]] = 4
            
            switch soldier {
            case .soldierOne:
                firstSoilderPosition = soldierPosition
            case .soldierTwo:
                secondSoldierPostion = soldierPosition
            case .soldierThree:
                thirdSoldierPostiion = soldierPosition
            case .soldierFour:
                fourthSoldierPosition = soldierPosition

            }
            return true
        } else { return false }
    }
}

extension FirstPuzzleViewModel { // 1 * 2 logics 
    func wuHuUpCheck(general: WuHuGenerals) -> Bool {
        var generalPosition = [[Int]]()
        switch general {
        case .zhangFei:
            generalPosition = zhangFeiPosition
        case .zhaoYun:
            generalPosition = zhaoYunPosition
        case .maChao:
            generalPosition = maChaoPosition
        case .huangZhong:
            generalPosition = huangZhongPosition
        }
        if generalPosition[0][0] <= 0 { return false }
        
        if matrix[generalPosition[0][0] - 1][generalPosition[0][1]] == 0 {
            matrix[generalPosition[1][0]][generalPosition[1][1]] = 0
            for elementIndex in 0..<generalPosition.count { generalPosition[elementIndex][0] -= 1 }
            matrix[generalPosition[0][0]][generalPosition[0][1]] = 3
            
            switch general {
            case .zhangFei:
                zhangFeiPosition = generalPosition
            case .zhaoYun:
                zhaoYunPosition = generalPosition
            case .maChao:
                maChaoPosition = generalPosition
            case .huangZhong:
                huangZhongPosition = generalPosition
            }
            return true
        } else { return false }
    }
    
    func wuHuDownCheck(general: WuHuGenerals) -> Bool {
        var generalPosition = [[Int]]()
        switch general {
        case .zhangFei:
            generalPosition = zhangFeiPosition
        case .zhaoYun:
            generalPosition = zhaoYunPosition
        case .maChao:
            generalPosition = maChaoPosition
        case .huangZhong:
            generalPosition = huangZhongPosition
        }
        if generalPosition[1][0] >= 4 { return false }
        
        if matrix[generalPosition[1][0] + 1][generalPosition[1][1]] == 0 {
            matrix[generalPosition[0][0]][generalPosition[0][1]] = 0
            for elementIndex in 0..<generalPosition.count { generalPosition[elementIndex][0] += 1 }
            matrix[generalPosition[1][0]][generalPosition[1][1]] = 3
            
            switch general {
            case .zhangFei:
                zhangFeiPosition = generalPosition
            case .zhaoYun:
                zhaoYunPosition = generalPosition
            case .maChao:
                maChaoPosition = generalPosition
            case .huangZhong:
                huangZhongPosition = generalPosition
            }
            return true
        } else { return false }
    }
    
    func wuHuLeftCheck(general: WuHuGenerals) -> Bool {
        var generalPosition = [[Int]]()
        switch general {
        case .zhangFei:
            generalPosition = zhangFeiPosition
        case .zhaoYun:
            generalPosition = zhaoYunPosition
        case .maChao:
            generalPosition = maChaoPosition
        case .huangZhong:
            generalPosition = huangZhongPosition
        }
        if generalPosition[0][1] <= 0 { return false }
        
        if matrix[generalPosition[0][0]][generalPosition[0][1] - 1] == 0 {
            if matrix[generalPosition[1][0]][generalPosition[1][1] - 1] == 0 {
                matrix[generalPosition[0][0]][generalPosition[0][1]] = 0
                matrix[generalPosition[1][0]][generalPosition[1][1]] = 0
                for elementIndex in 0..<generalPosition.count { generalPosition[elementIndex][1] -= 1 }
                matrix[generalPosition[0][0]][generalPosition[0][1]] = 3
                matrix[generalPosition[1][0]][generalPosition[1][1]] = 3
                
                switch general {
                case .zhangFei:
                    zhangFeiPosition = generalPosition
                case .zhaoYun:
                    zhaoYunPosition = generalPosition
                case .maChao:
                    maChaoPosition = generalPosition
                case .huangZhong:
                    huangZhongPosition = generalPosition
                }
                return true
            } else { return false}
        } else { return false }
    }
    
    func wuHuRightCheck(general: WuHuGenerals) -> Bool {
        var generalPosition = [[Int]]()
        switch general {
        case .zhangFei:
            generalPosition = zhangFeiPosition
        case .zhaoYun:
            generalPosition = zhaoYunPosition
        case .maChao:
            generalPosition = maChaoPosition
        case .huangZhong:
            generalPosition = huangZhongPosition
        }
        if generalPosition[0][1] >= 3 { return false }
        
        if matrix[generalPosition[0][0]][generalPosition[0][1] + 1] == 0 {
            if matrix[generalPosition[1][0]][generalPosition[1][1] + 1] == 0 {
                matrix[generalPosition[0][0]][generalPosition[0][1]] = 0
                matrix[generalPosition[1][0]][generalPosition[1][1]] = 0
                for elementIndex in 0..<generalPosition.count { generalPosition[elementIndex][1] += 1 }
                matrix[generalPosition[0][0]][generalPosition[0][1]] = 3
                matrix[generalPosition[1][0]][generalPosition[1][1]] = 3
                
                switch general {
                case .zhangFei:
                    zhangFeiPosition = generalPosition
                case .zhaoYun:
                    zhaoYunPosition = generalPosition
                case .maChao:
                    maChaoPosition = generalPosition
                case .huangZhong:
                    huangZhongPosition = generalPosition
                }
                return true
            } else { return false}
        } else { return false }
    }
}

extension FirstPuzzleViewModel { // 2 * 1 logics
    func guanYuRightCheck() -> Bool {
        if guanYuPosition[1][1] >= 3 { return false }
        
        if matrix[guanYuPosition[1][0]][guanYuPosition[1][1] + 1] == 0 {
            matrix[guanYuPosition[0][0]][guanYuPosition[0][1]] = 0
            for elementIndex in 0..<guanYuPosition.count { guanYuPosition[elementIndex][1] += 1 }
            matrix[guanYuPosition[1][0]][guanYuPosition[1][1]] = 2
            return true
        } else { return false }
    }
    
    func guanYuLeftCheck() -> Bool {
        if guanYuPosition[0][1] <= 0 { return false }
        
        if matrix[guanYuPosition[0][0]][guanYuPosition[0][1] - 1] == 0 {
            matrix[guanYuPosition[1][0]][guanYuPosition[1][1]] = 0
            for elementIndex in 0..<guanYuPosition.count { guanYuPosition[elementIndex][1] -= 1 }
            matrix[guanYuPosition[0][0]][guanYuPosition[0][1]] = 2
            return true
        } else { return false }
    }
    
    func guanYuUpCheck() -> Bool {
        if guanYuPosition[0][0] <= 0 { return false }
        
        if matrix[guanYuPosition[0][0] - 1][guanYuPosition[0][1]] == 0 {
            if matrix[guanYuPosition[1][0] - 1][guanYuPosition[1][1]] == 0 {
                matrix[guanYuPosition[0][0]][guanYuPosition[0][1]] = 0
                matrix[guanYuPosition[1][0]][guanYuPosition[1][1]] = 0
                for elementIndex in 0..<guanYuPosition.count { guanYuPosition[elementIndex][0] -= 1 }
                matrix[guanYuPosition[0][0]][guanYuPosition[0][1]] = 2
                matrix[guanYuPosition[1][0]][guanYuPosition[1][1]] = 2
                return true
            } else { return false}
        } else { return false }
    }
    
    func guanYuDownCheck() -> Bool {
        if guanYuPosition[0][0] >= 4 { return false }
        
        if matrix[guanYuPosition[0][0] + 1][guanYuPosition[0][1]] == 0 {
            if matrix[guanYuPosition[1][0] + 1][guanYuPosition[1][1]] == 0 {
                matrix[guanYuPosition[0][0]][guanYuPosition[0][1]] = 0
                matrix[guanYuPosition[1][0]][guanYuPosition[1][1]] = 0
                for elementIndex in 0..<guanYuPosition.count { guanYuPosition[elementIndex][0] += 1 }
                matrix[guanYuPosition[0][0]][guanYuPosition[0][1]] = 2
                matrix[guanYuPosition[1][0]][guanYuPosition[1][1]] = 2
                return true
            } else { return false}
        } else { return false }
    }
}

extension FirstPuzzleViewModel {  // 2 * 2 logics
    func caoCaoRightCheck() -> Bool {
        if caoCaoPosition[1][1] >= 3 { return false }
        
        if matrix[caoCaoPosition[1][0]][caoCaoPosition[1][1] + 1] == 0 {
            if matrix[caoCaoPosition[3][0]][caoCaoPosition[3][1] + 1] == 0 {
                matrix[caoCaoPosition[0][0]][caoCaoPosition[0][1]] = 0
                matrix[caoCaoPosition[2][0]][caoCaoPosition[2][1]] = 0
                for elementIndex in 0..<caoCaoPosition.count { caoCaoPosition[elementIndex][1] += 1 }
                matrix[caoCaoPosition[1][0]][caoCaoPosition[1][1]] = 1
                matrix[caoCaoPosition[3][0]][caoCaoPosition[3][1]] = 1
                return true
            } else { return false }
        } else { return false }
    }
    
    func caoCaoLeftCheck() -> Bool {
        if caoCaoPosition[0][1] <= 0 { return false }
        
        if matrix[caoCaoPosition[0][0]][caoCaoPosition[0][1] - 1] == 0 {
            if matrix[caoCaoPosition[2][0]][caoCaoPosition[2][1] - 1] == 0 {
                matrix[caoCaoPosition[1][0]][caoCaoPosition[1][1]] = 0
                matrix[caoCaoPosition[3][0]][caoCaoPosition[3][1]] = 0
                for elementIndex in 0..<caoCaoPosition.count { caoCaoPosition[elementIndex][1] -= 1 }
                matrix[caoCaoPosition[0][0]][caoCaoPosition[0][1]] = 1
                matrix[caoCaoPosition[2][0]][caoCaoPosition[2][1]] = 1
                return true
            } else { return false }
        } else { return false }
    }
    
    func caoCaoDownCheck() -> Bool {
        if caoCaoPosition[2][0] >= 4 { return false }
        
        if matrix[caoCaoPosition[2][0] + 1][caoCaoPosition[2][1]] == 0 {
            if matrix[caoCaoPosition[3][0] + 1][caoCaoPosition[3][1]] == 0 {
                matrix[caoCaoPosition[0][0]][caoCaoPosition[0][1]] = 0
                matrix[caoCaoPosition[1][0]][caoCaoPosition[1][1]] = 0
                for elementIndex in 0..<caoCaoPosition.count { caoCaoPosition[elementIndex][0] += 1 }
                matrix[caoCaoPosition[2][0]][caoCaoPosition[2][1]] = 1
                matrix[caoCaoPosition[3][0]][caoCaoPosition[3][1]] = 1
                return true
            } else { return false }
        } else { return false }
    }
    
    func caoCaoUpCheck() -> Bool {
        if caoCaoPosition[0][0] <= 0 { return false }
        
        if matrix[caoCaoPosition[0][0] - 1][caoCaoPosition[0][1]] == 0 {
            if matrix[caoCaoPosition[1][0] - 1][caoCaoPosition[1][1]] == 0 {
                matrix[caoCaoPosition[2][0]][caoCaoPosition[2][1]] = 0
                matrix[caoCaoPosition[3][0]][caoCaoPosition[3][1]] = 0
                for elementIndex in 0..<caoCaoPosition.count { caoCaoPosition[elementIndex][0] -= 1 }
                matrix[caoCaoPosition[0][0]][caoCaoPosition[0][1]] = 1
                matrix[caoCaoPosition[1][0]][caoCaoPosition[1][1]] = 1
                return true
            } else { return false }
        } else { return false }
    }
}
