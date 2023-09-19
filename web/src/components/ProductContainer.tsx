import { SimpleGrid } from "@mantine/core"
import { FeaturesCard } from "./FeatureCards"
import { AnimatePresence, motion } from "framer-motion"
import { useState } from "react"
import { useShopData } from "../providers/ShopDataProvider"

function ProductContainer() {
  const [animationCompleted, setAnimationCompleted] = useState(false)
  const { vehicles } = useShopData()
  return (
    <SimpleGrid cols={4}>
      <AnimatePresence>
        {vehicles.map((car, index) => (
          <motion.div
            onAnimationComplete={() => {
              setAnimationCompleted(true)
            }}
            key={car.label}
            initial={{
              opacity: animationCompleted ? 1 : 0,
              y: animationCompleted ? 1 : 50,
            }}
            animate={{ opacity: 1, y: 0 }}
            transition={{
              duration: 0.2,
              delay: index * 0.1,
              type: "tween",
            }}
          >
            <FeaturesCard car={car} key={car.label} />
          </motion.div>
        ))}
      </AnimatePresence>
    </SimpleGrid>
  )
}

export default ProductContainer
