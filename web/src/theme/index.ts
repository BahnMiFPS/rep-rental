import { MantineThemeOverride, createStyles, rem } from "@mantine/core"

export const theme: MantineThemeOverride = {
  fontFamily: "MontSerrat",
  shadows: { sm: "1px 1px 3px rgba(0, 0, 0, 0.5)" },
  components: {},
}

export const useGeneralStyles = createStyles((theme) => ({
  // FeaturesCard
  card: {
    backgroundColor:
      theme.colorScheme === "dark" ? theme.colors.dark[7] : theme.white,
    border: "1px solid",
    borderColor:
      theme.colorScheme === "dark"
        ? theme.colors.dark[6]
        : theme.colors.gray[3],
  },
  cardTop: {
    padding: theme.spacing.md,
    borderBottom: "1px solid",
    borderColor:
      theme.colorScheme === "dark"
        ? theme.colors.dark[6]
        : theme.colors.gray[3],
    transition: "background 0.3s", // Add a smooth transition
  },
  cardTopActive: {
    background: `linear-gradient(180deg, rgba(0, 0, 0, 0) 25%, ${
      theme.colorScheme === "dark"
        ? "rgba(0, 0, 0, 0.5)"
        : "rgba(0, 0, 0, 0.25)"
    } 95%)`,
    transition: "background 0.3s",
  },
  section: {
    padding: theme.spacing.md,
  },

  icon: {
    marginRight: rem(10),
    color:
      theme.colorScheme === "dark"
        ? theme.colors.dark[2]
        : theme.colors.gray[5],
  },

  title: {
    color: theme.colorScheme === "dark" ? theme.white : theme.black,
  },
  largeButtons: {
    color: theme.colorScheme === "dark" ? theme.white : theme.black,
    backgroundColor:
      theme.colorScheme === "dark" ? theme.colors.dark[6] : theme.white,
    border: `${rem(1)} solid ${
      theme.colorScheme === "dark" ? "transparent" : theme.colors.gray[3]
    }`,
    "&:hover": {
      color: theme.colorScheme === "dark" ? theme.white : theme.white,
      backgroundColor:
        theme.colorScheme === "dark"
          ? theme.colors.primary
          : theme.colors.primary,
    },
  },
  addToCartButton: {
    color: theme.colorScheme === "dark" ? theme.white : theme.black,
    backgroundColor:
      theme.colorScheme === "dark" ? theme.colors.dark[6] : theme.white,
    "&:hover": {
      color: theme.colorScheme === "dark" ? theme.white : theme.white,
      backgroundColor:
        theme.colorScheme === "dark"
          ? theme.colors.primary
          : theme.colors.primary,
    },
  },
  //CartItem.tsx
  rightCardImageSection: {
    marginTop: "calc(-1 * 1rem)",
    marginBottom: "calc(-1 * 1rem)",
    backgroundColor:
      theme.colorScheme === "dark"
        ? theme.colors.dark[5]
        : theme.colors.gray[1],
  },
  imageSection: {
    padding: 0,
  },

  label: {
    lineHeight: 1,

    fontSize: theme.fontSizes.xs,
    letterSpacing: rem(-0.25),
    textTransform: "uppercase",
    color: theme.colorScheme === "dark" ? theme.white : theme.colors.gray[7],
  },

  labelMarginRightToIcon: {
    marginRight: rem(3),
  },

  moneyIconColor: {
    color:
      theme.colorScheme === "dark"
        ? theme.colors.dark[1]
        : theme.colors.gray[7],
  },

  weightIconColor: {
    color:
      theme.colorScheme === "dark"
        ? theme.colors.dark[1]
        : theme.colors.gray[7],
  },

  cashIconColor: {
    color:
      theme.colorScheme === "dark"
        ? theme.colors.green[5]
        : theme.colors.green[7],
  },

  cardIconColor: {
    color:
      theme.colorScheme === "dark"
        ? theme.colors.yellow[5]
        : theme.colors.yellow[9],
  },
  link: {
    color:
      theme.colorScheme === "dark"
        ? theme.colors.dark[0]
        : theme.colors.gray[7],
    "&:hover": {
      cursor: "pointer",
      color: theme.colorScheme === "dark" ? theme.white : theme.black,
    },
  },

  textColorPrimary: {
    color: theme.colors.primary,
  },
}))
