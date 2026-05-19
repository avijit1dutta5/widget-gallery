package com.example.widgetgallery.presentation.theme

import androidx.compose.foundation.isSystemInDarkTheme
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.Typography
import androidx.compose.material3.darkColorScheme
import androidx.compose.material3.lightColorScheme
import androidx.compose.runtime.Composable
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.graphics.lerp
import com.example.widgetgallery.domain.ColorFlavor
import com.example.widgetgallery.domain.ThemeMode

private fun seedColor(flavor: ColorFlavor) = Color(flavor.seed)

private fun lightScheme(seed: Color) = lightColorScheme(
    primary = seed,
    onPrimary = Color.White,
    primaryContainer = lerp(seed, Color.White, 0.78f),
    onPrimaryContainer = lerp(seed, Color.Black, 0.55f),
    secondary = lerp(seed, Color(0xFF8E8E93), 0.35f),
    tertiary = lerp(seed, Color(0xFFFF8A65), 0.5f),
    secondaryContainer = lerp(seed, Color.White, 0.82f),
    onSecondaryContainer = lerp(seed, Color.Black, 0.55f),
    background = Color(0xFFFDFBFF),
    onBackground = Color(0xFF1A1A1F),
    surface = Color(0xFFFDFBFF),
    onSurface = Color(0xFF1A1A1F),
    surfaceVariant = Color(0xFFE6E1EC),
    onSurfaceVariant = Color(0xFF49454E),
    surfaceContainerLow = Color(0xFFF5F2FA),
    surfaceContainerHigh = Color(0xFFECE8F2),
    surfaceContainerHighest = Color(0xFFE6E1EC),
    outline = Color(0xFF7A757F),
    outlineVariant = Color(0xFFCBC4CF),
    error = Color(0xFFBA1A1A),
    onError = Color.White,
    errorContainer = Color(0xFFFFDAD6),
    onErrorContainer = Color(0xFF410002),
)

private fun darkScheme(seed: Color) = darkColorScheme(
    primary = lerp(seed, Color.White, 0.35f),
    onPrimary = lerp(seed, Color.Black, 0.6f),
    primaryContainer = lerp(seed, Color.Black, 0.45f),
    onPrimaryContainer = lerp(seed, Color.White, 0.7f),
    secondary = lerp(seed, Color.White, 0.45f),
    tertiary = lerp(seed, Color(0xFFFF8A65), 0.45f),
    secondaryContainer = lerp(seed, Color.Black, 0.5f),
    onSecondaryContainer = lerp(seed, Color.White, 0.7f),
    background = Color(0xFF131318),
    onBackground = Color(0xFFE5E1E9),
    surface = Color(0xFF131318),
    onSurface = Color(0xFFE5E1E9),
    surfaceVariant = Color(0xFF49454E),
    onSurfaceVariant = Color(0xFFCBC4CF),
    surfaceContainerLow = Color(0xFF1D1B20),
    surfaceContainerHigh = Color(0xFF2B2930),
    surfaceContainerHighest = Color(0xFF36343B),
    outline = Color(0xFF948F99),
    outlineVariant = Color(0xFF49454E),
    error = Color(0xFFFFB4AB),
    onError = Color(0xFF690005),
    errorContainer = Color(0xFF93000A),
    onErrorContainer = Color(0xFFFFDAD6),
)

@Composable
fun WidgetGalleryTheme(
    flavor: ColorFlavor,
    themeMode: ThemeMode,
    content: @Composable () -> Unit,
) {
    val dark = when (themeMode) {
        ThemeMode.System -> isSystemInDarkTheme()
        ThemeMode.Light -> false
        ThemeMode.Dark -> true
    }
    val seed = seedColor(flavor)
    MaterialTheme(
        colorScheme = if (dark) darkScheme(seed) else lightScheme(seed),
        typography = Typography(),
        content = content,
    )
}
