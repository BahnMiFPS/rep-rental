import React from "react"
import { Box, MantineProvider, ScrollArea } from "@mantine/core"

import { theme } from "../theme"
import { useShopData } from "../providers/ShopDataProvider"
import ScaleFade from "../transitions/ScaleFade"
import Header from "./Header"
import ProductContainer from "./ProductContainer"
import { fetchNui } from "../utils/fetchNui"

const App: React.FC = () => {
  const { config, visible } = useShopData()
  fetchNui("init")
  return (
    <MantineProvider
      withNormalizeCSS
      withGlobalStyles
      theme={{ ...theme, ...config }}
    >
      <ScaleFade visible={visible}>
        <div className="flex items-center justify-center h-screen w-screen">
          <Box className="w-2/3 h-3/4 rounded-md flex flex-col">
            <Header />
            <ScrollArea
              className="bg-neutral-100 p-4 rounded-b-md"
              scrollbarSize={"6"}
              offsetScrollbars={true}
              style={{ color: "red" }}
              styles={() => ({
                scrollbar: {
                  '&[data-orientation="vertical"] .mantine-ScrollArea-thumb': {
                    backgroundColor: "rgb(250, 204, 51)",
                  },
                },
              })}
            >
              <ProductContainer />
            </ScrollArea>
          </Box>
        </div>
      </ScaleFade>
    </MantineProvider>
  )
}

export default App
