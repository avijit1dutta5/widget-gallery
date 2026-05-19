package com.example.widgetgallery.domain

/** Domain entity describing a single reusable widget in the gallery. */
data class GalleryWidget(
    val id: String,
    val title: String,
    val description: String,
    val category: String,
    val code: String,
) {
    fun matches(query: String): Boolean {
        val q = query.trim().lowercase()
        if (q.isEmpty()) return true
        return title.lowercase().contains(q) ||
            description.lowercase().contains(q) ||
            category.lowercase().contains(q)
    }
}

/** A selectable accent / seed color "flavor". */
enum class ColorFlavor(val label: String, val seed: Long) {
    Violet("Violet", 0xFF6C5CE7),
    Ocean("Ocean", 0xFF0EA5E9),
    Emerald("Emerald", 0xFF10B981),
    Sunset("Sunset", 0xFFF97316),
    Rose("Rose", 0xFFF43F5E),
    Graphite("Graphite", 0xFF475569),
}

/** A language the UI can be displayed in. */
enum class AppLanguage(val code: String, val nativeName: String) {
    English("en", "English"),
    Bengali("bn", "বাংলা"),
    Hindi("hi", "हिन्दी");

    companion object {
        fun fromCode(code: String): AppLanguage =
            entries.firstOrNull { it.code == code } ?: English
    }
}

enum class ThemeMode { System, Light, Dark }
