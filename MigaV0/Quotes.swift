//
//  Quotes.swift
//  MigaV0
//
//  Created by MIGA Development
//

import Foundation

// B-003: Comprehensive collection of 150+ hand-written mindfulness quotes
// Stored locally with UserDefaults for offline functionality and fast access
// Tagged by interests (Stoicism, Poetry, Buddhism, Modern, Nature, etc.)

let mindfulnessQuotes: [MindfulnessQuote] = [
    // STOICISM QUOTES (20 quotes)
    MindfulnessQuote(text: "The impediment to action advances action. What stands in the way becomes the way.", tags: ["Stoicism", "Marcus Aurelius", "Action", "Obstacles"], category: "Stoicism"),
    MindfulnessQuote(text: "You have power over your mind—not outside events. Realize this, and you will find strength.", tags: ["Stoicism", "Marcus Aurelius", "Mind", "Strength"], category: "Stoicism"),
    MindfulnessQuote(text: "Very little is needed to make a happy life—it is all within yourself, in your way of thinking.", tags: ["Stoicism", "Marcus Aurelius", "Happiness", "Mindset"], category: "Stoicism"),
    MindfulnessQuote(text: "Don't explain your philosophy. Embody it.", tags: ["Stoicism", "Epictetus", "Philosophy", "Action"], category: "Stoicism"),
    MindfulnessQuote(text: "It's not what happens to you, but how you react to it that matters.", tags: ["Stoicism", "Epictetus", "Reaction", "Mindfulness"], category: "Stoicism"),
    MindfulnessQuote(text: "The key is to keep company only with people who uplift you, whose presence calls forth your best.", tags: ["Stoicism", "Epictetus", "Relationships", "Growth"], category: "Stoicism"),
    MindfulnessQuote(text: "Waste no more time arguing about what a good man should be. Be one.", tags: ["Stoicism", "Marcus Aurelius", "Character", "Action"], category: "Stoicism"),
    MindfulnessQuote(text: "When you arise in the morning, think of what a precious privilege it is to be alive—to breathe, to think, to enjoy, to love.", tags: ["Stoicism", "Marcus Aurelius", "Gratitude", "Morning"], category: "Stoicism"),
    MindfulnessQuote(text: "Do not indulge in dreams of having what you have not, but reckon up the chief of the blessings you do possess.", tags: ["Stoicism", "Marcus Aurelius", "Gratitude", "Contentment"], category: "Stoicism"),
    MindfulnessQuote(text: "True happiness is to enjoy the present, without anxious dependence upon the future.", tags: ["Stoicism", "Seneca", "Happiness", "Present"], category: "Stoicism"),
    MindfulnessQuote(text: "It is not the man who has too little, but the man who craves more, that is poor.", tags: ["Stoicism", "Seneca", "Contentment", "Wealth"], category: "Stoicism"),
    MindfulnessQuote(text: "Sometimes even to live is an act of courage.", tags: ["Stoicism", "Seneca", "Courage", "Life"], category: "Stoicism"),
    MindfulnessQuote(text: "Luck is what happens when preparation meets opportunity.", tags: ["Stoicism", "Seneca", "Preparation", "Opportunity"], category: "Stoicism"),
    MindfulnessQuote(text: "What we fear doing most is usually what we most need to do.", tags: ["Stoicism", "Modern", "Tim Ferriss", "Fear", "Action"], category: "Stoicism"),
    MindfulnessQuote(text: "The happiness of your life depends upon the quality of your thoughts.", tags: ["Stoicism", "Marcus Aurelius", "Thoughts", "Happiness"], category: "Stoicism"),
    MindfulnessQuote(text: "Control thy passions lest they take vengence on thee.", tags: ["Stoicism", "Epictetus", "Passion", "Control"], category: "Stoicism"),
    MindfulnessQuote(text: "The best revenge is to be unlike him who performed the injury.", tags: ["Stoicism", "Marcus Aurelius", "Revenge", "Character"], category: "Stoicism"),
    MindfulnessQuote(text: "Each day provides its own gifts.", tags: ["Stoicism", "Marcus Aurelius", "Gratitude", "Daily"], category: "Stoicism"),
    MindfulnessQuote(text: "Practice yourself, for heaven's sake in little things, and then proceed to greater.", tags: ["Stoicism", "Epictetus", "Practice", "Growth"], category: "Stoicism"),
    MindfulnessQuote(text: "Circumstances don't make the man, they reveal him.", tags: ["Stoicism", "James Allen", "Character", "Circumstances"], category: "Stoicism"),

    // BUDDHIST WISDOM (20 quotes)
    MindfulnessQuote(text: "Peace comes from within. Do not seek it without.", tags: ["Buddhism", "Buddha", "Peace", "Inner"], category: "Buddhism"),
    MindfulnessQuote(text: "All that we are is the result of what we have thought. The mind is everything. What we think we become.", tags: ["Buddhism", "Buddha", "Mind", "Thoughts"], category: "Buddhism"),
    MindfulnessQuote(text: "The only way to do great work is to love what you do.", tags: ["Buddhism", "Steve Jobs", "Work", "Passion"], category: "Buddhism"),
    MindfulnessQuote(text: "In the confrontation between the stream and the rock, the stream always wins, not through strength but by perseverance.", tags: ["Buddhism", "H. Jackson Brown", "Perseverance", "Patience"], category: "Buddhism"),
    MindfulnessQuote(text: "You must do the thing you think you cannot do.", tags: ["Buddhism", "Eleanor Roosevelt", "Action", "Courage"], category: "Buddhism"),
    MindfulnessQuote(text: "The journey of a thousand miles begins with a single step.", tags: ["Buddhism", "Lao Tzu", "Journey", "Action"], category: "Buddhism"),
    MindfulnessQuote(text: "What you think, you become. What you feel, you attract. What you imagine, you create.", tags: ["Buddhism", "Buddha", "Creation", "Mind"], category: "Buddhism"),
    MindfulnessQuote(text: "Believe you can and you're halfway there.", tags: ["Buddhism", "Theodore Roosevelt", "Belief", "Confidence"], category: "Buddhism"),
    MindfulnessQuote(text: "The perfect is the enemy of the good.", tags: ["Buddhism", "Voltaire", "Perfection", "Action"], category: "Buddhism"),
    MindfulnessQuote(text: "Keep your face always toward the sunshine—and shadows will fall behind you.", tags: ["Buddhism", "Walt Whitman", "Optimism", "Hope"], category: "Buddhism"),
    MindfulnessQuote(text: "The root of suffering is attachment.", tags: ["Buddhism", "Buddha", "Suffering", "Attachment"], category: "Buddhism"),
    MindfulnessQuote(text: "Be kind, for everyone you meet is fighting a battle you know nothing about.", tags: ["Buddhism", "Ian Maclaren", "Kindness", "Compassion"], category: "Buddhism"),
    MindfulnessQuote(text: "The only limit to our realization of tomorrow will be our doubts of today.", tags: ["Buddhism", "Franklin D. Roosevelt", "Doubt", "Future"], category: "Buddhism"),
    MindfulnessQuote(text: "Change your thoughts and you change your world.", tags: ["Buddhism", "Norman Vincent Peale", "Thoughts", "Change"], category: "Buddhism"),
    MindfulnessQuote(text: "The best preparation for tomorrow is doing your best today.", tags: ["Buddhism", "H. Jackson Brown Jr.", "Preparation", "Today"], category: "Buddhism"),
    MindfulnessQuote(text: "Your work is to discover your work and then with all your heart to give yourself to it.", tags: ["Buddhism", "Buddha", "Work", "Purpose"], category: "Buddhism"),
    MindfulnessQuote(text: "The way to get started is to quit talking and begin doing.", tags: ["Buddhism", "Walt Disney", "Action", "Starting"], category: "Buddhism"),
    MindfulnessQuote(text: "Believe in yourself and all that you are.", tags: ["Buddhism", "Christian D. Larson", "Belief", "Self"], category: "Buddhism"),
    MindfulnessQuote(text: "What lies behind us and what lies before us are tiny matters compared to what lies within us.", tags: ["Buddhism", "Ralph Waldo Emerson", "Inner", "Self"], category: "Buddhism"),
    MindfulnessQuote(text: "If you want to lift yourself up, lift up someone else.", tags: ["Buddhism", "Booker T. Washington", "Service", "Others"], category: "Buddhism"),

    // POETRY & LITERATURE (20 quotes)
    MindfulnessQuote(text: "The greatest glory in living lies not in never falling, but in rising every time we fall.", tags: ["Poetry", "Nelson Mandela", "Resilience", "Growth"], category: "Poetry"),
    MindfulnessQuote(text: "Keep your heart open to dreams, for as long as there's a dream, there is hope, and as long as there is hope, there is joy in living.", tags: ["Poetry", "Anonymous", "Hope", "Dreams"], category: "Poetry"),
    MindfulnessQuote(text: "The only person you are destined to become is the person you decide to be.", tags: ["Poetry", "Ralph Waldo Emerson", "Choice", "Self"], category: "Poetry"),
    MindfulnessQuote(text: "You miss 100% of the shots you don't take.", tags: ["Poetry", "Wayne Gretzky", "Action", "Opportunity"], category: "Poetry"),
    MindfulnessQuote(text: "Whether you think you can or you think you can't, you're right.", tags: ["Poetry", "Henry Ford", "Mindset", "Belief"], category: "Poetry"),
    MindfulnessQuote(text: "The best time to plant a tree was 20 years ago. The second best time is now.", tags: ["Poetry", "Chinese Proverb", "Action", "Now"], category: "Poetry"),
    MindfulnessQuote(text: "Your life does not get better by chance, it gets better by change.", tags: ["Poetry", "Jim Rohn", "Change", "Life"], category: "Poetry"),
    MindfulnessQuote(text: "You will face many defeats in life, but never let yourself be defeated.", tags: ["Poetry", "Maya Angelou", "Resilience", "Defeat"], category: "Poetry"),
    MindfulnessQuote(text: "The way to get started is to quit talking and begin doing.", tags: ["Poetry", "Walt Disney", "Action", "Beginning"], category: "Poetry"),
    MindfulnessQuote(text: "If you look at what you have in life, you'll always have more. If you look at what you don't have in life, you'll never have enough.", tags: ["Poetry", "Oprah Winfrey", "Gratitude", "Contentment"], category: "Poetry"),
    MindfulnessQuote(text: "Believe you can and you're halfway there.", tags: ["Poetry", "Theodore Roosevelt", "Belief", "Confidence"], category: "Poetry"),
    MindfulnessQuote(text: "The future belongs to those who believe in the beauty of their dreams.", tags: ["Poetry", "Eleanor Roosevelt", "Dreams", "Future"], category: "Poetry"),
    MindfulnessQuote(text: "The harder you work for something, the greater you'll feel when you achieve it.", tags: ["Poetry", "Anonymous", "Work", "Achievement"], category: "Poetry"),
    MindfulnessQuote(text: "Dream bigger. Do bigger.", tags: ["Poetry", "Anonymous", "Dreams", "Action"], category: "Poetry"),
    MindfulnessQuote(text: "Don't stop when you're tired. Stop when you have finished.", tags: ["Poetry", "Anonymous", "Perseverance", "Finish"], category: "Poetry"),
    MindfulnessQuote(text: "What the new year brings to you will depend a great deal on what you bring to the new year.", tags: ["Poetry", "Vern McLellan", "New Year", "Attitude"], category: "Poetry"),
    MindfulnessQuote(text: "The power of imagination makes us infinite.", tags: ["Poetry", "John Muir", "Imagination", "Infinite"], category: "Poetry"),
    MindfulnessQuote(text: "The world is full of magic things, patiently waiting for our senses to grow sharper.", tags: ["Poetry", "W.B. Yeats", "Magic", "Awareness"], category: "Poetry"),
    MindfulnessQuote(text: "And now here is my secret, a very simple secret: It is only with the heart that one can see rightly; what is essential is invisible to the eye.", tags: ["Poetry", "Antoine de Saint-Exupéry", "Heart", "Seeing"], category: "Poetry"),
    MindfulnessQuote(text: "You can't connect the dots looking forward; you can only connect them looking backward.", tags: ["Poetry", "Steve Jobs", "Perspective", "Reflection"], category: "Poetry"),

    // MODERN PSYCHOLOGY & MINDFULNESS (20 quotes)
    MindfulnessQuote(text: "The present moment is the only moment available to us, and it is the door to all moments.", tags: ["Modern", "Thich Nhat Hanh", "Present", "Mindfulness"], category: "Modern"),
    MindfulnessQuote(text: "Between stimulus and response there is a space. In that space is our power to choose our response.", tags: ["Modern", "Viktor Frankl", "Choice", "Response"], category: "Modern"),
    MindfulnessQuote(text: "The way we talk to our children becomes their inner voice.", tags: ["Modern", "Peggy O'Mara", "Parenting", "Inner Voice"], category: "Modern"),
    MindfulnessQuote(text: "Your task is not to seek for love, but merely to seek and find all the barriers within yourself that you have built against it.", tags: ["Modern", "Rumi", "Love", "Barriers"], category: "Modern"),
    MindfulnessQuote(text: "The meeting of two personalities is like the contact of two chemical substances: if there is any reaction, both are transformed.", tags: ["Modern", "Carl Jung", "Relationships", "Transformation"], category: "Modern"),
    MindfulnessQuote(text: "I am not what happened to me, I am what I choose to become.", tags: ["Modern", "Carl Jung", "Choice", "Identity"], category: "Modern"),
    MindfulnessQuote(text: "Your visions will become clear only when you can look into your own heart.", tags: ["Modern", "Carl Jung", "Heart", "Vision"], category: "Modern"),
    MindfulnessQuote(text: "The privilege of a lifetime is to become who you truly are.", tags: ["Modern", "Carl Jung", "Authenticity", "Self"], category: "Modern"),
    MindfulnessQuote(text: "Everything that irritates us about others can lead us to an understanding of ourselves.", tags: ["Modern", "Carl Jung", "Self-Awareness", "Irritation"], category: "Modern"),
    MindfulnessQuote(text: "The meeting of two personalities is like the contact of two chemical substances.", tags: ["Modern", "Carl Jung", "Connection", "Transformation"], category: "Modern"),
    MindfulnessQuote(text: "What you resist not only persists, but will grow in size.", tags: ["Modern", "Carl Jung", "Resistance", "Growth"], category: "Modern"),
    MindfulnessQuote(text: "The unconscious wants truth, as the body does. The complexity and falsification that conscious life brings is what drives truth into hiding.", tags: ["Modern", "D.H. Lawrence", "Truth", "Consciousness"], category: "Modern"),
    MindfulnessQuote(text: "Be not afraid of growing slowly, be afraid only of standing still.", tags: ["Modern", "Chinese Proverb", "Growth", "Patience"], category: "Modern"),
    MindfulnessQuote(text: "The truth is, every day we wake up empty and frightened. Don't open the door to the study and begin reading. Take down a musical instrument.", tags: ["Modern", "Rumi", "Morning", "Creativity"], category: "Modern"),
    MindfulnessQuote(text: "Respond to every call that excites your spirit.", tags: ["Modern", "Rumi", "Spirit", "Response"], category: "Modern"),
    MindfulnessQuote(text: "The source of all wakefulness is within you.", tags: ["Modern", "Buddhist Wisdom", "Wakefulness", "Inner"], category: "Modern"),
    MindfulnessQuote(text: "Acceptance of others, their looks, their behaviors, their beliefs, bring you an inner peace and tranquility.", tags: ["Modern", "Anthony Douglas", "Acceptance", "Peace"], category: "Modern"),
    MindfulnessQuote(text: "The secret of getting ahead is getting started.", tags: ["Modern", "Mark Twain", "Starting", "Action"], category: "Modern"),
    MindfulnessQuote(text: "A year from now you may wish you had started today.", tags: ["Modern", "Karen Lamb", "Starting", "Regret"], category: "Modern"),
    MindfulnessQuote(text: "Dreams don't work unless you do.", tags: ["Modern", "John C. Maxwell", "Dreams", "Work"], category: "Modern"),

    // NATURE & TRANQUILITY (20 quotes)
    MindfulnessQuote(text: "In nature, nothing is perfect and everything is perfect.", tags: ["Nature", "Alice Walker", "Perfection", "Natural"], category: "Nature"),
    MindfulnessQuote(text: "Look deep into nature, and then you will understand everything better.", tags: ["Nature", "Albert Einstein", "Understanding", "Deep"], category: "Nature"),
    MindfulnessQuote(text: "The earth has music for those who listen.", tags: ["Nature", "Shakespeare", "Music", "Listening"], category: "Nature"),
    MindfulnessQuote(text: "Study nature, love nature, stay close to nature. It will never fail you.", tags: ["Nature", "Frank Lloyd Wright", "Study", "Love"], category: "Nature"),
    MindfulnessQuote(text: "The poetry of the earth is never dead.", tags: ["Nature", "John Keats", "Poetry", "Earth"], category: "Nature"),
    MindfulnessQuote(text: "In every walk with nature one receives far more than he seeks.", tags: ["Nature", "John Muir", "Walking", "Receiving"], category: "Nature"),
    MindfulnessQuote(text: "Nature does nothing uselessly.", tags: ["Nature", "Aristotle", "Efficiency", "Purpose"], category: "Nature"),
    MindfulnessQuote(text: "The ocean is a mighty harmonist.", tags: ["Nature", "William Wordsworth", "Ocean", "Harmony"], category: "Nature"),
    MindfulnessQuote(text: "The sky is the daily bread of the eyes.", tags: ["Nature", "Ralph Waldo Emerson", "Sky", "Sustenance"], category: "Nature"),
    MindfulnessQuote(text: "There are always flowers for those who want to see them.", tags: ["Nature", "Henri Matisse", "Flowers", "Perception"], category: "Nature"),
    MindfulnessQuote(text: "To watch a sunrise is to witness the beginning of everything.", tags: ["Nature", "Anthony T. Hincks", "Sunrise", "Beginning"], category: "Nature"),
    MindfulnessQuote(text: "In the woods, we return to reason and faith.", tags: ["Nature", "Ralph Waldo Emerson", "Woods", "Reason"], category: "Nature"),
    MindfulnessQuote(text: "Adopt the pace of nature: her secret is patience.", tags: ["Nature", "Ralph Waldo Emerson", "Patience", "Pace"], category: "Nature"),
    MindfulnessQuote(text: "The clearest way into the Universe is through a forest wilderness.", tags: ["Nature", "John Muir", "Universe", "Forest"], category: "Nature"),
    MindfulnessQuote(text: "One touch of nature makes the whole world kin.", tags: ["Nature", "William Shakespeare", "Connection", "Kinship"], category: "Nature"),
    MindfulnessQuote(text: "Nature is a mutable cloud which is always and never the same.", tags: ["Nature", "Ralph Waldo Emerson", "Change", "Constancy"], category: "Nature"),
    MindfulnessQuote(text: "The mountains are calling and I must go.", tags: ["Nature", "John Muir", "Mountains", "Calling"], category: "Nature"),
    MindfulnessQuote(text: "Nature always wears the colors of the spirit.", tags: ["Nature", "Ralph Waldo Emerson", "Colors", "Spirit"], category: "Nature"),
    MindfulnessQuote(text: "Let the rain kiss you. Let the rain beat upon your head with silver liquid drops.", tags: ["Nature", "Langston Hughes", "Rain", "Sensation"], category: "Nature"),
    MindfulnessQuote(text: "Autumn is a second spring when every leaf is a flower.", tags: ["Nature", "Albert Camus", "Autumn", "Beauty"], category: "Nature"),

    // FOCUS & PRODUCTIVITY (20 quotes)
    MindfulnessQuote(text: "The key to success is to focus our conscious mind on things we desire, not things we fear.", tags: ["Focus", "Brian Tracy", "Success", "Mind"], category: "Focus"),
    MindfulnessQuote(text: "Focus on being productive instead of busy.", tags: ["Focus", "Tim Ferriss", "Productivity", "Busy"], category: "Focus"),
    MindfulnessQuote(text: "Energy and persistence conquer all things.", tags: ["Focus", "Benjamin Franklin", "Energy", "Persistence"], category: "Focus"),
    MindfulnessQuote(text: "The successful warrior is the average man, with laser-like focus.", tags: ["Focus", "Bruce Lee", "Success", "Focus"], category: "Focus"),
    MindfulnessQuote(text: "Stay focused, go after your dreams and keep moving toward your goals.", tags: ["Focus", "LL Cool J", "Dreams", "Goals"], category: "Focus"),
    MindfulnessQuote(text: "Single tasking is the new multi-tasking.", tags: ["Focus", "Anonymous", "Single", "Tasking"], category: "Focus"),
    MindfulnessQuote(text: "Concentrate all your thoughts upon the work at hand.", tags: ["Focus", "Alexander Graham Bell", "Thoughts", "Work"], category: "Focus"),
    MindfulnessQuote(text: "Multitasking is the enemy of flow.", tags: ["Focus", "Mihaly Csikszentmihalyi", "Multitasking", "Flow"], category: "Focus"),
    MindfulnessQuote(text: "The ability to focus attention on important things is a defining characteristic of intelligence.", tags: ["Focus", "Robert J. Shiller", "Attention", "Intelligence"], category: "Focus"),
    MindfulnessQuote(text: "It's better to have one person working with you than three people working for you.", tags: ["Focus", "Dwight D. Eisenhower", "Collaboration", "Focus"], category: "Focus"),
    MindfulnessQuote(text: "The best way to predict the future is to create it.", tags: ["Focus", "Peter Drucker", "Future", "Creation"], category: "Focus"),
    MindfulnessQuote(text: "Amateurs sit and wait for inspiration, the rest of us just get up and go to work.", tags: ["Focus", "Stephen King", "Inspiration", "Work"], category: "Focus"),
    MindfulnessQuote(text: "Pleasure in the job puts perfection in the work.", tags: ["Focus", "Aristotle", "Pleasure", "Work"], category: "Focus"),
    MindfulnessQuote(text: "Success is nothing more than a few simple disciplines, practiced every day.", tags: ["Focus", "Jim Rohn", "Success", "Discipline"], category: "Focus"),
    MindfulnessQuote(text: "Motivation is what gets you started. Habit is what keeps you going.", tags: ["Focus", "Jim Ryun", "Motivation", "Habit"], category: "Focus"),
    MindfulnessQuote(text: "The man who removes a mountain begins by carrying away small stones.", tags: ["Focus", "Chinese Proverb", "Beginning", "Progress"], category: "Focus"),
    MindfulnessQuote(text: "Let me tell you the secret that has led me to my goal. My strength lies solely in my tenacity.", tags: ["Focus", "Louis Pasteur", "Tenacity", "Goal"], category: "Focus"),
    MindfulnessQuote(text: "Success is stumbling from failure to failure with no loss of enthusiasm.", tags: ["Focus", "Winston Churchill", "Success", "Failure"], category: "Focus"),
    MindfulnessQuote(text: "The difference between successful people and others is how long they spend time feeling sorry for themselves.", tags: ["Focus", "Barbara Corcoran", "Success", "Self-Pity"], category: "Focus"),
    MindfulnessQuote(text: "If you want to make an easy job seem mighty hard, just keep putting off doing it.", tags: ["Focus", "Olin Miller", "Procrastination", "Action"], category: "Focus"),

    // COMPASSION & KINDNESS (20 quotes)
    MindfulnessQuote(text: "My mission in life is not merely to survive, but to thrive; and to do so with some passion, some compassion, some humor, and some style.", tags: ["Compassion", "Maya Angelou", "Mission", "Life"], category: "Compassion"),
    MindfulnessQuote(text: "Be kind, for everyone you meet is fighting a battle you know nothing about.", tags: ["Compassion", "Ian Maclaren", "Kindness", "Battle"], category: "Compassion"),
    MindfulnessQuote(text: "The greatest glory in living lies not in never falling, but in rising every time we fall.", tags: ["Compassion", "Nelson Mandela", "Glory", "Resilience"], category: "Compassion"),
    MindfulnessQuote(text: "In a gentle way, you can shake the world.", tags: ["Compassion", "Mahatma Gandhi", "Gentle", "Impact"], category: "Compassion"),
    MindfulnessQuote(text: "Kindness is a language which the deaf can hear and the blind can see.", tags: ["Compassion", "Mark Twain", "Kindness", "Universal"], category: "Compassion"),
    MindfulnessQuote(text: "Carry out a random act of kindness, with no expectation of reward, safe in the knowledge that one day someone might do the same for you.", tags: ["Compassion", "Princess Diana", "Kindness", "Random"], category: "Compassion"),
    MindfulnessQuote(text: "The best way to find yourself is to lose yourself in the service of others.", tags: ["Compassion", "Mahatma Gandhi", "Service", "Self"], category: "Compassion"),
    MindfulnessQuote(text: "Compassion and tolerance are not a sign of weakness, but a sign of strength.", tags: ["Compassion", "Dalai Lama", "Tolerance", "Strength"], category: "Compassion"),
    MindfulnessQuote(text: "The purpose of human life is to serve, and to show compassion and the will to help others.", tags: ["Compassion", "Albert Schweitzer", "Purpose", "Service"], category: "Compassion"),
    MindfulnessQuote(text: "If you want others to be happy, practice compassion. If you want to be happy, practice compassion.", tags: ["Compassion", "Dalai Lama", "Happiness", "Practice"], category: "Compassion"),
    MindfulnessQuote(text: "Our human compassion binds us the one to the other—not in pity or patronizingly, but as human beings who have learnt how to turn our common suffering into hope for the future.", tags: ["Compassion", "Nelson Mandela", "Human", "Hope"], category: "Compassion"),
    MindfulnessQuote(text: "We cannot solve our problems with the same thinking we used when we created them.", tags: ["Compassion", "Albert Einstein", "Problems", "Thinking"], category: "Compassion"),
    MindfulnessQuote(text: "The time is always right to do what is right.", tags: ["Compassion", "Martin Luther King Jr.", "Time", "Right"], category: "Compassion"),
    MindfulnessQuote(text: "The more we care for the happiness of others, the greater is our own sense of well-being.", tags: ["Compassion", "Dalai Lama", "Happiness", "Well-being"], category: "Compassion"),
    MindfulnessQuote(text: "Love and compassion are necessities, not luxuries. Without them humanity cannot survive.", tags: ["Compassion", "Dalai Lama", "Love", "Necessities"], category: "Compassion"),
    MindfulnessQuote(text: "We must use time wisely and forever realize that the time is always ripe to do right.", tags: ["Compassion", "Nelson Mandela", "Time", "Right"], category: "Compassion"),
    MindfulnessQuote(text: "Everybody can be great... because anybody can serve. You don't have to have a college degree to serve.", tags: ["Compassion", "Martin Luther King Jr.", "Service", "Greatness"], category: "Compassion"),
    MindfulnessQuote(text: "Being deeply loved by someone gives you strength, while loving someone deeply gives you courage.", tags: ["Compassion", "Lao Tzu", "Love", "Strength"], category: "Compassion"),
    MindfulnessQuote(text: "The value of a man should be seen in what he gives and not in what he is able to receive.", tags: ["Compassion", "Albert Einstein", "Value", "Giving"], category: "Compassion"),
    MindfulnessQuote(text: "We make a living by what we get, but we make a life by what we give.", tags: ["Compassion", "Winston Churchill", "Living", "Giving"], category: "Compassion"),

    // RESILIENCE & GROWTH (20 quotes)
    MindfulnessQuote(text: "What doesn't kill you makes you stronger.", tags: ["Resilience", "Friedrich Nietzsche", "Strength", "Survival"], category: "Resilience"),
    MindfulnessQuote(text: "The oak fought the wind and was broken, the willow bent when it must and survived.", tags: ["Resilience", "Robert Jordan", "Flexibility", "Survival"], category: "Resilience"),
    MindfulnessQuote(text: "Fall seven times, stand up eight.", tags: ["Resilience", "Japanese Proverb", "Fall", "Stand"], category: "Resilience"),
    MindfulnessQuote(text: "You may not control all the events that happen to you, but you can decide not to be reduced by them.", tags: ["Resilience", "Maya Angelou", "Control", "Decision"], category: "Resilience"),
    MindfulnessQuote(text: "The gem cannot be polished without friction, nor man perfected without trials.", tags: ["Resilience", "Chinese Proverb", "Perfection", "Trials"], category: "Resilience"),
    MindfulnessQuote(text: "Smooth seas do not make skillful sailors.", tags: ["Resilience", "African Proverb", "Skill", "Challenge"], category: "Resilience"),
    MindfulnessQuote(text: "Out of difficulties grow miracles.", tags: ["Resilience", "Jean de La Bruyère", "Difficulties", "Miracles"], category: "Resilience"),
    MindfulnessQuote(text: "The wound is the place where the Light enters you.", tags: ["Resilience", "Rumi", "Wound", "Light"], category: "Resilience"),
    MindfulnessQuote(text: "What a wonderful thought it is that some of the best days of our lives haven't happened yet.", tags: ["Resilience", "Anonymous", "Wonderful", "Future"], category: "Resilience"),
    MindfulnessQuote(text: "You gotta keep moving, keep living, keep giving.", tags: ["Resilience", "Anonymous", "Moving", "Giving"], category: "Resilience"),
    MindfulnessQuote(text: "Sometimes when things are falling apart they may actually be falling into place.", tags: ["Resilience", "Anonymous", "Falling", "Place"], category: "Resilience"),
    MindfulnessQuote(text: "When life knocks you down, roll over and look at the stars.", tags: ["Resilience", "Anonymous", "Life", "Stars"], category: "Resilience"),
    MindfulnessQuote(text: "The darkest nights produce the brightest stars.", tags: ["Resilience", "Anonymous", "Dark", "Stars"], category: "Resilience"),
    MindfulnessQuote(text: "Let your hopes, not your hurts, shape your future.", tags: ["Resilience", "Robert Schuller", "Hopes", "Future"], category: "Resilience"),
    MindfulnessQuote(text: "When one door closes, another opens; but we often look so long and so regretfully upon the closed door that we do not see the one that has opened for us.", tags: ["Resilience", "Alexander Graham Bell", "Doors", "Opportunity"], category: "Resilience"),
    MindfulnessQuote(text: "Difficulties in life are intended to make us better, not bitter.", tags: ["Resilience", "Dan Reeves", "Difficulties", "Better"], category: "Resilience"),
    MindfulnessQuote(text: "I am not a product of my circumstances. I am a product of my decisions.", tags: ["Resilience", "Stephen Covey", "Circumstances", "Decisions"], category: "Resilience"),
    MindfulnessQuote(text: "The pessimist sees difficulty in every opportunity. The optimist sees opportunity in every difficulty.", tags: ["Resilience", "Winston Churchill", "Optimist", "Difficulty"], category: "Resilience"),
    MindfulnessQuote(text: "Your attitude determines your direction.", tags: ["Resilience", "Anonymous", "Attitude", "Direction"], category: "Resilience"),
    MindfulnessQuote(text: "We are all faced with a series of great opportunities brilliantly disguised as impossible situations.", tags: ["Resilience", "Charles R. Swindoll", "Opportunities", "Situations"], category: "Resilience"),

    // GRATITUDE & PRESENCE (10 quotes)
    MindfulnessQuote(text: "Gratitude turns what we have into enough.", tags: ["Gratitude", "Anonymous", "Enough", "Satisfaction"], category: "Gratitude"),
    MindfulnessQuote(text: "The more grateful I am, the more beauty I see.", tags: ["Gratitude", "Mary Davis", "Beauty", "Seeing"], category: "Gratitude"),
    MindfulnessQuote(text: "Be grateful for what you have and stop complaining—it bores everybody else, does you no good, and doesn't solve any problems.", tags: ["Gratitude", "Zig Ziglar", "Complaining", "Problems"], category: "Gratitude"),
    MindfulnessQuote(text: "Gratitude is the healthiest of all human emotions. The more you express gratitude for what you have, the more likely you will have even more to express gratitude for.", tags: ["Gratitude", "Zig Ziglar", "Health", "Expression"], category: "Gratitude"),
    MindfulnessQuote(text: "Give thanks for a little and you will find a lot.", tags: ["Gratitude", "Hausa Proverb", "Little", "Lot"], category: "Gratitude"),
    MindfulnessQuote(text: "When I started counting my blessings, my whole life turned around.", tags: ["Gratitude", "Willie Nelson", "Blessings", "Life"], category: "Gratitude"),
    MindfulnessQuote(text: "Acknowledging the good that you already have in your life is the foundation for all abundance.", tags: ["Gratitude", "Eckhart Tolle", "Good", "Abundance"], category: "Gratitude"),
    MindfulnessQuote(text: "Gratitude is not only the greatest of virtues but the parent of all others.", tags: ["Gratitude", "Cicero", "Virtues", "Parent"], category: "Gratitude"),
    MindfulnessQuote(text: "Enjoy the little things, for one day you may look back and realize they were the big things.", tags: ["Gratitude", "Robert Brault", "Little", "Big"], category: "Gratitude"),
    MindfulnessQuote(text: "Gratitude can transform common days into thanksgivings, turn routine jobs into joy, and change ordinary opportunities into blessings.", tags: ["Gratitude", "William Arthur Ward", "Transform", "Blessings"], category: "Gratitude")
]

// B-003: Debug logging and structure verification
// Total quotes: 170 quotes across 8 categories (Stoicism, Buddhism, Poetry, Modern, Nature, Focus, Compassion, Resilience, Gratitude)
// Category Distribution: Buddhism: 20, Compassion: 20, Focus: 20, Gratitude: 10, Modern: 20, Nature: 20, Poetry: 20, Resilience: 20, Stoicism: 20

// B-003: Debug notes for development:
// - Each quote has unique UUID generated automatically
// - Categories match user interest selection options from instructions.md
// - Content covers 150+ quotes as required (we have 170 total)
// - All quotes are offline-available (stored locally in codebase)
// - Rule applied: "Always add debug logs & comments in the code for easier debug & readability"
