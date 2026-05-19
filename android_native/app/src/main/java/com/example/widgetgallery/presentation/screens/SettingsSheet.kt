package com.example.widgetgallery.presentation.screens

import androidx.compose.animation.core.animateDpAsState
import androidx.compose.foundation.background
import androidx.compose.foundation.border
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.rememberScrollState
import androidx.compose.foundation.shape.CircleShape
import androidx.compose.foundation.verticalScroll
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.BrightnessAuto
import androidx.compose.material.icons.filled.Check
import androidx.compose.material.icons.filled.DarkMode
import androidx.compose.material.icons.filled.LightMode
import androidx.compose.material3.*
import androidx.compose.runtime.Composable
import androidx.compose.runtime.getValue
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp
import com.example.widgetgallery.domain.AppLanguage
import com.example.widgetgallery.domain.ColorFlavor
import com.example.widgetgallery.domain.ThemeMode
import com.example.widgetgallery.presentation.AppCredit
import com.example.widgetgallery.presentation.i18n.LocalStrings
import com.example.widgetgallery.presentation.state.AppSettings

@OptIn(ExperimentalMaterial3Api::class, ExperimentalLayoutApi::class)
@Composable
fun SettingsSheet(settings: AppSettings, onDismiss: () -> Unit) {
    val s = LocalStrings.current
    ModalBottomSheet(onDismissRequest = onDismiss) {
        Column(
            Modifier
                .verticalScroll(rememberScrollState())
                .padding(24.dp, 4.dp, 24.dp, 28.dp),
        ) {
            Text(s.appearance, style = MaterialTheme.typography.headlineSmall,
                fontWeight = FontWeight.Bold)
            Spacer(Modifier.height(24.dp))

            Text(s.languageLabel, fontWeight = FontWeight.SemiBold)
            Spacer(Modifier.height(12.dp))
            FlowRow(horizontalArrangement = Arrangement.spacedBy(10.dp)) {
                AppLanguage.entries.forEach { lang ->
                    FilterChip(
                        selected = settings.language == lang,
                        onClick = { settings.language = lang },
                        label = { Text(lang.nativeName) },
                    )
                }
            }
            Spacer(Modifier.height(28.dp))

            Text(s.colorLabel, fontWeight = FontWeight.SemiBold)
            Spacer(Modifier.height(14.dp))
            FlowRow(horizontalArrangement = Arrangement.spacedBy(16.dp),
                verticalArrangement = Arrangement.spacedBy(16.dp)) {
                ColorFlavor.entries.forEach { flavor ->
                    Swatch(Color(flavor.seed),
                        settings.flavor == flavor) { settings.flavor = flavor }
                }
            }
            Spacer(Modifier.height(28.dp))

            Text(s.themeLabel, fontWeight = FontWeight.SemiBold)
            Spacer(Modifier.height(12.dp))
            SingleChoiceSegmentedButtonRow(Modifier.fillMaxWidth()) {
                val modes = listOf(
                    Triple(ThemeMode.System, s.themeSystem, Icons.Filled.BrightnessAuto),
                    Triple(ThemeMode.Light, s.themeLight, Icons.Filled.LightMode),
                    Triple(ThemeMode.Dark, s.themeDark, Icons.Filled.DarkMode),
                )
                modes.forEachIndexed { i, (mode, label, icon) ->
                    SegmentedButton(
                        selected = settings.themeMode == mode,
                        onClick = { settings.setThemeMode(mode) },
                        shape = SegmentedButtonDefaults.itemShape(i, modes.size),
                        icon = { Icon(icon, null, Modifier.size(18.dp)) },
                        label = { Text(label) },
                    )
                }
            }
            Spacer(Modifier.height(28.dp))
            Button(onClick = onDismiss, modifier = Modifier.fillMaxWidth()) {
                Text(s.done)
            }
            AppCredit()
        }
    }
}

@Composable
private fun Swatch(color: Color, selected: Boolean, onClick: () -> Unit) {
    val size by animateDpAsState(if (selected) 54.dp else 52.dp, label = "sw")
    val ring = MaterialTheme.colorScheme.onSurface
    Box(
        Modifier.size(size).clip(CircleShape).background(color)
            .border(if (selected) 3.dp else 0.dp,
                if (selected) ring else Color.Transparent, CircleShape)
            .clickable(onClick = onClick),
        contentAlignment = Alignment.Center,
    ) {
        if (selected) Icon(Icons.Filled.Check, null, tint = Color.White)
    }
}
