import { Context, createContext, useContext, useState } from "react"
import { useNuiEvent } from "../hooks/useNuiEvent"
import { debugData } from "../utils/debugData"

debugData([
  {
    action: "loadLocales",
    data: ["en", "vi"],
  },
])

debugData([
  {
    action: "setLocale",
    data: {
      language: "Tiếng Việt",
      ui: {
        per_hour: "/ giờ",
        rent: "Thuê",
        choose_color: "Chọn màu sắc:",
        rental_dur: "Thời gian thuê:",
        rental_dur_placeholder: "Số giờ thuê",
        one_hour: "1 tiếng",
        two_hours: "2 tiếng",
        three_hours: "3 tiếng",
        four_hours: "4 tiếng",
        total: "Tổng cộng:",
        cash: "Tiền mặt",
        card: "Thẻ",
      },
    },
  },
])

interface Locale {
  language: string
  ui: {
    per_hour: string
    rent: string
    choose_color: string
    rental_dur: string
    rental_dur_placeholder: string
    one_hour: string
    two_hours: string
    three_hours: string
    four_hours: string
    total: string
    cash: string
    card: string
  }
}

interface LocaleContextValue {
  locale: Locale
  setLocale: (locales: Locale) => void
}

const LocaleCtx = createContext<LocaleContextValue | null>(null)

const LocaleProvider: React.FC<{ children: React.ReactNode }> = ({
  children,
}) => {
  const [locale, setLocale] = useState<Locale>({
    language: "",
    ui: {
      per_hour: "",
      rent: "",
      choose_color: "",
      rental_dur: "",
      rental_dur_placeholder: "",
      one_hour: "",
      two_hours: "",
      three_hours: "",
      four_hours: "",
      total: "",
      cash: "",
      card: "",
    },
  })

  useNuiEvent("setLocale", async (data: Locale) => setLocale(data))

  return (
    <LocaleCtx.Provider value={{ locale, setLocale }}>
      {children}
    </LocaleCtx.Provider>
  )
}

export default LocaleProvider

export const useLocales = () =>
  useContext<LocaleContextValue>(LocaleCtx as Context<LocaleContextValue>)
