class SettingsProviderMap: ISettingsProviderMap {

    static var bitcoinProviders: [IBitcoinForksProvider] {
        return [HorSysBitcoinProvider(testMode: false),
                BlockChairBitcoinProvider(),
                BlockExplorerBitcoinProvider(),
                BtcComBitcoinProvider()
        ]
    }
    static var bitcoinCashProviders: [IBitcoinForksProvider] {
        return [HorSysBitcoinCashProvider(testMode: false),
                BlockChairBitcoinCashProvider(),
                BlockExplorerBitcoinCashProvider(),
                BtcComBitcoinCashProvider()
        ]
    }
    static var ethereumProviders: [IEthereumForksProvider] {
        return [HorSysEthereumProvider(testMode: false),
                EtherscanEthereumProvider(),
                BlockChairEthereumProvider()
        ]
    }

    func bitcoin(for name: String) -> IBitcoinForksProvider {
        return SettingsProviderMap.bitcoinProviders.first(where: { provider in provider.name == name }) ?? HorSysBitcoinProvider(testMode: false)
    }

    func bitcoinCash(for name: String) -> IBitcoinForksProvider {
        return SettingsProviderMap.bitcoinCashProviders.first(where: { provider in provider.name == name }) ?? HorSysBitcoinCashProvider(testMode: false)
    }

    func ethereum(for name: String) -> IEthereumForksProvider {
        return SettingsProviderMap.ethereumProviders.first(where: { provider in provider.name == name }) ?? HorSysEthereumProvider(testMode: false)
    }

}