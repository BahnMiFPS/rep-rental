import { Box, CloseButton, Image } from "@mantine/core"
import { useShopData } from "../providers/ShopDataProvider"

function Header() {
  const { closeUi } = useShopData()

  return (
    <Box className="w-full h-12 flex flex-row justify-between items-center bg-yellow-300 p-4 rounded-t-md">
      <Box className="w-24 flex items-center justify-center ">
        <Image src={"./assets/EscaleraLogo.png"} />
      </Box>
      <CloseButton className="text-black" size={"md"} onClick={closeUi} />
    </Box>
  )
}

export default Header
