package com.example.widgetgallery.presentation.i18n

import androidx.compose.runtime.compositionLocalOf
import com.example.widgetgallery.domain.AppLanguage

/** Localized UI strings (mirrors the Flutter app's gen-l10n output). */
data class Strings(
    val appTitle: String,
    val homeIntro: String,
    val searchHint: String,
    val widgetCountLabel: (Int) -> String,
    val noResults: String,
    val preview: String,
    val sourceCode: String,
    val copy: String,
    val copied: String,
    val copiedToClipboard: String,
    val appearance: String,
    val languageLabel: String,
    val colorLabel: String,
    val themeLabel: String,
    val themeSystem: String,
    val themeLight: String,
    val themeDark: String,
    val done: String,
    val categories: Map<String, String>,
) {
    fun category(key: String): String = categories[key] ?: key
}

private fun cats(b: String, c: String, i: String, f: String, d: String,
                 o: String, n: String, fo: String, l: String, li: String) =
    mapOf(
        "Buttons" to b, "Cards" to c, "Inputs" to i, "Feedback" to f,
        "Display" to d, "Overlays" to o, "Navigation" to n, "Forms" to fo,
        "Layout" to l, "Lists" to li,
    )

private val en = Strings(
    appTitle = "Widget Gallery",
    homeIntro = "Generic, reusable Compose widgets. Tap any widget to see a live preview and copy its source code.",
    searchHint = "Search widgets",
    widgetCountLabel = { "$it widgets" },
    noResults = "No widgets match your search.",
    preview = "Preview",
    sourceCode = "Source code",
    copy = "Copy",
    copied = "Copied",
    copiedToClipboard = "Code copied to clipboard",
    appearance = "Appearance",
    languageLabel = "Language",
    colorLabel = "Color",
    themeLabel = "Theme",
    themeSystem = "System",
    themeLight = "Light",
    themeDark = "Dark",
    done = "Done",
    categories = cats("Buttons", "Cards", "Inputs", "Feedback", "Display",
        "Overlays", "Navigation", "Forms", "Layout", "Lists"),
)

private val bn = Strings(
    appTitle = "উইজেট গ্যালারি",
    homeIntro = "জেনেরিক, পুনঃব্যবহারযোগ্য Compose উইজেট। যেকোনো উইজেটে ট্যাপ করে লাইভ প্রিভিউ দেখুন ও সোর্স কোড কপি করুন।",
    searchHint = "উইজেট খুঁজুন",
    widgetCountLabel = { "${it}টি উইজেট" },
    noResults = "আপনার অনুসন্ধানের সাথে কোনো উইজেট মেলেনি।",
    preview = "প্রিভিউ",
    sourceCode = "সোর্স কোড",
    copy = "কপি",
    copied = "কপি হয়েছে",
    copiedToClipboard = "কোড ক্লিপবোর্ডে কপি হয়েছে",
    appearance = "অ্যাপিয়ারেন্স",
    languageLabel = "ভাষা",
    colorLabel = "রঙ",
    themeLabel = "থিম",
    themeSystem = "সিস্টেম",
    themeLight = "লাইট",
    themeDark = "ডার্ক",
    done = "সম্পন্ন",
    categories = cats("বাটন", "কার্ড", "ইনপুট", "ফিডব্যাক", "ডিসপ্লে",
        "ওভারলে", "নেভিগেশন", "ফর্ম", "লেআউট", "লিস্ট"),
)

private val hi = Strings(
    appTitle = "विजेट गैलरी",
    homeIntro = "जेनेरिक, पुन: प्रयोज्य Compose विजेट। किसी भी विजेट पर टैप करके लाइव प्रीव्यू देखें और सोर्स कोड कॉपी करें।",
    searchHint = "विजेट खोजें",
    widgetCountLabel = { "$it विजेट" },
    noResults = "आपकी खोज से कोई विजेट मेल नहीं खाता।",
    preview = "प्रीव्यू",
    sourceCode = "सोर्स कोड",
    copy = "कॉपी",
    copied = "कॉपी हो गया",
    copiedToClipboard = "कोड क्लिपबोर्ड पर कॉपी हो गया",
    appearance = "रूप",
    languageLabel = "भाषा",
    colorLabel = "रंग",
    themeLabel = "थीम",
    themeSystem = "सिस्टम",
    themeLight = "लाइट",
    themeDark = "डार्क",
    done = "हो गया",
    categories = cats("बटन", "कार्ड", "इनपुट", "फीडबैक", "डिस्प्ले",
        "ओवरले", "नेविगेशन", "फ़ॉर्म", "लेआउट", "सूचियाँ"),
)

fun stringsFor(language: AppLanguage): Strings = when (language) {
    AppLanguage.English -> en
    AppLanguage.Bengali -> bn
    AppLanguage.Hindi -> hi
}

val LocalStrings = compositionLocalOf { en }
