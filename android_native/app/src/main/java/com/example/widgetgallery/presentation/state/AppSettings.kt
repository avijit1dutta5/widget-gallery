package com.example.widgetgallery.presentation.state

import androidx.compose.runtime.compositionLocalOf
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.setValue
import com.example.widgetgallery.domain.AppLanguage
import com.example.widgetgallery.domain.ColorFlavor
import com.example.widgetgallery.domain.ThemeMode

/** App-wide appearance state: language, color flavor and theme mode. */
class AppSettings {
    var language by mutableStateOf(AppLanguage.English)
        private set
    var flavor by mutableStateOf(ColorFlavor.Violet)
        private set
    var themeMode by mutableStateOf(ThemeMode.System)
        private set

    fun setLanguage(value: AppLanguage) { language = value }
    fun setFlavor(value: ColorFlavor) { flavor = value }
    fun setThemeMode(value: ThemeMode) { themeMode = value }
}

val LocalAppSettings = compositionLocalOf<AppSettings> {
    error("AppSettings not provided")
}
