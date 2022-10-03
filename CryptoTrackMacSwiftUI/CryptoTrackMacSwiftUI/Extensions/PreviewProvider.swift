//
//  PreviewProvider.swift
//  CryptoTrackSwiftUI
//
//  Created by Baris OZGEN on 15.09.2022.
//

import SwiftUI

extension PreviewProvider {
    static var dev: DeveloperPreview{
        return DeveloperPreview.instance
    }
}

class DeveloperPreview{
    static let instance = DeveloperPreview()
    
    let stat0x0 = StatisticModel(title: "Currenct Price", value: "$20.123.45", percentageChange: 1.29)
    let stat0x1 = StatisticModel(title: "Market Capitalization", value: "$429.14Bn", percentageChange: 1.92)
    let stat1x0 = StatisticModel(title: "Rank", value: "1", percentageChange: nil)
    let stat1x1 = StatisticModel(title: "Volume", value: "$29.07Bn", percentageChange: nil)
    
    let sectionModel = CoinDetailSectionModel(title: "Overview",
                                              stats: [
                                                StatisticModel(title: "Currenct Price", value: "$20.123.45", percentageChange: 1.29),
                                                StatisticModel(title: "Market Capitalization", value: "$429.14Bn", percentageChange: 1.92),
                                                StatisticModel(title: "Rank", value: "1", percentageChange: nil),
                                                StatisticModel(title: "Volume", value: "$29.07Bn", percentageChange: nil)
                                              ])
    let cryptoCurrency = CryptoCurrency(
        id: "bitcoin",
        symbol: "btc",
        name: "Bitcoin Preview",
        image: "https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1547033579",
        currentPrice: 20086,
        marketCapRank: 100,
        marketCap: 386980503908,
        fullyDilutedValuation: 424339427973,
        totalVolume: 38513552039,
        high24H: 20397,
        low24H: 19801.17,
        priceChange24H: -164.71087593276025,
        priceChangePercentage24H: -100.81334,
        marketCapChange24H: -771797029.4143066,
        marketCapChangePercentage24H: -0.19904,
        circulatingSupply: 19151156,
        totalSupply: 21000000,
        maxSupply: 21000000,
        ath: 69045,
        athChangePercentage: -70.734,
        athDate: "2021-11-10T14:24:11.849Z",
        atl: 67.81,
        atlChangePercentage: 29699.34732,
        atlDate: "2013-07-06T00:00:00.000Z",
        lastUpdated: "2022-09-15T08:26:52.857Z",
        sparklineIn7D: SparklineIn7D(price: [
            19302.99628196813,
            19237.59637238286,
            19178.078483360874,
            19208.74686572614,
            19191.10045444229,
            19308.62433338331,
            19308.39971957381,
            19142.86383896073,
            19242.732673570725,
            19229.03021064608,
            19256.995260585572,
            19183.55164826656,
            19191.761012119947,
            19225.936282816707,
            19279.275106275294,
            19356.632688270314,
            19346.505171499677,
            19310.827707212924,
            19315.36528635933,
            19372.293932202785,
            19343.3766171292,
            19406.145813333856,
            19852.502412048245,
            20296.51926416554,
            20538.0645323448,
            20652.45566436012,
            20641.883799092568,
            20720.62054814087,
            20739.484034714165,
            21091.19671210702,
            20951.3801845148,
            21118.83517695723,
            20990.225899381803,
            21029.026413314645,
            21318.852776588657,
            21255.80724963564,
            21253.757342831243,
            21188.185444476945,
            21274.56850360202,
            21289.222882790094,
            21328.391205663742,
            21364.42881625773,
            21373.0518826196,
            21269.901464419152,
            21295.031296416782,
            21266.724435239077,
            21303.897882771977,
            21409.434587156393,
            21560.771468112867,
            21513.029502583297,
            21279.328578116656,
            21366.68976761259,
            21334.465845841463,
            21343.562323353042,
            21297.395642365762,
            21310.123585732115,
            21186.66238874573,
            21239.568503874092,
            21252.948017439307,
            21329.536147897936,
            21291.632209598843,
            21461.366918163458,
            21580.124111951085,
            21415.84449790088,
            21611.291722302372,
            21700.506218753544,
            21707.38731931814,
            21532.38574179648,
            21629.327401887113,
            21543.07810593511,
            21538.030524189955,
            21575.230041299506,
            21602.798200691614,
            21417.347666437636,
            21571.066260969605,
            21702.730059613008,
            21618.679210513794,
            21634.577994935735,
            21617.42527877367,
            21619.45213385638,
            21551.76868583051,
            21504.353575599056,
            21666.104195907512,
            21685.357076655688,
            21774.051156897473,
            21598.342717899886,
            21606.183946624507,
            21577.7168121273,
            21625.30916872812,
            21666.046561382085,
            21741.569832995458,
            21686.930126120267,
            22202.035748239385,
            21770.96642915996,
            21594.133225623027,
            21747.326261531707,
            21781.115331711822,
            21804.567465543205,
            22117.52421447349,
            22242.652543728345,
            22195.691184367177,
            22180.533789560726,
            22292.742909584467,
            22359.170072565197,
            22391.447255851035,
            22299.065744971893,
            22212.649801634816,
            22252.105139323525,
            22321.90030871757,
            22331.951408851433,
            22423.59437711096,
            22399.936222361033,
            22360.688959782823,
            22306.587583714398,
            22338.565597628796,
            22235.574210864193,
            22190.42166932646,
            22265.723213702437,
            22214.487822144336,
            22300.27911757367,
            22407.93267365611,
            22342.923778351127,
            22297.66235249094,
            22219.09848587256,
            22402.410013204157,
            22534.613722181795,
            22526.940733015006,
            21610.403193894967,
            21316.01584556709,
            21067.366531481257,
            20864.167327350406,
            20773.20359265033,
            20792.143445211783,
            20253.46331014825,
            20276.183451100984,
            20310.327147269836,
            20100.219821471135,
            20187.072462934208,
            20177.75073928847,
            20162.35057392865,
            20287.31226460833,
            20408.345336243998,
            20318.191607406225,
            20402.59129743194,
            20356.429714772552,
            20243.112738977485,
            20241.214741450378,
            20348.20895111923,
            20340.24401174397,
            20365.218144424485,
            20237.460871526488,
            20306.07122707456,
            20277.02405432857,
            20267.256875956005,
            20186.28417893739,
            20193.633348638894,
            20176.33596773749,
            19850.47671454887,
            19989.25525850508,
            19970.81845984509,
            20195.581020961064,
            20296.65495045268,
            20238.823171784203,
            20181.80356858929,
            20134.08277349681,
            20072.48165582401,
            20017.664914669414,
            20045.211071435988]) ,
        priceChangePercentage24HInCurrency: -0.8133402402824212,
        
        portfolioAmount : 1.29,
        portfolioUnitPrice : 17.789,
        portfolioUnitLowest : 16.789,
        portfolioUnitHighest : 18.789,
        portfolioTransactionType : "b",
        portfolioDateCreated : Date()
    )
    
    
}
