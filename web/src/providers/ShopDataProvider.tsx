import {
  Context,
  createContext,
  useContext,
  useEffect,
  useState,
  useMemo,
} from "react"
import { MantineColor } from "@mantine/core"
import { fetchNui } from "../utils/fetchNui"
import { useNuiEvent } from "../hooks/useNuiEvent"
import { isEnvBrowser } from "../utils/misc"
import { Car } from "../typings/Car"
import { debugData } from "../utils/debugData"

const mockCars: Car[] = [
  { model: "asea", label: "Declasse Asea", money: 50 },
  {
    model: "1",
    label: "Declasse Asea",
    money: 50,
    img: `./assets/cruiser.png`,
  },

  {
    model: "1",
    label: "Declasse Asea",
    money: 50,
    img: `./assets/scorcher.png`,
  },

  { model: "1", label: "Declasse Asea", money: 50, img: `./assets/faggio.png` },
  { model: "1", label: "Declasse Asea", money: 50, img: `./assets/asea.png` },
]

interface Config {
  primaryColor: MantineColor
  primaryShade: 0 | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9
  colorScheme: "dark" | "light"
}

interface ShopDataContextValue {
  config: Config
  setConfig: (config: Config) => void
  vehicles: Car[]
  visible: boolean
  closeUi: () => void
}

const ShopDataContext = createContext<ShopDataContextValue | null>(null)

const ShopDataProvider: React.FC<{ children: React.ReactNode }> = ({
  children,
}) => {
  const [config, setConfig] = useState<Config>({
    primaryColor: "yellow",
    primaryShade: 3,
    colorScheme: "light",
  })
  const [vehicles, setVehicles] = useState([])
  const [visible, setVisible] = useState(isEnvBrowser())
  useEffect(() => {
    if (isEnvBrowser()) {
      debugData([
        {
          action: "open",
          data: { vehicles: mockCars },
        },
      ])
    }
  }, [])

  useNuiEvent("open", (data) => {
    setVisible(true)
    setVehicles(data.vehicles)
  })

  const closeUi = () => {
    fetchNui("close")
    setVisible(false)
  }
  const contextValue = useMemo(
    () => ({
      visible,
      config,
      setConfig,
      vehicles,
      closeUi,
    }),
    [visible, config, setConfig, vehicles]
  )

  return (
    <ShopDataContext.Provider value={contextValue}>
      {children}
    </ShopDataContext.Provider>
  )
}

export default ShopDataProvider

export const useShopData = () =>
  useContext<ShopDataContextValue>(
    ShopDataContext as Context<ShopDataContextValue>
  )
