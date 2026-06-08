---
name: CampusKart
colors:
  surface: '#f7f9fb'
  surface-dim: '#d8dadc'
  surface-bright: '#f7f9fb'
  surface-container-lowest: '#ffffff'
  surface-container-low: '#f2f4f6'
  surface-container: '#eceef0'
  surface-container-high: '#e6e8ea'
  surface-container-highest: '#e0e3e5'
  on-surface: '#191c1e'
  on-surface-variant: '#3d4a3d'
  inverse-surface: '#2d3133'
  inverse-on-surface: '#eff1f3'
  outline: '#6d7b6c'
  outline-variant: '#bccbb9'
  surface-tint: '#006e2f'
  primary: '#006e2f'
  on-primary: '#ffffff'
  primary-container: '#22c55e'
  on-primary-container: '#004b1e'
  inverse-primary: '#4ae176'
  secondary: '#735c00'
  on-secondary: '#ffffff'
  secondary-container: '#fed01b'
  on-secondary-container: '#6f5900'
  tertiary: '#545f73'
  on-tertiary: '#ffffff'
  tertiary-container: '#a1acc3'
  on-tertiary-container: '#354053'
  error: '#ba1a1a'
  on-error: '#ffffff'
  error-container: '#ffdad6'
  on-error-container: '#93000a'
  primary-fixed: '#6bff8f'
  primary-fixed-dim: '#4ae176'
  on-primary-fixed: '#002109'
  on-primary-fixed-variant: '#005321'
  secondary-fixed: '#ffe083'
  secondary-fixed-dim: '#eec200'
  on-secondary-fixed: '#231b00'
  on-secondary-fixed-variant: '#574500'
  tertiary-fixed: '#d8e3fb'
  tertiary-fixed-dim: '#bcc7de'
  on-tertiary-fixed: '#111c2d'
  on-tertiary-fixed-variant: '#3c475a'
  background: '#f7f9fb'
  on-background: '#191c1e'
  surface-variant: '#e0e3e5'
typography:
  display-lg:
    fontFamily: Lexend
    fontSize: 40px
    fontWeight: '700'
    lineHeight: 48px
    letterSpacing: -0.02em
  headline-lg:
    fontFamily: Lexend
    fontSize: 32px
    fontWeight: '600'
    lineHeight: 40px
    letterSpacing: -0.01em
  headline-lg-mobile:
    fontFamily: Lexend
    fontSize: 24px
    fontWeight: '600'
    lineHeight: 32px
  title-md:
    fontFamily: Lexend
    fontSize: 20px
    fontWeight: '600'
    lineHeight: 28px
  body-lg:
    fontFamily: Inter
    fontSize: 18px
    fontWeight: '400'
    lineHeight: 28px
  body-md:
    fontFamily: Inter
    fontSize: 16px
    fontWeight: '400'
    lineHeight: 24px
  label-md:
    fontFamily: Inter
    fontSize: 14px
    fontWeight: '500'
    lineHeight: 20px
    letterSpacing: 0.01em
  label-sm:
    fontFamily: Inter
    fontSize: 12px
    fontWeight: '600'
    lineHeight: 16px
rounded:
  sm: 0.5rem
  DEFAULT: 1rem
  md: 1.5rem
  lg: 2rem
  xl: 3rem
  full: 9999px
spacing:
  base: 4px
  container-padding: 1.25rem
  stack-gap: 1rem
  grid-gutter: 1rem
  section-margin: 2rem
---

## Brand & Style
The design system is engineered for the high-velocity environment of university life. It prioritizes speed of interaction and cognitive ease, ensuring students can request errands or deliveries between classes with zero friction. The brand personality is dependable yet energetic—acting as a reliable "campus companion" rather than a formal utility.

The visual style follows a **Modern Minimalism** approach with **Tactile** influences. It utilizes generous whitespace to reduce visual noise, while employing large, friendly touch targets and rounded geometry to maintain an approachable, student-first atmosphere. The aesthetic is clean and systematic, reflecting the efficiency of the service.

## Colors
The palette is designed to stand out on campus while maintaining a sense of professional reliability.

- **Primary (Vibrant Green):** Used for main actions, success states, and brand presence. It signals growth and trust.
- **Secondary (Energetic Yellow):** Reserved for highlights, attention-grabbing accents (like "New" badges), and secondary ratings. It injects a sense of optimism.
- **Tertiary (Slate):** A deep charcoal used for high-contrast text and grounding elements to ensure the UI feels sophisticated.
- **Neutral (Ghost White):** The foundation of the interface. This light gray/white mix provides a clean canvas that keeps the focus on content and photography.

## Typography
Typography is split between two high-performance sans-serifs. **Lexend** is utilized for headings; its unique design originally intended for reading proficiency makes it incredibly legible for quick-scanning of titles and prices. **Inter** handles all body copy and UI labels, providing a systematic and neutral tone that ensures functional clarity across dense lists and forms.

Weight is used strategically: Semi-bold and Bold for Lexend to establish hierarchy, and Medium for Inter labels to ensure they don't disappear against the light neutral backgrounds.

## Layout & Spacing
The layout uses a **Fluid Grid** model with a mobile-first focus. On mobile devices, a 4-column grid with 20px (1.25rem) side margins is standard. Desktop views expand to a 12-column centered layout with a maximum container width of 1200px.

Spacing follows a strict 4px base unit. 
- **Internal Card Padding:** Always 16px or 20px to accommodate the large corner radii.
- **Vertical Rhythm:** 24px-32px between different logical sections (e.g., "Recent Orders" vs "Services").
- **Touch Targets:** Minimum 48x48px for all interactive elements to ensure ease of use while walking.

## Elevation & Depth
Depth is created through **Tonal Layers** and **Ambient Shadows**. 

The background is a flat neutral gray. Interactive elements (Cards, Buttons) sit on a pure white surface. To create a "floating" effect that feels modern and approachable, use soft, low-opacity shadows (e.g., `0px 4px 20px rgba(0,0,0,0.06)`). This "Card-on-Surface" approach clearly demarcates different errand categories. 

Avoid harsh borders. Instead, use thin, 1px strokes in a slightly darker neutral shade only when elements need to be separated within the same surface.

## Shapes
The shape language is extremely friendly and "bubbly." The **Pill-shaped (3)** setting is the standard for the design system.

- **Standard Cards:** 20px (1.25rem) radius to create a soft, safe aesthetic.
- **Buttons:** Fully rounded (pill) to maximize the "actionable" look.
- **Input Fields:** 16px (1rem) radius to maintain consistency with the card language.
- **Images:** Should always follow the container's corner radius for a nested, integrated look.

## Components
- **Buttons:** Primary buttons are vibrant Green with white text. Secondary buttons are Ghost White with a thin border and Slate text. Always use pill shapes.
- **Service Cards:** Use a vertical stack with a large 1:1 aspect ratio icon/image at the top, a Lexend title, and a small Inter label for "Estimated Time."
- **Status Chips:** Small, pill-shaped indicators for order status (e.g., "In Progress," "Delivered"). Use low-saturation background tints of the status color with high-saturation text.
- **Input Fields:** Large, 56px height fields with 16px padding. Labels should float or stay above the field in a `label-sm` style.
- **Floating Action Button (FAB):** A primary Green circle icon button for "Quick Errand" or "Support," always floating in the bottom right on mobile.
- **Lists:** Clean, borderless rows with a 16px gap. Each row should have a trailing chevron or an "Order Again" button for efficiency.