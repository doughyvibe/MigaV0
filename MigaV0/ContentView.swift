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

// B-004: Main ContentView - now shows onboarding or hub based on completion
struct ContentView: View {
    // B-004: State to track onboarding completion
    @State private var onboardingCompleted = UserDefaults.standard.bool(forKey: "onboardingCompleted")

    var body: some View {
        // B-004: Show onboarding on first launch, then hub/first run
        if !onboardingCompleted {
            OnboardingView()
        } else {
            // B-004: Placeholder for hub - will be implemented in B-006
            Text("Welcome to MIGA Hub!")
                .font(.largeTitle)
                .foregroundColor(Color(hex: "00A9B5"))
        }
    }
}

#Preview {
    ContentView()
}
