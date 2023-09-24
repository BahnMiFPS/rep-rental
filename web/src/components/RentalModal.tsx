import {
  Box,
  Button,
  CheckIcon,
  ColorSwatch,
  Group,
  Select,
  Title,
  rem,
} from "@mantine/core"
import { useState } from "react"
import { Car } from "../typings/Car"
import CountUp from "react-countup"

import { IconCash, IconCreditCard } from "@tabler/icons-react"
import { fetchNui } from "../utils/fetchNui"
import { useShopData } from "../providers/ShopDataProvider"
import { useLocales } from "../providers/LocaleProvider"

const carDefaultColors = [
  "rgb(253, 126, 20)",
  "rgb(250, 176, 5)",
  "rgb(243, 156, 18)",
  "rgb(231, 76, 60)",
  "rgb(250, 82, 82)",
  "rgb(230, 73, 128)",
  "rgb(142, 68, 173)",
  "rgb(190, 75, 219)",
  "rgb(121, 80, 242)",
  "rgb(76, 110, 245)",
  "rgb(34, 139, 230)",
  "rgb(22, 160, 133)",
  "rgb(26, 188, 156)",
  "rgb(18, 184, 134)",
  "rgb(39, 174, 96)",
  "rgb(64, 192, 87)",
  "rgb(130, 201, 30)",
  "rgb(52, 73, 94)",
  "rgb(134, 142, 150)",
  "rgb(37, 38, 43)",
]

interface Props {
  car: Car
}
function RentalModal({ car }: Props) {
  const [checked, setChecked] = useState("rgb(253, 126, 20)")
  const [hoursRent, setHoursRent] = useState<string | null>("1")
  const TotalAmount = Number(hoursRent) * car.money
  const { closeUi } = useShopData()
  const { locale } = useLocales()
  const handlePayment = (payment: string) => {
    const data = {
      model: car.model,
      type: car.type,
      color: checked,
      payment: payment,
      total: TotalAmount,
      time: Number(hoursRent),
    }
    fetchNui("rent", data)
    closeUi()
  }
  return (
    <Box className="w-full flex flex-col gap-6 mt-2">
      <Title order={2} className="leading-0 tracking-tighter mt-2">
        {car.label}
      </Title>
      <Box className="flex gap-1 flex-col">
        <Title order={5}>{locale.ui.choose_color}</Title>
        <Group position="left" spacing={"xs"} align="center">
          {carDefaultColors.map((color) => (
            <ColorSwatch
              key={color}
              radius={"sm"}
              component="button"
              color={color}
              onClick={() => setChecked(color)}
              withShadow={true}
              sx={{ color: "#fff", cursor: "pointer" }}
            >
              {checked === color && <CheckIcon width={rem(12)} />}
            </ColorSwatch>
          ))}
        </Group>
      </Box>
      <Group position="apart">
        <Title order={5}>{locale.ui.rental_dur}</Title>
        <Select
          dropdownPosition="bottom"
          size="md"
          className="w-36"
          placeholder={locale.ui.rental_dur_placeholder}
          defaultValue={"1"}
          data={[
            { value: "1", label: `${locale.ui.one_hour}` },
            { value: "2", label: `${locale.ui.two_hours}` },
            { value: "3", label: `${locale.ui.three_hours}` },
            { value: "4", label: `${locale.ui.four_hours}` },
          ]}
          onChange={setHoursRent}
          styles={() => ({
            item: {
              "&[data-selected]": {
                "&, &:hover": {
                  color: "black",
                },
              },
            },
          })}
        />
      </Group>
      <Box className="flex flex-col">
        <Group position="apart" className=" rounded-t-md p-2">
          <Title order={4}>{locale.ui.total}</Title>
          <Title order={2} className="tracking-wide">
            <CountUp end={TotalAmount} duration={0.5} prefix="$" />
          </Title>
        </Group>
        <Button.Group>
          <Button
            fullWidth
            className="text-black rounded-t-none rounded-b-md"
            leftIcon={<IconCash />}
            onClick={() => handlePayment("cash")}
          >
            {locale.ui.cash}
          </Button>
          <Button
            fullWidth
            className="text-black rounded-t-none rounded-b-md"
            leftIcon={<IconCreditCard />}
            onClick={() => handlePayment("card")}
          >
            {locale.ui.card}
          </Button>
        </Button.Group>
      </Box>
    </Box>
  )
}

export default RentalModal
