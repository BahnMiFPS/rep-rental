Config = {}
local Core = exports['qb-core']:GetCoreObject()
Config.DriverLicense = {
    ['car'] = 'driver', -- car is the vehicle type, while driver is the player metadata
}

Config.Locations = {
    {
        ped = {
            hash = 'u_f_m_miranda_02',
            name = 'Carmella Rentheart',
            position = "Escalera Employee",
            color = "#FDE047",
            startMSG = 'Hey, how may I help you today?',
        },
        coords = vector4(-324.28, -960.3, 30.08, 269.84),
        spawnpoint = vector4(-321.19, -959.94, 31.06, 161.47),
        type = 'vehicle',
        blip = {
            label = "Rental",
            colour = 50,
            sprite = 56,
        },
        vehicles = {
            {
                model = 'bmx',
                money = 50,
                img = 'nui://rep-rental/web/build/assets/bmx.png',
                label = Core.Shared.Vehicles['bmx']['brand'] .. ' ' .. Core.Shared.Vehicles['bmx']['name'],
            },
            {
                model = 'cruiser',
                money = 50,
                img = 'nui://rep-rental/web/build/assets/cruiser.png',
                label = Core.Shared.Vehicles['cruiser']['brand'] .. ' ' .. Core.Shared.Vehicles['cruiser']['name'],
            },
            {
                model = 'scorcher',
                money = 75,
                img = 'nui://rep-rental/web/build/assets/scorcher.png',
                label = Core.Shared.Vehicles['scorcher']['brand'] .. ' ' .. Core.Shared.Vehicles['scorcher']['name'],
            },
            {
                model = 'faggio',
                money = 150,
                img = 'nui://rep-rental/web/build/assets/faggio.png',
                label = Core.Shared.Vehicles['faggio']['brand'] .. ' ' .. Core.Shared.Vehicles['faggio']['name'],
            },
            {
                model = 'faggio2',
                money = 150,
                img = 'nui://rep-rental/web/build/assets/faggio2.png',
                label = Core.Shared.Vehicles['faggio2']['brand'] .. ' ' .. Core.Shared.Vehicles['faggio2']['name'],
            },
            {
                model = 'faggio3',
                money = 175,
                img = 'nui://rep-rental/web/build/assets/faggio3.png',
                label = Core.Shared.Vehicles['faggio3']['brand'] .. ' ' .. Core.Shared.Vehicles['faggio3']['name'],
            },
            {
                model = 'panto',
                money = 300,
                type = 'car',
                img = 'nui://rep-rental/web/build/assets/panto.png',
                label = Core.Shared.Vehicles['panto']['brand'] .. ' ' .. Core.Shared.Vehicles['panto']['name'],
            },
            {
                model = 'asea',
                money = 500,
                type = 'car',
                img = 'nui://rep-rental/web/build/assets/asea.png',
                label = Core.Shared.Vehicles['asea']['brand'] .. ' ' .. Core.Shared.Vehicles['asea']['name'],
            },
            {
                model = 'primo',
                money = 600,
                type = 'car',
                img = 'nui://rep-rental/web/build/assets/primo.png',
                label = Core.Shared.Vehicles['primo']['brand'] .. ' ' .. Core.Shared.Vehicles['primo']['name'],
            },
            {
                model = 'felon',
                money = 600,
                type = 'car',
                img = 'nui://rep-rental/web/build/assets/felon.png',
                label = Core.Shared.Vehicles['felon']['brand'] .. ' ' .. Core.Shared.Vehicles['felon']['name'],
            },
        }
    },
}

Config.Lang = {
    ['vi'] = {
        ['error_obstacle'] = {
            msg = "Có phương tiện đang chắn đường",
            type = "error",
            time = 5000
        },
        ['error_license'] = {
            msg = "Bạn cần có bằng lái",
            type = "error",
            time = 5000
        },
        ['error_already'] = {
            msg = "Hãy trả xe trước khi thuê tiếp",
            type = "error",
            time = 5000
        },
        ['error_ped'] = {
            msg = "Có người trong xe",
            type = "error",
            time = 5000
        },
        ['error_cash'] = {
            msg = "Bạn không đủ tiền mặt",
            type = "error",
            time = 5000
        },
        ['error_bank'] = {
            msg = "Bạn không đủ tiền trong thẻ",
            type = "error",
            time = 5000
        },
        ['ped_data1'] = {
            msg = "Tôi cần một phương tiện",
        },
        ['ped_data2'] = {
            msg = "Tôi chỉ đi ngang qua đây",
        },
        ['ped_data3'] = {
            msg = "Tôi muốn trả xe",
        },
        ['ui'] = {
            per_hour = "/ giờ",
            rent = "Thuê",
            choose_color = "Chọn màu sắc:",
            rental_dur = "Thời gian thuê:",
            rental_dur_placeholder = "Số giờ thuê",
            one_hour = "1 tiếng",
            two_hours = "2 tiếng",
            three_hours = "3 tiếng",
            four_hours = "4 tiếng",
            total = "Tổng cộng:",
            cash = "Tiền mặt",
            card = "Thẻ"
        }
    },
    ['en'] = {
        ['error_obstacle'] = {
            msg = "There is a vehicle blocking the road",
            type = "error",
            time = 5000
        },
        ['error_already'] = {
            msg = "Hãy trả xe trước khi thuê tiếp",
            type = "error",
            time = 5000
        },
        ['error_license'] = {
            msg = "You need a driver license",
            type = "error",
            time = 5000
        },
        ['error_ped'] = {
            msg = "Có người trong xe",
            type = "error",
            time = 5000
        },
        ['error_cash'] = {
            msg = "You don't have enough cash",
            type = "error",
            time = 5000
        },
        ['error_bank'] = {
            msg = "You don't have enough money in your card",
            type = "error",
            time = 5000
        },
        ['ped_data1'] = {
            msg = "I need a vehicle",
        },
        ['ped_data2'] = {
            msg = "I'm just passing by here",
        },
        ['ped_data3'] = {
            msg = "Tôi muốn trả xe",
        },
        ['ui'] = {
            per_hour = "/ per hour",
            rent = "Rent",
            choose_color = "Choose a color:",
            rental_dur = "Rental duration:",
            rental_dur_placeholder = "Rent hours",
            one_hour = "1 hour",
            two_hours = "2 hours",
            three_hours = "3 hours",
            four_hours = "4 hours",
            total = "Total amount:",
            cash = "Cash",
            card = "Card"
        }

    }
}
