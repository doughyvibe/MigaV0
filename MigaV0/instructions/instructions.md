## MIGA iOS App Requirements Document  
**Tech Stack:** Swift + SwiftUI + Xcode  
**Target:** iOS 17+  
**Goal of this document:** Be so clear that even someone who started coding last week can follow it step by step in Cursor.

### 1. App Overview
MIGA is a mindful gateway app for iPhone.  
Users hide their distracting apps (Instagram, TikTok, etc.) and put the MIGA app on their Home Screen instead.  
When they tap MIGA → they see their usual app icons inside the Hub.  
When they tap any icon → MIGA shows a beautiful full-screen pause with a quote and a countdown timer (default 90 seconds).  
They can instantly “Exit to Focus” (celebrated!) and go back to real life, or they can wait and proceed to the real app.  
The app never blocks or shames — it just wakes the user up in the moment of autopilot and rewards every conscious choice.

### 2. Main Goals
1. Insert a serene, rewarding pause every time the user tries to open a distracting app.  
2. Make “choosing yourself” feel better than scrolling (celebration, streak, stats).  
3. Achieve 18–30% Conscious Exit rate (user closes instead of proceeding).  
4. Feel like a gentle best friend, never like a blocker or nag.

### 3. User Stories
US-001 As a new user, I want to go through a beautiful onboarding flow so I understand exactly how MIGA works and get emotionally bought in.  
US-002 As a user, I want to select which apps I want MIGA to protect me from.  
US-003 As a user, I want to open my distracting apps only through the MIGA Hub.  
US-004 As a user, when I tap an app in the Hub, I want to see a full-screen mindfulness pause with timer.  
US-005 As a user, I want to be able to “Exit to Focus” at any time and feel celebrated.  
US-006 As a user, I want to “Deepen the Pause” as many times as I want with fresh content.  
US-007 As a user, I want to see my streak and stats so I stay motivated.  
US-008 As a user, I want the pause content to match my chosen interests (Stoicism, Poetry, etc.).

### 4. Features
F-001 Onboarding carousel (12 fixed screens, non-skippable on first launch).  
F-002 First-run app selection (mandatory, min 1 app).  
F-003 MIGA Hub screen with streak banner and grid of selected app icons.  
F-004 Gateway Screen (full-screen modal) with quote, circular timer, three buttons.  
F-005 “Exit to Focus” – instant, shows toast + celebration, returns to Home Screen.  
F-006 “Deepen the Pause” – new random quote, timer resets to full duration.  
F-007 “Proceed to [App]” – enabled only when timer = 0, opens real app via URL scheme.  
F-008 Daily streak (resets if zero Conscious Exits in 24h).  
F-009 Statistics screen with hours reclaimed, exits, intentionality score.  
F-010 150+ hand-written mindfulness quotes stored locally, tagged by interest.  
F-011 If user deletes the app or removes all protected apps → everything resets safely.

### 5. Screens
S-001 Onboarding Carousel – 12 full-screen pages (fixed content, see list below). Appears only on very first launch). Swipe or “Next” → last page → “Let’s Go!” → goes to S-002.  
S-002 First Run – “Create Your Intentional Hub” – Appears only if no apps selected yet → button “Select Apps Now” → S-003.  
S-003 App Selection Screen – Pre-filled pills + search bar for custom URL schemes → “Continue” only enabled when ≥1 app → back to Hub (S-004).  
S-004 Hub Screen (main screen after onboarding) – Streak banner at top, grid of selected app icons, bottom tab bar (Hub | Stats). Tap any icon → opens S-005 (Gateway).  
S-005 Gateway Screen – Full-screen modal over Hub. Shows quote, circular timer, three buttons. This is the soul of the app.  
S-006 Statistics Screen – Accessed via bottom tab. Shows three cards + 30-day chart + Intentionality Score.

### 6. Data (all stored locally with UserDefaults – simple for beginners)
D-001 Array of selected apps → Each app has: displayName (String), urlScheme (String), iconName (String for SF Symbol or asset name).  
D-002 User interests → Array of strings (e.g. ["Stoicism", "Poetry"]).  
D-003 Default pause duration → Int, default 90 (seconds).  
D-004 Total Conscious Exits → Int.  
D-005 Total Gateway Sessions → Int.  
D-006 Hours reclaimed → Double (calculated as total paused seconds / 3600).  
D-007 Current streak days → Int.  
D-008 Last exit date → Date (to calculate streak).  
D-009 Readiness slider value from onboarding → Int 1-10 (optional, for future).  
D-010 Onboarding completed → Bool.

### 7. Extra Details
- No internet required – everything works 100% offline.  
- All data stored on device only (UserDefaults is perfect).  
- No special permissions needed (no camera, location, notifications in MVP).  
- Light mode only – disable dark mode completely.  
- App must open other apps via URL schemes (e.g. "instagram://", "tiktok://").  
- If canOpenURL fails → show friendly alert “Please install [App Name] first.”  
- Use only local mindfulness content (150+ strings in an array or JSON file).  
- All celebrations use haptics (success + confetti view or toast.

### 8. Build Steps (Exact order for Cursor/XCode – beginner-friendly)
B-001 Create new SwiftUI app in Xcode → Life Cycle: SwiftUI App → delete default ContentView code.  
B-002 Create struct MindfulnessQuote: Identifiable with id, text, tags, category.  
B-003 Create file Quotes.swift with array of 150+ quotes (hardcode them or put in JSON).  
B-004 Build S-001 Onboarding Carousel first – Use TabView with PageTabViewStyle, 12 fixed views, last one has button → set UserDefaults onboardingCompleted = true → go to Hub or First Run. Test it works.  
B-005 Create AppSelectionView (S-003) – List of predefined apps (hardcode 15 popular ones with name + urlScheme + SF Symbol name). Toggle selection, save to UserDefaults as [AppModel].  
B-006 Build Hub Screen (S-004) – Streak banner at top (calculate from D-007/D-008), LazyVGrid of selected apps → tap → present Gateway as .fullScreenCover.  
B-007 Build GatewayView (S-005) – ZStack, top: big Text(quote) huge font, middle: circular progress ring with Timer, bottom fixed bar with three buttons. Implement all three button actions (Exit = dismiss + toast + update stats, Deepen = new quote + reset timer, Proceed = open URL).  
B-008 Add stats tracking – every time Gateway appears → totalSessions +=1, every Exit to Focus → consciousExits +=1 + update streak + save last exit date.  
B-009 Build Statistics Screen (S-006) – Three cards + simple bar chart using SwiftUI Charts or rectangles.  
B-010 Add celebration – When Exit to Focus → show system toast + Success haptic + maybe confetti package or simple particle view.  
B-011 Light mode only – In Info.plist add Appearance = Light.  
B-012 Polish – Add breathing animation to timer ring, perfect typography, generous padding.  
B-013 Test the core flow 100 times: open Hub → tap app → Gateway → Exit → check stats and streak update correctly.  
B-014 Final polish – Icons, launch screen, app name “MIGA”, teal color #00A9B5 everywhere.

This document is now complete and ready to build from.  
Every number can be referenced later (“Let’s implement F-005 first”, “Fix bug in S-005”, etc.).  
