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
    var flavor by mutableStateOf(ColorFlavor.Violet)
    var themeMode by mutableStateOf(ThemeMode.System)
}

val LocalAppSettings = compositionLocalOf<AppSettings> {
    error("AppSettings not provided")
}
