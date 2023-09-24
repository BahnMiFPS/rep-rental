import {
  Card,
  Image,
  Text,
  Group,
  createStyles,
  Button,
  rem,
  Title,
  Modal,
} from "@mantine/core"

import { useDisclosure } from "@mantine/hooks"
import { Car } from "../typings/Car"
import RentalModal from "./RentalModal"
import { useEffect } from "react"
import { useShopData } from "../providers/ShopDataProvider"
import CountUp from "react-countup"
import { useLocales } from "../providers/LocaleProvider"

const useStyles = createStyles((theme) => ({
  card: {
    backgroundColor:
      theme.colorScheme === "dark" ? theme.colors.dark[7] : theme.white,
  },

  imageSection: {
    padding: theme.spacing.md,
    display: "flex",
    flexDirection: "column",
    gap: theme.spacing.sm,
  },

  label: {
    marginBottom: theme.spacing.xs,
    lineHeight: 1,
    fontWeight: 700,
    fontSize: theme.fontSizes.xs,
    letterSpacing: rem(-0.25),
    textTransform: "uppercase",
  },

  section: {
    padding: theme.spacing.md,
    borderTop: `${rem(1)} solid ${
      theme.colorScheme === "dark" ? theme.colors.dark[4] : theme.colors.gray[3]
    }`,
  },

  icon: {
    marginRight: rem(5),
    color:
      theme.colorScheme === "dark"
        ? theme.colors.dark[2]
        : theme.colors.gray[5],
  },
}))

interface FeatureCardsProps {
  car: Car
}

export function FeaturesCard({ car }: FeatureCardsProps) {
  const { locale } = useLocales()
  const { classes } = useStyles()
  const { label, money, img, model } = car
  const [opened, { open, close }] = useDisclosure(false)
  const { visible, closeUi } = useShopData()

  useEffect(() => {
    const handleEscKeyPressed = (e: KeyboardEvent) => {
      if (e.key === "Escape" && visible && !opened) {
        closeUi()
      }
    }
    window.addEventListener("keydown", handleEscKeyPressed)
    return () => {
      window.removeEventListener("keydown", handleEscKeyPressed)
    }
  }, [visible, opened, closeUi]) // Include 'opened' and 'closeUi' in the dependency array

  return (
    <>
      <Card withBorder radius="sm" className={classes.card}>
        <Card.Section className={classes.imageSection}>
          <Image
            src={img ? img : `https://docs.fivem.net/vehicles/${model}.webp`}
            alt={model}
            width={"100%"}
            height={"auto"}
          />
        </Card.Section>

        <Card.Section className={classes.section}>
          <Title order={3} className="self-start tracking-tight ">
            {label}
          </Title>
          <Group spacing={10} position="apart">
            <div className="flex gap-1">
              <Text fz="lg" fw={700} sx={{ lineHeight: 1 }}>
                <CountUp end={money} prefix="$" />
              </Text>
              <Text
                fz="sm"
                c="dimmed"
                className="tracking-tighter"
                fw={500}
                sx={{ lineHeight: 1 }}
                mt={3}
              >
                {locale.ui.per_hour}
              </Text>
            </div>

            <Button
              size="sm"
              radius="xl"
              className="text-neutral-950"
              onClick={open}
            >
              {locale.ui.rent}
            </Button>
          </Group>
        </Card.Section>
      </Card>
      <Modal
        opened={opened}
        title={
          <Image
            src={"./assets/EscaleraLogo.png"}
            alt="Logo"
            style={{ maxWidth: "75px", maxHeight: "50px" }}
          />
        }
        styles={{
          header: {
            backgroundColor: "rgb(253 224 71)",
            padding: "8px 16px 8px 16px",
          },
        }}
        size={"sm"}
        onClose={close}
        centered
        closeButtonProps={{ color: "dark" }}
      >
        <RentalModal car={car} />
      </Modal>
    </>
  )
}
