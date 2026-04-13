// Lacy Morrow - Resume (Typst)
// Compile: typst compile resume.typ resume.pdf
// Watch:   typst watch resume.typ resume.pdf

// ── Configuration ──────────────────────────────────────────────────────────
// Set to true for the full 5-page version, false for the concise 2-page version
#let complete = true

// ── Colors & Fonts ─────────────────────────────────────────────────────────
#let accent   = rgb("#4abbc9")  // Cyan accent from original resume
#let grey     = rgb("#888888")
#let darkgrey = rgb("#555555")
#let black    = rgb("#333333")

// ── Page Setup ─────────────────────────────────────────────────────────────
#set page(
  paper: "us-letter",
  margin: (top: 0.5in, bottom: 0.6in, left: 0.7in, right: 0.7in),
  footer: context {
    set text(size: 8pt, fill: grey)
    align(center)[References available upon request. For a complete portfolio please visit #link("https://lacymorrow.com")[lacymorrow.com]]
  },
)

#set text(font: "Helvetica Neue", size: 9.5pt, fill: black)
#set par(leading: if complete { 0.55em } else { 0.5em })

// ── Helper Functions ───────────────────────────────────────────────────────

#let section-heading(title) = {
  v(if complete { 8pt } else { 6pt })
  text(size: 9pt, weight: "bold", fill: grey, tracking: 2pt, upper(title))
  v(2pt)
}

#let entry(
  dates: "",
  company: "",
  title: "",
  bullets: (),
  tech: "",
) = {
  v(if complete { 6pt } else { 4pt })
  grid(
    columns: (1fr, 3.4fr),
    column-gutter: 12pt,
    align(right)[
      #text(size: 9pt, weight: "bold", fill: accent)[#dates]
      #if company != "" {
        linebreak()
        text(size: 9pt, weight: "bold", fill: accent)[#company]
      }
    ],
    [
      #text(size: 10pt, weight: "bold", fill: accent)[#title]
      #for bullet in bullets {
        linebreak()
        text(size: 9pt)[• #bullet]
      }
      #if tech != "" {
        linebreak()
        text(size: 9pt)[• #text(fill: darkgrey)[#tech]]
      }
    ],
  )
}

#let project-entry(
  year: "",
  name: "",
  tagline: "",
  description: "",
) = {
  v(4pt)
  grid(
    columns: (1fr, 3.4fr),
    column-gutter: 12pt,
    align(right)[
      #text(size: 9pt, weight: "bold", fill: accent)[#year]
      #linebreak()
      #text(size: 9pt, weight: "bold", fill: accent)[#name]
    ],
    [
      #text(size: 10pt, weight: "bold", fill: accent)[#tagline]
      #linebreak()
      #text(size: 9pt)[#description]
    ],
  )
}

#let agency-entry(
  year: "",
  client: "",
  url: "",
  description: "",
) = {
  v(3pt)
  grid(
    columns: (1fr, 3.4fr),
    column-gutter: 12pt,
    align(right)[
      #text(size: 9pt, weight: "bold", fill: accent)[#year]
      #linebreak()
      #text(size: 9pt, weight: "bold", fill: accent)[#client]
    ],
    [
      #text(size: 9pt, weight: "bold", fill: accent)[#link("https://" + url)[#url]]
      #linebreak()
      #text(size: 9pt)[#description]
    ],
  )
}

// ════════════════════════════════════════════════════════════════════════════
// HEADER
// ════════════════════════════════════════════════════════════════════════════

#grid(
  columns: (1fr, auto),
  [
    #text(size: 32pt, weight: "bold", fill: black)[Lacy Morrow]
    #linebreak()
    #text(size: 11pt, fill: darkgrey)[Agentic & web engineer + open-source developer + hardware hacker]
  ],
  align(right)[
    #text(size: 10pt)[
      704.451.6680 \
      #link("https://www.lacymorrow.com")[www.lacymorrow.com] \
      #link("mailto:me@lacymorrow.com")[me\@lacymorrow.com]
    ]
  ],
)

#line(length: 100%, stroke: 2pt + accent)

// ════════════════════════════════════════════════════════════════════════════
// SUMMARY
// ════════════════════════════════════════════════════════════════════════════

#v(4pt)
#text(size: 10pt)[Over 20 years as a *Web Developer* building accessible, well-architected sites and apps.]

#v(2pt)
#grid(
  columns: (1fr, 3.4fr),
  column-gutter: 12pt,
  align(right)[
    #section-heading("Expertise")
  ],
  [
    #v(8pt)
    #text(size: 9pt)[Agentic engineer + Full-stack developer + Hardware Engineer; Agency owner; Tech/Development lead; Product/Project manager; DevOps; IT consultant; Software architect; Hiring manager; SCRUM master]
    #v(4pt)
    #text(size: 9pt)[I especially enjoy *TypeScript*, *React*, *NextJS*, and *Electron/Tauri*]
  ],
)

// ════════════════════════════════════════════════════════════════════════════
// DEVELOPER EXPERIENCE
// ════════════════════════════════════════════════════════════════════════════

#grid(
  columns: (1fr, 3.4fr),
  column-gutter: 12pt,
  [
    #section-heading("Developer\nExperience")
    #v(2pt)
    #text(size: 8pt, fill: grey)[_Continued below..._]
  ],
  [],
)

#entry(
  dates: "2025 - 2026",
  company: "Duke Energy",
  title: "Agentic Engineer + Senior Developer",
  bullets: (
    "Created internal GPT setup for company use.",
    [Contract - Refactored a *weather-forecasting dashboard* to deploy to AWS and migrated *authentication to Azure A/D* (Active Directory) from user/password],
  ),
  tech: "Python, React, Docker, AWS, Azure, Regex, Cron",
)

#entry(
  dates: "2025",
  company: "Credit Karma",
  title: "Full-Stack Next.js Developer",
  bullets: (
    [Contract - Created the entire *User Testing dashboard* for Credit Karma for the User Management team. Converted pages router to App router. Built features for creating test/production users across the *web and mobile* experience. Included search and metrics coordinated across multiple system APIs.],
  ),
  tech: "TypeScript, NextJS, React, Tachyons, React Native",
)

#entry(
  dates: "2024",
  company: [Novant Health \ Red Ventures],
  title: "Full-Stack Next.js Developer",
  bullets: (
    [Contract - Build and maintained *Physician Finder*, Matcher, and landing pages sites for Novant to locate doctors. Legacy code was sunsetted and new, modern websites were built using TypeScript, *NextJS*, and *Vue*, tooled with Datadog/Netlify.],
  ),
)

#entry(
  dates: "2024",
  company: [OptumRX Health \ Red Ventures],
  title: "Senior React Developer + DevOps Engineer",
  bullets: (
    [Contract - Created *E-commerce* site for RVO Health. Built the market, inventory, authentication, and ordering systems. complete with automation pipelines.],
  ),
  tech: "TypeScript, NextJS, React, Contentful, Plytix, Stripe, Algolia.",
)

#entry(
  dates: "2023",
  company: "Swell Energy",
  title: "Lead Web Developer - Grid Services",
  bullets: (
    [Contract - Developed charts, dashboards, *control panels to manage solar and power utilities* in southern California and Hawaii. Authentication, API, UI, CRUD.],
  ),
  tech: "TypeScript, NextJS, React, Python, Django, Docker, PostgreSQL.",
)

#entry(
  dates: "2022",
  company: "Viasat",
  title: "Senior React Developer - In-Flight Entertainment",
  bullets: (
    "Contract - Managed in-flight entertainment portals for dozens of airlines. On-call.",
    [In charge of *workflow management* and *client-stakeholder relations*. Demoed product updates to stakeholders. Transformed polished designs into reusable components.],
  ),
  tech: "React, TypeScript, NextJS, Jenkins, AWS, MySQL.",
)

#entry(
  dates: "2017 - 2021",
  company: "Twilio",
  title: "Senior Web Engineer - Brand Team",
  bullets: (
    [In charge of #link("https://twilio.com")[twilio.com] and all sub-sites. Managed and lead multiple projects, created a React design system, built the #link("https://github.com/twilio/hackpack-v4")[SIGNAL HackPack v4 badge].],
    "Launched WhatsApp, Studio, Flex, products. Localization/Regionalization.",
    "Implemented testing, migrated blog and legal to Laravel CMS. Worked emergency on-call.",
  ),
  tech: "TypeScript, React, Docker, Python, Django, Wagtail, PHP, WordPress, Laravel.",
)

#entry(
  dates: "2016",
  company: "Yahoo!",
  title: "React A11y Engineer - Accessibility Team",
  bullets: (
    [*AWS*; NodeJS; *Docker*; SequelizeJS; *React Native*],
    "Contract - Built several React components on a Yahoo stack for the Search and Branded Marketing teams using Tumblr as a data serve API.",
  ),
  tech: "OpenStack; Apache; Linux; NodeJS; ReactJS, Electron, NW.js, Selenium.",
)

#entry(
  dates: "2014 - 2015",
  company: "Invitae",
  title: "Software Engineer",
  bullets: (
    [Created and maintained *HIPAA-compliant* back office software, data science tools, and analytics software as well as the public-facing invitae.com;],
    "UX/UI Developer - Developed navigation, modals, and interactions; Made custom WordPress theme;",
    "DevOps - Managed database health, configured continuous integration instances, web-hooks, bi-weekly deployments. Created an automated Selenium testing workflow; Tech Interviewer.",
  ),
  tech: "Python, PHP, Laravel, MySQL, Django, Flask, Angular, Backbone, React, WordPress, ElasticSearch, NightwatchJS, Mercurial, Docker, Jenkins, Splunk, Apache, AWS EC2, Linux.",
)


// ════════════════════════════════════════════════════════════════════════════
// PERSONAL SECTION
// ════════════════════════════════════════════════════════════════════════════

#grid(
  columns: (1fr, 3.4fr),
  column-gutter: 12pt,
  align(right)[#section-heading("Personal")],
  [],
)

// Tech Stack
#v(2pt)
#grid(
  columns: (1fr, 3.4fr),
  column-gutter: 12pt,
  align(right)[
    #text(size: 9pt, fill: grey)[❤ *TECH STACK*]
  ],
  [
    #text(size: 9pt, style: "italic")[frameworks: React/Next.js/Svelte/Astro/Vue]
    #v(2pt)
    #grid(
      columns: (2.5fr, auto),
      row-gutter: 3pt,
      text(size: 9pt)[Frontend: TS / JS / HTML / CSS / SASS], text(size: 9pt, style: "italic")[: Expert],
      text(size: 9pt)[Backend: Node / Python / PHP / Rust / Swift / Go], text(size: 9pt, style: "italic")[: Expert],
      text(size: 9pt)[Platform: Electron / Tauri / React Native / Flutter], text(size: 9pt, style: "italic")[: Expert],
    )
  ],
)

// Interests
#v(6pt)
#grid(
  columns: (1fr, 3.4fr),
  column-gutter: 12pt,
  align(right)[#text(size: 9pt, weight: "bold", fill: grey, tracking: 2pt)[INTERESTS]],
  text(size: 9pt)[FPV drone racing, cross-platform development, IoT devices, electronics engineering, 3D-printing, hardware development, problem solving, novel user interaction.],
)

// Qualities
#v(4pt)
#grid(
  columns: (1fr, 3.4fr),
  column-gutter: 12pt,
  align(right)[#text(size: 9pt, weight: "bold", fill: grey, tracking: 2pt)[QUALITIES]],
  text(size: 9pt)[Tech leader. Passionate about quality. Communicative and accessible; Reliable, confident, and eager to build. A highly motivated problem-solver.],
)

// Education
#v(4pt)
#grid(
  columns: (1fr, 3.4fr),
  column-gutter: 12pt,
  align(right)[#text(size: 9pt, weight: "bold", fill: grey, tracking: 2pt)[EDUCATION]],
  [
    #text(size: 9pt, weight: "bold")[B.S. Computer Science]
    #linebreak()
    #text(size: 9pt)[2009 - 2014 | Appalachian State University]
  ],
)


// ════════════════════════════════════════════════════════════════════════════
// OPEN SOURCE (complete version only)
// ════════════════════════════════════════════════════════════════════════════

#if complete [

  #grid(
    columns: (1fr, 3.4fr),
    column-gutter: 12pt,
    align(right)[#section-heading("Open-\nSource")],
    [],
  )

  #project-entry(
    year: "2024",
    name: [Lacy Shell #sym.star],
    tagline: "Lacy Shell: AI Coding Agent for Your Terminal",
    description: "Integrate Codex, Claude Code, or your favorite AI coding CLI into your existing shell.",
  )

  #project-entry(
    year: "2025",
    name: [Juno AI #sym.star],
    tagline: "Juno AI: Voice-Operate Your Computer",
    description: "Rust + Tauri Desktop app built on OpenAI Whisper and Anthropic Computer-use.",
  )

  #project-entry(
    year: "2025",
    name: "Vibe Rehab",
    tagline: "Vibe Rehab: Fix Your Vibe Code",
    description: "Finish your vibe coded projects and get them launched, deployed, and secured.",
  )

  #project-entry(
    year: "2025",
    name: "Hitchhikers Guide",
    tagline: "Hitchhiker's Guide to the Galaxy",
    description: "Completely dynamic website that generates entries as they are requested. Mimicking the guide from the famous Douglas Adams novel.",
  )

  #project-entry(
    year: "2024",
    name: [Shipkit #sym.star],
    tagline: "Shipkit: Next.js Accelerator",
    description: "Full-featured Next.js Starter and toolkit for building, launching, and monetizing MVPs.",
  )

  // Hardware
  #grid(
    columns: (1fr, 3.4fr),
    column-gutter: 12pt,
    align(right)[#section-heading("Hardware")],
    [],
  )

  #project-entry(
    year: "2018",
    name: "Twilio Hackpack",
    tagline: "Twilio Hackpack v4",
    description: "Twilio's Open Source Hardware Badge, built for SIGNAL Conference 2018. Joystick, lights, 7 buttons, a touchscreen, on a Raspberry Pi Zero, in a 3D-printed case.",
  )
]


// ════════════════════════════════════════════════════════════════════════════
// DEVELOPER EXPERIENCE (Continued)
// ════════════════════════════════════════════════════════════════════════════

#grid(
  columns: (1fr, 3.4fr),
  column-gutter: 12pt,
  [
    #section-heading("Developer\nExperience")
    #v(2pt)
    #text(size: 8pt, fill: grey)[_...Continued_]
  ],
  [],
)

#entry(
  dates: "2023",
  company: [Lumenai \ #text(size: 8pt)[(Startup)]],
  title: "Senior Web Engineer - Browser Extension",
  bullets: (
    "Contract Full-Stack Web Developer - Helped create foundational internal apps and build process for a browser extension using RPA automation, React, SASS, Docker",
    [Created dynamic robust UI screens React, Typescript, Jest, automated deployments, and self-built CI/CD. *The company saw a 15% rise in productivity and experienced 35% growth in 6 months.*],
  ),
)

#entry(
  dates: "2023",
  company: "VA - TekSystems",
  title: "React Developer",
  bullets: (
    "Government contract with the VA.",
    "Built health medicine tools + calculators to lessen the amount of information patients had to fill out and help physicians get accurate stats about health issues.",
  ),
)

#entry(
  dates: "2016 - 2017",
  company: [Flymore \ #text(size: 8pt)[(Startup)]],
  title: "Co-Founder / Director of Engineering",
  bullets: (
    [Hosted a camp for kids to build FPV drones with a focus on teaching kids about basic software & electronics. Hosted first drone race in Charlotte, NC: qualifier for Drone Nationals. *Developed software to livestream 4 analog FPV feeds*;],
    "Co-founded and created Flymore LLC Web Identity and Academy website.",
  ),
  tech: "OpenStack; Apache; Linux; ReactJS, GraphQL, Youtube API, WordPress, PHP",
)

#entry(
  dates: "2016",
  company: [Long Game \ #text(size: 8pt)[(Startup)]],
  title: "Web/React Native Developer",
  bullets: (
    "Contract - Helped create a startup's initial mobile app: React web-app and second-iteration React Native app for IOS and Android; Saw first launch to 100+ beta users",
  ),
  tech: "AWS; NodeJS; Docker; SequelizeJS; React Native",
)

#entry(
  dates: "2014 - 2015",
  company: "10up",
  title: "Senior Web Engineer - Electron Team",
  bullets: (
    [Took on every role and responsibility of designing, creating, implementing, deploying, and maintaining a plethora of websites for numerous clients including: *Microsoft*, *Uber*, *AARP*, and Beasley Media.],
  ),
  tech: "Docker; Electron; PHP; WordPress; SASS; Webpack; AWS; Google Analytics",
)

#if complete [

  #entry(
    dates: "2010 - 2014",
    company: [Appalachian \ State University],
    title: "Full-Stack Web Developer",
    bullets: (
      "Full-Stack Web Developer - Built internal websites and scheduling software. Helped develop back office software. Created custom CMS framework with PHP, Postgres used by all campus web pages; DevOps - Managed database and handled deployments.",
    ),
    tech: "PHP, Python, Postgres, MySQL, PHPWebsite, PHPUnit, Git, Apache",
  )

  #entry(
    dates: "2010",
    company: "Red Ventures",
    title: "Web Design Intern",
    bullets: (
      "Front-End Web Developer - Created 10+ branded advertising websites and unique user interactions; Sliced Photoshop files to create HTML emails",
    ),
    tech: "PHP, MySQL, Linux",
  )
]


// ════════════════════════════════════════════════════════════════════════════
// AGENCY EXPERIENCE (complete version only)
// ════════════════════════════════════════════════════════════════════════════

#if complete [

  #grid(
    columns: (1fr, 3.4fr),
    column-gutter: 12pt,
    align(right)[#section-heading("Agency\nExperience")],
    [],
  )

  #agency-entry(
    year: "2025", client: "RCBConstruction", url: "rcbconstructionmgmt.com",
    description: "Web Development for construction company in Charlotte, NC. NextJS, Vercel, Weebly",
  )

  #agency-entry(
    year: "2025", client: "Town Of Harmony", url: "townofharmony.org",
    description: "Complete website build for Town of Harmony, Iredell, North Carolina. Neon, Builder.io",
  )

  #agency-entry(
    year: "2023", client: "Build And Serve", url: "buildandserve.com",
    description: "Web Development and Digital Marketing Agency website. NextJS, Supabase, Netlify",
  )

  #agency-entry(
    year: "2023", client: "Taesanti", url: "taesanti.com",
    description: "Complete web design & development for local community organization. Shopify",
  )

  #agency-entry(
    year: "2022", client: [Space Monkey \ Films], url: "spacemonkeyfilms.us",
    description: "Complete web design & development for Drone Media company in SF. Wix, WP",
  )

  #agency-entry(
    year: "2012 - 2016", client: [Phase2 \ Productions], url: "kimbrattain.com",
    description: "Complete web design & development for Phase2 and Kim Brattain Media. Developed custom WordPress theme. Linux, Apache, MySQL, PHP, WordPress",
  )

  #agency-entry(
    year: "2015", client: [Hold Me Tight \ Charlotte], url: "holdmetightcharlotte.com",
    description: "Complete web, identity, design, and development. Developed custom WordPress theme; Linux, Apache, MySQL, PHP, WordPress",
  )

  #agency-entry(
    year: "2013", client: [Boone Community \ Network], url: "boonecommunitynetwork.com",
    description: "Complete web design & development. Created custom social network developed for the city of Boone, NC; Linux, Apache, MySQL, PHP, SocialEngine",
  )

  #agency-entry(
    year: "2012", client: [Cosmic Cart \ #text(size: 8pt)[(Startup)]], url: "cosmiccart.com",
    description: "Created custom email notification system, authentication system, splash page for product launch; Linux, Apache, MySQL, PHP",
  )

  #agency-entry(
    year: "2012", client: "Charlie's Vision", url: "charliesvision.com",
    description: "Complete web identity, design, and development. Created web presence for a charity fundraiser; Linux, Apache, MySQL, PHP",
  )

  #agency-entry(
    year: "2012", client: "Mission Film Works", url: "missionfilmworks.org",
    description: "Complete web, identity, design, and development. Developed custom WordPress theme. Linux, Apache, MySQL, PHP, WordPress",
  )

  #agency-entry(
    year: "2012", client: "Rae Images", url: "raeimages.com",
    description: "Complete web design & development. Developed custom WordPress theme. Linux, Apache, MySQL, PHP, WordPress",
  )

  #agency-entry(
    year: "2012", client: [Nicholson Yoga \ Therapy], url: "nancynicholsonyogatherapy.com",
    description: "Complete web, identity, design, and development; Linux, Apache",
  )

  #agency-entry(
    year: "2012", client: [All Seasons AC & \ Heating], url: "allseasonsacandhtg.com",
    description: "Redesigned existing website and added CMS features; Linux, Apache, MySQL, PHP",
  )

  #agency-entry(
    year: "2012", client: "Invision Mirrors", url: "invisionmirrors.com",
    description: "Complete web design & development. Developed custom WordPress theme. Linux, Apache, MySQL, PHP, WordPress",
  )

  #agency-entry(
    year: "2011", client: "Patterson Air", url: "gopatterson.com",
    description: "Redesigned existing website. Created seasonal advertising campaign, Apache, PHP",
  )

  #agency-entry(
    year: "2011", client: [Hinson \ Mechanical], url: "hinsonmechanical.com",
    description: "Complete web design & development; Linux, Apache, PHP",
  )

  #agency-entry(
    year: "2011", client: [American \ Comfort], url: "americancomfortsolutions.com",
    description: "Redesigned website and built on Joomla! CMS. Created advertisements; Linux, Apache, MySQL, PHP, Joomla!",
  )

  #agency-entry(
    year: "2010", client: [Effective Media \ Solutions], url: "myeffectivemedia.com",
    description: "Complete web, identity, design, and development. Flash website with HTML fallback; Linux, Apache, Flash",
  )

  #agency-entry(
    year: "2009", client: [Phase2 \ Productions], url: "phase2productions.info",
    description: "Complete web, identity, design, and development. Created custom Flash video player; Linux, Apache, PHP, Flash",
  )

  #agency-entry(
    year: "2009", client: "Susan Morrow", url: "susanmorrow.us",
    description: "Complete web, identity, design, and development; NextJS, React, Vercel",
  )

  #agency-entry(
    year: "2008", client: [College Career \ Advisors], url: "collegecareeradvisors.com",
    description: "Complete web, identity, design, and development; PHP, Linux, Apache",
  )

  #agency-entry(
    year: "2008", client: [Blue Ribbon \ Recipes], url: "barbstrickler.com",
    description: "WordPress setup and customization; Linux, Apache, MySQL, PHP, WordPress",
  )

  #agency-entry(
    year: "2006", client: "IAC Music", url: "iacmusic.com",
    description: "Custom Flash media player & photo slideshow for artist pages; Flash, MySQL, PHP",
  )
]


// ════════════════════════════════════════════════════════════════════════════
// ADDITIONAL OPEN SOURCE (complete version only)
// ════════════════════════════════════════════════════════════════════════════

#if complete [

  #grid(
    columns: (1fr, 3.4fr),
    column-gutter: 12pt,
    [
      #section-heading("Open-\nSource")
      #v(2pt)
      #text(size: 8pt, fill: grey)[_...Continued_]
    ],
    [],
  )

  #project-entry(
    year: "2024",
    name: "OpenClaw Alpaca",
    tagline: "OpenClaw Skills for Trading Stocks, Predictions, and Crypto",
    description: "Created an automating stock trading agent that runs a brokerage account and posts updates and trades to Twitter. Alpaca, Polymarket, Kalshi",
  )

  #project-entry(
    year: "2024",
    name: [Uibrary #sym.star],
    tagline: "Uibrary: Live Collections of UI Component Libraries",
    description: "UI libraries (like shadcn) presented in live, dynamic fashion. Available to remix or install.",
  )

  #project-entry(
    year: "2022",
    name: "React Libraries",
    tagline: "React Component Libraries",
    description: "Open-source component libraries for react. react-ruffle | react-is-online-context | react-github-readme-md",
  )

  #project-entry(
    year: "2015",
    name: [CrossOver #sym.star],
    tagline: "CrossOver: CrossHair Overlay",
    description: "Electron Cross-platform custom crosshairs for PC video games. Featured in the Windows app store and Snapcraft store.",
  )

  #project-entry(
    year: "2014",
    name: [Casper #sym.star],
    tagline: "Casper: A Ghost-like WordPress theme",
    description: "WordPress port of the popular Ghost theme, Casper; Custom PHP WP theme.",
  )

  #project-entry(
    year: "2015",
    name: "NPM Libraries",
    tagline: "Collection of Open-Source NPM Libraries",
    description: "album-art | movie-art | movie-info | movie-trailer; etc thousands of weekly downloads",
  )

  #project-entry(
    year: "2015",
    name: "Cinematic",
    tagline: "Cinematic: Desktop Movie Organizer",
    description: "NodeJS + Meteor desktop app: Movie organizer and player; Meteor, MongoDB",
  )

  #project-entry(
    year: "2012",
    name: "XPlay.js",
    tagline: "XPlay: HTML5 Audio + Video Player",
    description: "Modern Javascript & HTML5 media player; Node/Python/PHP file/playlist generators",
  )

  #project-entry(
    year: "2006",
    name: [XSPF Jukebox #sym.star],
    tagline: "XSPF Jukebox: Flash Audio + Video Player",
    description: "Flash media player & plugin. Widespread use on popular websites and packaged with PHP framework SocialEngine; Python/PHP backend playlist generation.",
  )
]


// ════════════════════════════════════════════════════════════════════════════
// TOOLS & INTEGRATIONS (complete version)
// ════════════════════════════════════════════════════════════════════════════

#if complete [

  #grid(
    columns: (1fr, 3.4fr),
    column-gutter: 12pt,
    [
      #section-heading("Personal")
      #v(2pt)
      #text(size: 8pt, fill: grey)[_...Continued_]
    ],
    [],
  )

  #v(4pt)
  #grid(
    columns: (1fr, 3.4fr),
    column-gutter: 12pt,
    align(right)[#text(size: 9pt, weight: "bold", fill: grey, tracking: 2pt)[TOOLS]],
    text(size: 9pt)[TypeScript, NextJS, React, React-Native, React Query, Svelte, Electron, Angular, Astro, Vue, NodeJS, JavaScript, Docker, WordPress, Flask, Django, Wagtail, build tools, Babel/Webpack/Vite, CI/CD, REGEX, Git, SQL, MySQL, PostgreSQL, MongoDB, Jenkins, AdobeCC, Figma, Linux, AWS, SQS, SNS, Lambda, Cloudflare, Azure, Selenium, DNS, RPA, JQuery, Bootstrap, Tailwind, Sass, Scss, Micro-services
    #linebreak()
    Other: Actionscript / Java / C / C\# / C++ / Haskell / F\# / Prolog],
  )

  #v(4pt)
  #grid(
    columns: (1fr, 3.4fr),
    column-gutter: 12pt,
    align(right)[#text(size: 9pt, weight: "bold", fill: grey, tracking: 2pt)[INTEGRATIONS]],
    text(size: 9pt)[Contentful, Stripe, CommerceTools, Plytix, Algolia, Meilisearch, PagesCMS, SanityCMS, TinaCMS, WordPress, Django, Wagtail, Laravel, CakePHP, Drupal],
  )
]
