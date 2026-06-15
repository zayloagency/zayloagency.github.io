# Zaylo — Design System

**Memorable thing**: "Esto es para mi negocio" — el dueño de una barbería o restaurante de Madrid se ve reflejado.
**Scope**: Portfolio de la agencia (`index.html`). Las demos de clientes tienen su propia identidad por sector.
**Decisión de diseño**: Alejarse del idioma SaaS genérico (indigo/glassmorphism/orbes) hacia algo cálido, artesanal y editorial que refleje el tipo de negocios a los que sirve Zaylo.

---

## Aesthetic Direction

**Editorial/Artesanal** — Dark con calidez. Tipografía protagonista. La galería de demos es el pitch.

No un portfolio de diseñador compitiendo con otros diseñadores. No una tech startup de Silicon Valley.
Un estudio que hace cosas reales para negocios reales en Madrid.

---

## Color System

```css
:root {
  /* Backgrounds */
  --bg:      #0c0a08;   /* negro-marrón cálido (no azul frío) */
  --bg2:     #131109;   /* sección alternada */
  --surface: #1a1713;   /* cards, panels */
  --border:  rgba(232, 168, 76, 0.12);  /* gold border sutil */

  /* Accent — ambar dorado */
  --amber:   #e8a84c;   /* acento principal */
  --amber-l: #f2c06e;   /* hover / highlight */
  --amber-d: #c88c30;   /* pressed */
  --amber-bg: rgba(232, 168, 76, 0.08); /* tinted backgrounds */

  /* Secondary — violeta (soporte, no protagonista) */
  --violet:  #5e6ad2;
  --violet-bg: rgba(94, 106, 210, 0.08);

  /* Text */
  --text:    #f0ebe3;   /* blanco cálido / crema */
  --text2:   #a89e92;   /* secundario cálido */
  --text3:   #7a7067;   /* muted / placeholder */

  /* Semantic */
  --success: #4ade80;
  --error:   #f87171;
}
```

**Rationale**: El ambar conecta el portfolio con las demos de clientes (la barbería usa `#c9a84c`). El negro-marrón aleja a Zaylo de la SaaS genérica. Los dos acentos (ambar + violeta) permiten jerarquía sin monotonía.

---

## Typography

| Rol | Fuente | Peso | Google Fonts |
|-----|--------|------|-------------|
| Display / Hero | **Fraunces** | 300–700 (variable) | `Fraunces:ital,opsz,wght@0,9..144,300..700;1,9..144,300` |
| Subheads / UI labels | **Syne** | 400–700 | `Syne:wght@400..700` |
| Body / paragraphs | **DM Sans** | 300–500 | `DM+Sans:ital,wght@0,300;0,400;0,500;1,300` |

```html
<link href="https://fonts.googleapis.com/css2?family=Fraunces:ital,opsz,wght@0,9..144,300..700;1,9..144,300..400&family=Syne:wght@400;500;600;700&family=DM+Sans:ital,wght@0,300;0,400;0,500;1,300&display=swap" rel="stylesheet">
```

```css
h1, h2, .display { font-family: 'Fraunces', Georgia, serif; }
h3, h4, nav, label, .tag { font-family: 'Syne', sans-serif; }
body, p, .body { font-family: 'DM Sans', sans-serif; }
```

**Rationale**: Fraunces es un serif variable con personalidad editorial — dice "tenemos criterio". Es lo opuesto de Space Grotesk (overused) e Inter (aún más overused). Syne aporta un contrapeso geométrico y moderno sin caer en lo genérico. DM Sans tiene más carácter que Inter con la misma legibilidad.

---

## Type Scale

```css
.t-hero  { font-size: clamp(52px, 9vw, 100px); line-height: 0.95; letter-spacing: -0.03em; }
.t-h1    { font-size: clamp(38px, 6vw, 72px);  line-height: 1.0;  letter-spacing: -0.025em; }
.t-h2    { font-size: clamp(28px, 4vw, 48px);  line-height: 1.1;  letter-spacing: -0.02em; }
.t-h3    { font-size: clamp(20px, 2.5vw, 28px); line-height: 1.2; }
.t-body  { font-size: 16px; line-height: 1.7; }
.t-small { font-size: 13px; line-height: 1.5; letter-spacing: 0.01em; }
.t-label { font-size: 11px; letter-spacing: 0.1em; text-transform: uppercase; font-family: 'Syne', sans-serif; font-weight: 600; }
```

---

## Spacing System

**Base unit**: 8px

| Token | Value | Use |
|-------|-------|-----|
| `--sp-1` | 8px | gaps internos de componentes |
| `--sp-2` | 16px | padding small elements |
| `--sp-3` | 24px | padding cards |
| `--sp-4` | 32px | padding medium sections |
| `--sp-6` | 48px | separación entre grupos |
| `--sp-8` | 64px | separación entre secciones cortas |
| `--sp-16` | 128px | padding de sección (desktop) |
| `--sp-24` | 192px | sección XL (hero padding) |

**Max-width**: 1200px / contenido centrado. Layout interno no centrado — alineado a izquierda en la mayoría de secciones.

---

## Layout Principles

- **Hero**: Alineado a izquierda (no centrado). Tipografía grande. Galería de demos visible en el primer fold o como segundo bloque inmediato.
- **Demo gallery**: Pantalla completa o casi. Las capturas de las demos son la mejor prueba social.
- **Cards**: `border-radius: 4px` — no las esquinas redondeadas genéricas (12-16px). La angularidad dice "precision".
- **Grid**: 12 columnas, gap de 24px desktop / 16px mobile.

---

## Motion

**Filosofía**: Intencional. Cada animación tiene una razón. Sin orbes flotantes. Sin partículas. Sin glassmorphism animated backgrounds.

```css
/* Reveal: texto aparece de abajo con fade */
.rv {
  opacity: 0;
  transform: translateY(32px);
  transition: opacity 0.7s cubic-bezier(0.16, 1, 0.3, 1),
              transform 0.7s cubic-bezier(0.16, 1, 0.3, 1);
}
.rv.on { opacity: 1; transform: none; }

/* Stagger delays */
.d1 { transition-delay: 0.1s; }
.d2 { transition-delay: 0.2s; }
.d3 { transition-delay: 0.3s; }
.d4 { transition-delay: 0.45s; }

/* Hover states */
--ease-out-expo: cubic-bezier(0.16, 1, 0.3, 1);
```

Animaciones en uso:
- **Reveal** — elementos entran con `translateY + opacity` via IntersectionObserver
- **Counter** — números estadísticos cuentan desde 0 al entrar en viewport
- **Hover** — cards suben `4px` con `box-shadow` amber al hover
- **Nav** — se fija con `backdrop-filter: blur(20px)` y border amber sutil al hacer scroll

---

## Component Patterns

### Buttons
```css
.btn-primary {
  background: var(--amber);
  color: var(--bg);
  font-family: 'Syne', sans-serif;
  font-size: 14px;
  font-weight: 600;
  letter-spacing: 0.04em;
  padding: 14px 28px;
  border-radius: 4px;
  transition: background 0.2s, transform 0.2s;
}
.btn-primary:hover { background: var(--amber-l); transform: translateY(-2px); }

.btn-secondary {
  background: transparent;
  color: var(--text);
  border: 1px solid var(--border);
  /* mismo padding/font que primary */
}
.btn-secondary:hover { border-color: var(--amber); color: var(--amber); }
```

### Tags / Labels
```css
.tag {
  font-family: 'Syne', sans-serif;
  font-size: 11px;
  font-weight: 600;
  letter-spacing: 0.1em;
  text-transform: uppercase;
  color: var(--amber);
  border: 1px solid rgba(232, 168, 76, 0.25);
  background: rgba(232, 168, 76, 0.06);
  border-radius: 100px;
  padding: 5px 14px;
}
```

### Cards
```css
.card {
  background: var(--surface);
  border: 1px solid var(--border);
  border-radius: 4px;
  padding: 32px;
  transition: border-color 0.3s, transform 0.3s;
}
.card:hover {
  border-color: rgba(232, 168, 76, 0.3);
  transform: translateY(-4px);
}
```

---

## Section: Hero

**No foto de stock. No orbes. El texto es la imagen.**

```
[TAG: AGENCIA DIGITAL · MADRID]

Webs que hacen
que te llamen.

[cuerpo: Para barberías, restaurantes, clínicas y negocios locales.
Tu web lista en 5 días. Sin tecnicismos.]

[CTA: Ver demos →]  [CTA secundario: Hablar con nosotros]
```

Hero bg: `--bg` puro. Una línea horizontal sutil en amber después del hero. No grid, no orbes.

---

## Section: Demo Gallery

**Primera sección real después del hero.** Cuadrícula de previews de demos de clientes con overlay al hover que muestra el sector.

Estructura:
- Grid 3 columnas (desktop) / 1 columna (mobile)
- Cada card: screenshot/iframe de la demo + etiqueta de sector en amber
- Al hover: overlay oscuro + botón "Ver demo →" en amber

---

## Section: Services / Pricing

**Directo. Sin jargon.**

Tabla o cards simples con:
- Precio visible
- Lista de lo que incluye (sin tecnicismos)
- CTA directo por WhatsApp

---

## What NOT to Do (anti-patterns)

- No gradientes `indigo → purple` como acento principal
- No glassmorphism (cards con `backdrop-filter` como elemento primario de diseño)
- No orbes animados en el hero
- No `border-radius: 12-16px` en todas las cards (usar 4px)
- No `Space Grotesk` como font principal
- No titulares centrados en todas las secciones — izquierda-alineados por defecto
- No "3 columnas de features con iconos en círculos de color"
- No "Built for X / Designed for Y" en los textos de marketing

---

## Implementation Priority

1. Cambiar `--bg` de `#060610` a `#0c0a08` (warm shift)
2. Reemplazar acentos indigo/purple con amber `#e8a84c`
3. Migrar fonts a Fraunces + Syne + DM Sans (quitar Space Grotesk e Inter)
4. Rediseñar hero: left-aligned, Fraunces grande, sin orbes
5. Añadir sección de demo gallery
6. Ajustar cards: border-radius 4px, border amber sutil

---

*Generado con gstack design-consultation · 2026-06-15*
