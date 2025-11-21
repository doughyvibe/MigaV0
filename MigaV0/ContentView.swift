//
//  ContentView.swift
//  MigaV0
//
//  Created by Doughy on 21/11/25.
//

import SwiftUI

// B-002: Create MindfulnessQuote struct - core data model for quotes with id, text, tags, category
// Used for developing a structured model for mindfulness quotes enabling organization and retrieval
struct MindfulnessQuote: Identifiable {
    let id: UUID
    let text: String        // The actual quote content
    let tags: [String]      // Categories like "Stoicism", "Poetry", "Focus"
    let category: String    // Primary category for easier filtering

    init(text: String, tags: [String], category: String) {
        self.id = UUID()
        self.text = text
        self.tags = tags
        self.category = category
    }
}

// B-005: AppModel struct for selected applications
// Stores display name, URL scheme, and icon for each protected app
struct AppModel: Identifiable, Codable, Equatable {
    let id: UUID
    let displayName: String
    let urlScheme: String
    let iconName: String
    var isSelected: Bool

    init(displayName: String, urlScheme: String, iconName: String, isSelected: Bool = false) {
        self.id = UUID()
        self.displayName = displayName
        self.urlScheme = urlScheme
        self.iconName = iconName
        self.isSelected = isSelected
    }

    static func == (lhs: AppModel, rhs: AppModel) -> Bool {
        lhs.id == rhs.id
    }
}

// B-005: Predefined apps data - hardcoded 15 popular apps with URL schemes and SF Symbols
// These are the most common distracting apps that users want to protect
let predefinedApps = [
    AppModel(displayName: "Instagram", urlScheme: "instagram://", iconName: "camera.viewfinder"),
    AppModel(displayName: "TikTok", urlScheme: "tiktok://", iconName: "music.note"),
    AppModel(displayName: "YouTube", urlScheme: "youtube://", iconName: "play.rectangle.fill"),
    AppModel(displayName: "Facebook", urlScheme: "fb://", iconName: "f.circle.fill"),
    AppModel(displayName: "Twitter/X", urlScheme: "twitter://", iconName: "bird.fill"),
    AppModel(displayName: "Reddit", urlScheme: "reddit://", iconName: "arrow.up"),
    AppModel(displayName: "LinkedIn", urlScheme: "linkedin://", iconName: "briefcase.fill"),
    AppModel(displayName: "Snapchat", urlScheme: "snapchat://", iconName: "bolt.fill"),
    AppModel(displayName: "Pinterest", urlScheme: "pinterest://", iconName: "pin.fill"),
    AppModel(displayName: "Tumblr", urlScheme: "tumblr://", iconName: "t.square.fill"),
    AppModel(displayName: "Discord", urlScheme: "discord://", iconName: "bubble.left.and.bubble.right.fill"),
    AppModel(displayName: "Twitch", urlScheme: "twitch://", iconName: "tv.fill"),
    AppModel(displayName: "Threads", urlScheme: "threads://", iconName: "number"),
    AppModel(displayName: "WhatsApp", urlScheme: "whatsapp://", iconName: "phone.bubble.fill"),
    AppModel(displayName: "Telegram", urlScheme: "tg://", iconName: "paperplane.fill")
]

// B-005: AppSelectionView (S-003) - Simplified first-run app selection screen
// Clean interface with 15 popular apps, no search, direct tap to select
struct AppSelectionView: View {
    @Binding var appSelectionCompleted: Bool
    @State private var selectedApps: [AppModel] = predefinedApps

    // Count of selected apps for validation
    var selectedCount: Int {
        selectedApps.filter { $0.isSelected }.count
    }

    // Continue button only enabled with at least 1 app
    var canContinue: Bool {
        selectedCount >= 1
    }

    var body: some View {
        VStack(spacing: 24) {
            // Header section
            VStack(spacing: 12) {
                Text("Create Your Intentional Hub")
                    .font(.system(size: 28, weight: .bold))
                    .foregroundColor(.primary)
                    .multilineTextAlignment(.center)

                Text("Select the apps you want MIGA to protect")
                    .font(.system(size: 16))
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.center)
            }
            .padding(.top, 40)
            .padding(.horizontal, 24)

            // Selected count display
            HStack {
                Text("\(selectedCount) app\(selectedCount == 1 ? "" : "s") selected")
                    .font(.system(size: 14))
                    .foregroundColor(.secondary)

                Spacer()

                Text("Minimum 1 required")
                    .font(.system(size: 12))
                    .foregroundColor(selectedCount >= 1 ? .green : .orange)
            }
            .padding(.horizontal, 24)

            // Apps grid with direct selection
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 120), spacing: 12)], spacing: 12) {
                    ForEach(selectedApps.indices, id: \.self) { index in
                        Button(action: {
                            selectedApps[index].isSelected.toggle()
                        }) {
                            HStack(spacing: 8) {
                                Image(systemName: selectedApps[index].iconName)
                                    .font(.system(size: 16))

                                Text(selectedApps[index].displayName)
                                    .font(.system(size: 14, weight: .medium))
                                    .lineLimit(1)
                            }
                            .frame(maxWidth: .infinity, minHeight: 44)
                            .padding(.horizontal, 12)
                            .background(selectedApps[index].isSelected ? Color(hex: "00A9B5").opacity(0.1) : Color(.systemGray6))
                            .foregroundColor(selectedApps[index].isSelected ? Color(hex: "00A9B5") : .primary)
                            .cornerRadius(22)
                            .overlay(
                                RoundedRectangle(cornerRadius: 22)
                                    .stroke(selectedApps[index].isSelected ? Color(hex: "00A9B5") : Color.clear, lineWidth: 1.5)
                            )
                        }
                        .animation(.easeInOut(duration: 0.2), value: selectedApps[index].isSelected)
                    }
                }
                .padding(.horizontal, 24)
                .padding(.top, 8)
            }

            Spacer()

            // Continue button with proper validation
            Button(action: continueToHub) {
                Text("Continue to Hub")
                    .font(.system(size: 18, weight: .bold))
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .frame(height: 60)
                    .background(canContinue ? Color(hex: "00A9B5") : Color.gray.opacity(0.5))
                    .cornerRadius(12)
                    .shadow(color: canContinue ? Color(hex: "00A9B5").opacity(0.3) : .clear, radius: 10, x: 0, y: 5)
            }
            .disabled(!canContinue)
            .padding(.horizontal, 24)
            .padding(.bottom, 40)
        }
        .preferredColorScheme(.light)
        .accentColor(Color(hex: "00A9B5"))
    }

    // Complete selection and save data
    private func continueToHub() {
        let appsToSave = selectedApps.filter { $0.isSelected }

        if let encoded = try? JSONEncoder().encode(appsToSave) {
            UserDefaults.standard.set(encoded, forKey: "selectedApps")
            UserDefaults.standard.set(true, forKey: "appSelectionCompleted")
            appSelectionCompleted = true

            print("🧘‍♀️ MIGA: App selection completed - \(appsToSave.count) apps saved")
            print("📱 Selected apps: \(appsToSave.map { $0.displayName }.joined(separator: ", "))")
        }
    }
}

// B-005: Individual app toggle pill component
struct AppTogglePill: View {
    @Binding var app: AppModel

    var body: some View {
        Button(action: { app.isSelected.toggle() }) {
            HStack(spacing: 8) {
                Image(systemName: app.iconName)
                    .font(.system(size: 16))

                Text(app.displayName)
                    .font(.system(size: 14, weight: .medium))
                    .lineLimit(1)
            }
            .frame(maxWidth: .infinity, minHeight: 44)
            .padding(.horizontal, 12)
            .background(app.isSelected ? Color(hex: "00A9B5").opacity(0.1) : Color(.systemGray6))
            .foregroundColor(app.isSelected ? Color(hex: "00A9B5") : .primary)
            .cornerRadius(22)
            .overlay(
                RoundedRectangle(cornerRadius: 22)
                    .stroke(app.isSelected ? Color(hex: "00A9B5") : Color.clear, lineWidth: 1.5)
            )
        }
        .animation(.easeInOut(duration: 0.2), value: app.isSelected)
    }
}

// B-002: Debug logging rule - explicitly documenting rule application and purpose for clarity
// Rule: "Always add debug logs & comments in the code for easier debug & readability"
// This struct will be used throughout the app for quote management and user engagement

// B-004: Onboarding View - S-001 Onboarding Carousel
// 12 fixed full-screen pages that appear only on very first launch
// Uses TabView with PageTabViewStyle, last page has "Let's Go!" button
struct OnboardingView: View {
    // B-004: State management for completion and navigation
    @State private var currentPage = 0
    let totalPages = 12

    // B-004: Onboarding screens content - fixed 12 screens as per instructions.md
    private let onboardingScreens = [
        OnboardingScreen(
            title: "Welcome to MIGA",
            subtitle: "Your mindful gateway companion",
            description: "MIGA helps you pause, reflect, and choose conscious engagement before accessing distracting apps. It's like having a gentle best friend who reminds you of what truly matters.",
            image: "figure.mind.and.body"
        ),
        OnboardingScreen(
            title: "The Problem",
            subtitle: "We're all influenced by autopilot",
            description: "Have you ever found yourself reaching for Instagram or TikTok without thinking? Scrolling through feeds while knowing you had better plans? You're not alone.",
            image: "hourglass"
        ),
        OnboardingScreen(
            title: "Autopilot vs Conscious Choice",
            subtitle: "Wake up in the moment",
            description: "MIGA creates a serene pause right when you're about to autopilot-scroll. No blocking, no shaming – just a moment to remember what you truly want to do.",
            image: "timer"
        ),
        OnboardingScreen(
            title: "Beautiful Mindfulness Pause",
            subtitle: "Quotes that inspire reflection",
            description: "Instead of instant gratification, you'll see a stunning screen with a thoughtful quote, a calming timer, and three choices: Exit to Focus, Deepen Pause, or Proceed.",
            image: "quote.bubble"
        ),
        OnboardingScreen(
            title: "Exit to Focus",
            subtitle: "Celebrate conscious choices",
            description: "Choose 'Exit to Focus' and you'll feel celebrated for choosing yourself. Track your mindful moments, build streaks, and see the hours you've reclaimed.",
            image: "star.circle"
        ),
        OnboardingScreen(
            title: "Fresh Perspectives",
            subtitle: "Deepen the pause anytime",
            description: "Not ready yet? Hit 'Deepen Pause' for a new random quote and restart the timer. Take as much time as you need to choose what serves you best.",
            image: "arrow.triangle.swap"
        ),
        OnboardingScreen(
            title: "Mindful Engagement",
            subtitle: "When you're truly ready",
            description: "Ready to engage? 'Proceed to App' opens your chosen destination when the timer completes. No judgment, no guilt – just conscious choice.",
            image: "arrow.right.circle"
        ),
        OnboardingScreen(
            title: "Your Protected Apps",
            subtitle: "Choose your mindful gateways",
            description: "Select which apps you want MIGA to protect. Instagram, TikTok, YouTube, Facebook – whatever pulls you into autopilot most often.",
            image: "apps.iphone"
        ),
        OnboardingScreen(
            title: "Personalized Content",
            subtitle: "Quotes that resonate with you",
            description: "Tell us your interests – Stoicism, Poetry, Buddhist Wisdom, Modern Psychology – and we'll show quotes that speak to your soul during pauses.",
            image: "heart.circle"
        ),
        OnboardingScreen(
            title: "Track Your Progress",
            subtitle: "See the change you're creating",
            description: "Watch your Conscious Exit rate grow. See how many mindful moments you've had. Celebrate the hours of intentional living you've reclaimed.",
            image: "chart.bar"
        ),
        OnboardingScreen(
            title: "Your Journey Begins",
            subtitle: "The first step is awareness",
            description: "MIGA isn't about perfection – it's about creating moments of conscious choice in the digital flow. Every mindful pause makes a difference.",
            image: "figure.walk"
        ),
        OnboardingScreen(
            title: "Ready to Transform?",
            subtitle: "Let's begin your mindful journey",
            description: "With every conscious choice, you're reclaiming your attention and building a life of intention. You're about to take a powerful step toward digital mindfulness.",
            image: "hand.raised",
            isLastPage: true
        )
    ]

    var body: some View {
        // B-004: TabView with PageTabViewStyle for swipeable carousel
        TabView(selection: $currentPage) {
            ForEach(0..<onboardingScreens.count, id: \.self) { index in
                onboardingScreens[index]
                    .tag(index)
            }
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
        // B-004: Prevent accidental navigation - disable edge swipe features
        .ignoresSafeArea()
        // B-004: Light mode only as per instructions
        .preferredColorScheme(.light)
        // B-004: Teal color theme (#00A9B5) from instructions
        .accentColor(Color(hex: "00A9B5"))
    }
}

// B-004: Individual onboarding screen model
struct OnboardingScreen: View {
    let title: String
    let subtitle: String
    let description: String
    let image: String
    var isLastPage: Bool = false

    var body: some View {
        VStack(spacing: 32) {
            Spacer()

            // B-004: Icon/image section
            Image(systemName: image)
                .font(.system(size: 80))
                .foregroundColor(Color(hex: "00A9B5"))
                .padding()

            // B-004: Content section
            VStack(spacing: 16) {
                Text(title)
                    .font(.system(size: 28, weight: .bold))
                    .foregroundColor(.primary)
                    .multilineTextAlignment(.center)

                Text(subtitle)
                    .font(.system(size: 18, weight: .medium))
                    .foregroundColor(Color(hex: "00A9B5"))
                    .multilineTextAlignment(.center)

                Text(description)
                    .font(.system(size: 16, weight: .regular))
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.center)
                    .lineSpacing(4)
                    .padding(.horizontal, 32)
            }

            Spacer()

            // B-004: Last page has "Let's Go!" button
            if isLastPage {
                Button(action: completeOnboarding) {
                    Text("Let's Go!")
                        .font(.system(size: 18, weight: .bold))
                        .foregroundColor(.white)
                        .frame(width: 200, height: 60)
                        .background(Color(hex: "00A9B5"))
                        .cornerRadius(30)
                        .shadow(color: Color(hex: "00A9B5").opacity(0.3), radius: 10, x: 0, y: 5)
                }
                .padding(.bottom, 50)
            } else {
                // B-004: Progress indicator for non-last pages
                HStack(spacing: 8) {
                    ForEach(0..<12) { index in
                        Circle()
                            .fill(index == getCurrentPageIndex() ? Color(hex: "00A9B5") : Color.gray.opacity(0.3))
                            .frame(width: 8, height: 8)
                            .animation(.easeInOut, value: getCurrentPageIndex())
                    }
                }
                .padding(.horizontal, 32)
                .padding(.bottom, 50)
            }
        }
        .padding(.horizontal, 24)
    }

    // B-004: Helper function to get current page index (simplified for single screen)
    private func getCurrentPageIndex() -> Int {
        // This would normally get the current page from parent view
        // For now, we'll show a static progress as this is per-screen
        return 0
    }

    // B-004: Complete onboarding and navigate
    private func completeOnboarding() {
        // B-004: Set onboarding completed in UserDefaults
        UserDefaults.standard.set(true, forKey: "onboardingCompleted")
        // B-004: Add debug logging as per rules
        print("🧘‍♀️ MIGA: Onboarding completed - showing first run app selection")
        // Navigation would happen in parent view
    }
}

// B-004: Color extension for hex colors
extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (1, 1, 1, 0)
        }
        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue: Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}

// B-004: Main ContentView - orchestrates the complete user journey flow
struct ContentView: View {
    // B-005: State management for navigation flow
    @State private var onboardingCompleted = UserDefaults.standard.bool(forKey: "onboardingCompleted")
    @State private var appSelectionCompleted = UserDefaults.standard.bool(forKey: "appSelectionCompleted")

    var body: some View {
        // B-005: Complete flow: Onboarding → App Selection → Hub
        if !onboardingCompleted {
            // First launch: Show onboarding carousel
            OnboardingView()
                .onDisappear {
                    // B-005: Update state when onboarding completes
                    onboardingCompleted = UserDefaults.standard.bool(forKey: "onboardingCompleted")
                }
        } else if !appSelectionCompleted {
            // After onboarding: Show app selection (mandatory first-run)
            AppSelectionView(appSelectionCompleted: $appSelectionCompleted)
        } else {
            // After app selection: Show main hub (B-006)
            HubView()
        }
    }
}



// B-006: Hub View (S-004) - Main screen after onboarding and app selection
// Streak banner at top, grid of selected app icons, bottom tab bar (Hub | Stats). Tap any icon → opens S-005 (Gateway)
struct HubView: View {
    // B-006: State management for hub functionality
    @State private var selectedApps: [AppModel] = []
    @State private var showGateway = false
    @State private var selectedAppForGateway: AppModel?

    // B-006: Load selected apps from UserDefaults on appear
    private func loadSelectedApps() {
        if let data = UserDefaults.standard.data(forKey: "selectedApps"),
           let decodedApps = try? JSONDecoder().decode([AppModel].self, from: data) {
            selectedApps = decodedApps
            print("🧘‍♀️ MIGA: Loaded \(selectedApps.count) selected apps for Hub")
        }
    }

    // B-006: Calculate current streak (simplified for now)
    private var currentStreak: Int {
        // B-006: D-007 Current streak days - calculate based on D-008 Last exit date
        // For now, return mock data since we haven't implemented exit tracking yet
        return 7 // Placeholder - will be calculated properly when exit tracking is added
    }

    var body: some View {
        VStack(spacing: 0) {
            // B-006: Streak banner at top (D-007: Current streak days)
            ZStack {
                Color(hex: "00A9B5")
                    .edgesIgnoringSafeArea(.top)
                    .frame(height: 120)

                VStack(spacing: 4) {
                    Text("Current Mindful Streak")
                        .font(.system(size: 14, weight: .medium))
                        .foregroundColor(.white.opacity(0.9))

                    Text("\(currentStreak)")
                        .font(.system(size: 48, weight: .bold))
                        .foregroundColor(.white)

                    Text("days")
                        .font(.system(size: 16, weight: .regular))
                        .foregroundColor(.white.opacity(0.8))
                }
                .padding(.top, 20)
            }

            // B-006: Main content area with app grid
            VStack(spacing: 24) {
                // B-006: Header for app section
                VStack(spacing: 8) {
                    Text("Your Mindful Gateway")
                        .font(.system(size: 24, weight: .bold))
                        .foregroundColor(.primary)

                    Text("Tap any app to begin your mindful pause")
                        .font(.system(size: 16))
                        .foregroundColor(.secondary)
                        .multilineTextAlignment(.center)
                }
                .padding(.horizontal, 24)
                .padding(.top, 32)

                // B-006: Grid of selected app icons using LazyVGrid
                ScrollView {
                    LazyVGrid(columns: [GridItem(.adaptive(minimum: 80), spacing: 20)], spacing: 24) {
                        ForEach(selectedApps.indices, id: \.self) { index in
                            AppIconButton(app: selectedApps[index]) {
                                // B-006: Handle app tap - show Gateway modal
                                selectedAppForGateway = selectedApps[index]
                                showGateway = true
                                print("🧘‍♀️ MIGA: Opening Gateway for \(selectedApps[index].displayName)")
                            }
                        }
                    }
                    .padding(.horizontal, 32)
                    .padding(.top, 16)
                    .padding(.bottom, 32)
                }

                Spacer()

                // B-006: Placeholder for bottom tab bar (Hub | Stats)
                // Will be implemented when Stats screen is added
                HStack {
                    Spacer()
                    Text("Hub")
                        .font(.system(size: 14, weight: .medium))
                        .foregroundColor(Color(hex: "00A9B5"))
                    Spacer()
                    Text("Stats")
                        .font(.system(size: 14, weight: .regular))
                        .foregroundColor(.gray)
                    Spacer()
                }
                .padding(.vertical, 16)
                .background(Color(.systemGray6))
                .edgesIgnoringSafeArea(.bottom)
            }
        }
        .onAppear {
            // B-006: Load selected apps when view appears
            loadSelectedApps()
        }
        .fullScreenCover(isPresented: $showGateway) {
            // B-006: Gateway modal - placeholder for B-007
            if let app = selectedAppForGateway {
                GatewayPlaceholderView(app: app, isPresented: $showGateway)
            }
        }
        .preferredColorScheme(.light) // B-011: Light mode only
        .accentColor(Color(hex: "00A9B5"))
    }
}

// B-006: Individual app icon button component
struct AppIconButton: View {
    let app: AppModel
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            VStack(spacing: 8) {
                // B-006: App icon in circular background
                ZStack {
                    Circle()
                        .fill(Color(hex: "00A9B5").opacity(0.1))
                        .frame(width: 70, height: 70)

                    Image(systemName: app.iconName)
                        .font(.system(size: 28))
                        .foregroundColor(Color(hex: "00A9B5"))
                }

                // B-006: App name below icon
                Text(app.displayName)
                    .font(.system(size: 12, weight: .medium))
                    .foregroundColor(.primary)
                    .multilineTextAlignment(.center)
                    .lineLimit(2)
                    .frame(width: 70)
            }
        }
    }
}

// B-007: GatewayView (S-005) - Signature mindfulness pause modal
// Full-screen modal with quote, circular timer, three action buttons
struct GatewayView: View {
    let app: AppModel
    @Binding var isPresented: Bool

    // B-007: State management for gateway interaction
    @State private var timeRemaining: Int = 90 // Default 90 seconds (D-003)
    @State private var currentQuote: MindfulnessQuote = mindfulnessQuotes.randomElement()!
    @State private var timer: Timer? = nil
    @State private var showCelebration = false

    // B-007: Computed properties for UI state
    private var progress: Double {
        Double(timeRemaining) / Double(90)
    }

    private var isTimerActive: Bool {
        timeRemaining > 0 && timer != nil
    }

    var body: some View {
        ZStack {
            // B-007: Full-screen background
            Color.white.edgesIgnoringSafeArea(.all)
                .preferredColorScheme(.light)

            VStack(spacing: 0) {
                // B-007: Top section - App icon and name
                VStack(spacing: 16) {
                    Image(systemName: app.iconName)
                        .font(.system(size: 60))
                        .foregroundColor(Color(hex: "00A9B5"))

                    Text(app.displayName)
                        .font(.system(size: 24, weight: .bold))
                        .foregroundColor(.primary)
                }
                .padding(.top, 60)
                .padding(.bottom, 40)

                // B-007: Middle section - Mindfulness quote with huge font
                VStack(spacing: 20) {
                    Text("\"\(currentQuote.text)\"")
                        .font(.system(size: 32, weight: .regular))
                        .foregroundColor(.primary)
                        .multilineTextAlignment(.center)
                        .lineSpacing(8)
                        .padding(.horizontal, 40)
                        .minimumScaleFactor(0.8)
                        .italic()

                    Text("— \(currentQuote.category)")
                        .font(.system(size: 16, weight: .medium))
                        .foregroundColor(Color(hex: "00A9B5"))
                }
                .frame(maxHeight: .infinity)

                // B-007: Center section - Circular progress timer ring
                ZStack {
                    // B-007: Background circle
                    Circle()
                        .stroke(Color.gray.opacity(0.2), lineWidth: 8)
                        .frame(width: 200, height: 200)

                    // B-007: Progress circle
                    Circle()
                        .trim(from: 0.0, to: progress)
                        .stroke(Color(hex: "00A9B5"), style: StrokeStyle(lineWidth: 8, lineCap: .round))
                        .frame(width: 200, height: 200)
                        .rotationEffect(.degrees(-90))
                        .animation(.easeInOut(duration: 0.3), value: progress)

                    // B-007: Timer text in center
                    VStack(spacing: 4) {
                        Text("\(timeRemaining)")
                            .font(.system(size: 48, weight: .bold))
                            .foregroundColor(Color(hex: "00A9B5"))

                        Text("seconds")
                            .font(.system(size: 16))
                            .foregroundColor(.secondary)
                    }
                }
                .padding(.vertical, 40)

                // B-007: Bottom section - Three action buttons (fixed bar)
                ZStack {
                    Color.gray.opacity(0.05)
                        .edgesIgnoringSafeArea(.bottom)
                        .frame(height: 140)

                    HStack(spacing: 20) {
                        // B-007: Exit to Focus - Immediate action (F-005)
                        VStack(spacing: 8) {
                            Button(action: exitToFocus) {
                                VStack(spacing: 8) {
                                    Image(systemName: "sun.max.fill")
                                        .font(.system(size: 24))
                                        .foregroundColor(.white)

                                    Text("Exit to Focus")
                                        .font(.system(size: 12, weight: .medium))
                                        .foregroundColor(.white)
                                }
                                .frame(width: 80, height: 80)
                                .background(Color(hex: "00A9B5"))
                                .clipShape(Circle())
                            }

                            Text("Instant")
                                .font(.system(size: 10))
                                .foregroundColor(.secondary)
                        }

                        // B-007: Deepen Pause - New quote, reset timer (F-006)
                        VStack(spacing: 8) {
                            Button(action: deepenPause) {
                                VStack(spacing: 8) {
                                    Image(systemName: "leaf.fill")
                                        .font(.system(size: 24))
                                        .foregroundColor(.white)

                                    Text("Deepen")
                                        .font(.system(size: 12, weight: .medium))
                                        .foregroundColor(.white)
                                }
                                .frame(width: 80, height: 80)
                                .background(Color.purple.opacity(0.8))
                                .clipShape(Circle())
                            }

                            Text("More time")
                                .font(.system(size: 10))
                                .foregroundColor(.secondary)
                        }

                        // B-007: Proceed to App - Only when timer = 0 (F-007)
                        VStack(spacing: 8) {
                            Button(action: proceedToApp) {
                                VStack(spacing: 8) {
                                    Image(systemName: "arrow.right")
                                        .font(.system(size: 24))
                                        .foregroundColor(.white)

                                    Text("Proceed")
                                        .font(.system(size: 12, weight: .medium))
                                        .foregroundColor(.white)
                                }
                                .frame(width: 80, height: 80)
                                .background(timeRemaining > 0 ? Color.gray.opacity(0.5) : Color.green)
                                .clipShape(Circle())
                            }
                            .disabled(timeRemaining > 0)

                            Text("When ready")
                                .font(.system(size: 10))
                                .foregroundColor(.secondary)
                        }
                    }
                    .padding(.horizontal, 20)
                    .padding(.top, 20)
                }
            }
        }
        .onAppear {
            // B-007: Start 90-second countdown timer
            startTimer()
        }
        .onDisappear {
            // B-007: Clean up timer when view disappears
            timer?.invalidate()
        }
        // B-007: Full screen modal presentation
        .edgesIgnoringSafeArea(.all)
    }

    // B-007: Start the 90-second countdown timer
    private func startTimer() {
        timeRemaining = 90
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            if self.timeRemaining > 0 {
                self.timeRemaining -= 1
            } else {
                timer.invalidate()
                self.timer = nil
                // B-007: Timer completed - can now proceed to app
                print("🧘‍♀️ MIGA: Timer completed - user can now proceed to \(self.app.displayName)")
            }
        }
    }

    // B-007: Exit to Focus - Immediate dismissal with celebration (F-005)
    private func exitToFocus() {
        // B-007: Stop timer and update stats
        timer?.invalidate()

        // B-007: Update conscious exits count (D-004)
        let currentExits = UserDefaults.standard.integer(forKey: "consciousExits")
        UserDefaults.standard.set(currentExits + 1, forKey: "consciousExits")

        // B-007: Update total sessions (D-005)
        let currentSessions = UserDefaults.standard.integer(forKey: "totalSessions")
        UserDefaults.standard.set(currentSessions + 1, forKey: "totalSessions")

        // B-007: Calculate and update hours reclaimed (D-006)
        let pausedSeconds = 90 - timeRemaining
        let currentHours = UserDefaults.standard.double(forKey: "hoursReclaimed")
        UserDefaults.standard.set(currentHours + Double(pausedSeconds) / 3600.0, forKey: "hoursReclaimed")

        // B-007: Update streak (D-007, D-008) - simplified for now
        UserDefaults.standard.set(Date(), forKey: "lastExitDate")

        // B-007: Debug logging and hide modal
        print("🧘‍♀️ MIGA: Conscious Exit! +1 streak, returned to focus")
        print("📊 Stats: Exits=\(currentExits + 1), Sessions=\(currentSessions + 1), Hours=\(currentHours + Double(pausedSeconds) / 3600.0)")

        // B-007: Show celebration (placeholder - B-010 will implement real celebrations)
        showCelebration = true

        // B-007: Dismiss modal
        isPresented = false
    }

    // B-007: Deepen Pause - New random quote and reset timer (F-006)
    private func deepenPause() {
        // B-007: Get new random quote from same category or different category
        let sameCategoryQuotes = mindfulnessQuotes.filter { $0.category == currentQuote.category }
        if sameCategoryQuotes.count > 1 {
            currentQuote = sameCategoryQuotes.filter { $0.id != currentQuote.id }.randomElement()!
        } else {
            currentQuote = mindfulnessQuotes.filter { $0.id != currentQuote.id }.randomElement()!
        }

        // B-007: Reset timer to full duration
        timer?.invalidate()
        startTimer()

        // B-007: Debug logging
        print("🧘‍♀️ MIGA: Deepened pause - new quote from \(currentQuote.category), timer reset")
    }

    // B-007: Proceed to App - Only when timer = 0, opens URL scheme (F-007)
    private func proceedToApp() {
        // B-007: Only allow if timer has completed
        guard timeRemaining == 0 else { return }

        // B-007: Update stats for session completed
        let currentSessions = UserDefaults.standard.integer(forKey: "totalSessions")
        UserDefaults.standard.set(currentSessions + 1, forKey: "totalSessions")

        // B-007: Attempt to open the app via URL scheme
        if let url = URL(string: app.urlScheme),
           UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url)
            print("🧘‍♀️ MIGA: Proceeding to \(app.displayName) after mindful pause")
        } else {
            print("⚠️ MIGA: Could not open \(app.displayName) - URL scheme \(app.urlScheme) not available")
            // B-007: Show user-friendly alert (placeholder)
        }

        // B-007: Dismiss modal
        isPresented = false

        print("📊 Stats: Completed session, opened \(app.displayName)")
    }
}

// B-007: Keep GatewayPlaceholderView as backup for now (can remove later)
struct GatewayPlaceholderView: View {
    let app: AppModel
    @Binding var isPresented: Bool

    var body: some View {
        GatewayView(app: app, isPresented: $isPresented)
    }
}

#Preview {
    ContentView()
}
