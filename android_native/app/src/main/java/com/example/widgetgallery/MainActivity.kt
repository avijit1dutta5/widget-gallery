package com.example.widgetgallery

import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.activity.compose.BackHandler
import androidx.activity.enableEdgeToEdge
import androidx.compose.runtime.Composable
import androidx.compose.runtime.CompositionLocalProvider
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.runtime.setValue
import com.example.widgetgallery.di.ServiceLocator
import com.example.widgetgallery.domain.GalleryWidget
import com.example.widgetgallery.presentation.i18n.LocalStrings
import com.example.widgetgallery.presentation.i18n.stringsFor
import com.example.widgetgallery.presentation.screens.GalleryHomeScreen
import com.example.widgetgallery.presentation.screens.SettingsSheet
import com.example.widgetgallery.presentation.screens.WidgetDetailScreen
import com.example.widgetgallery.presentation.state.AppSettings
import com.example.widgetgallery.presentation.state.LocalAppSettings
import com.example.widgetgallery.presentation.theme.WidgetGalleryTheme

class MainActivity : ComponentActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        enableEdgeToEdge()
        setContent { WidgetGalleryRoot() }
    }
}

@Composable
fun WidgetGalleryRoot() {
    val settings = remember { AppSettings() }
    val homeVm = remember { ServiceLocator.createGalleryHomeViewModel() }
    var selected by remember { mutableStateOf<GalleryWidget?>(null) }
    var showSettings by remember { mutableStateOf(false) }

    CompositionLocalProvider(
        LocalAppSettings provides settings,
        LocalStrings provides stringsFor(settings.language),
    ) {
        WidgetGalleryTheme(flavor = settings.flavor, themeMode = settings.themeMode) {
            val current = selected
            if (current == null) {
                GalleryHomeScreen(
                    vm = homeVm,
                    onOpen = { selected = it },
                    onOpenSettings = { showSettings = true },
                )
            } else {
                BackHandler { selected = null }
                WidgetDetailScreen(widget = current, onBack = { selected = null })
            }
            if (showSettings) {
                SettingsSheet(settings = settings,
                    onDismiss = { showSettings = false })
            }
        }
    }
}
