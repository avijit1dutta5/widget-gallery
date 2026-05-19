package com.example.widgetgallery.presentation.screens

import androidx.compose.foundation.background
import androidx.compose.foundation.border
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.rememberScrollState
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.foundation.verticalScroll
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.automirrored.filled.ArrowBack
import androidx.compose.material3.*
import androidx.compose.runtime.Composable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.text.font.FontFamily
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import com.example.widgetgallery.domain.GalleryWidget
import com.example.widgetgallery.presentation.AppCredit
import com.example.widgetgallery.presentation.anim.FadeSlideIn
import com.example.widgetgallery.presentation.codeview.CodePalette
import com.example.widgetgallery.presentation.codeview.CodeView
import com.example.widgetgallery.presentation.i18n.LocalStrings
import com.example.widgetgallery.presentation.preview.WidgetPreview

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun WidgetDetailScreen(widget: GalleryWidget, onBack: () -> Unit) {
    val s = LocalStrings.current
    val scheme = MaterialTheme.colorScheme
    Scaffold(
        topBar = {
            TopAppBar(
                title = {
                    Row(verticalAlignment = Alignment.CenterVertically) {
                        Text("</>", color = scheme.primary,
                            fontFamily = FontFamily.Monospace,
                            fontWeight = FontWeight.Bold, fontSize = 16.sp)
                        Spacer(Modifier.width(10.dp))
                        Text(widget.title, fontFamily = FontFamily.Monospace,
                            fontWeight = FontWeight.Bold)
                    }
                },
                navigationIcon = {
                    IconButton(onClick = onBack) {
                        Icon(Icons.AutoMirrored.Filled.ArrowBack, "Back")
                    }
                },
            )
        },
    ) { padding ->
        Column(
            Modifier.padding(padding).fillMaxSize()
                .verticalScroll(rememberScrollState()).padding(20.dp),
        ) {
            FadeSlideIn(80) { m ->
                Column(
                    m.fillMaxWidth().clip(RoundedCornerShape(12.dp))
                        .border(1.dp, CodePalette.surface,
                            RoundedCornerShape(12.dp))
                        .background(CodePalette.background).padding(16.dp),
                ) {
                    Text("/// ${widget.description}",
                        color = CodePalette.comment,
                        fontFamily = FontFamily.Monospace, fontSize = 13.5.sp)
                }
            }
            Spacer(Modifier.height(24.dp))
            FadeSlideIn(180) { m -> CodeLabel(s.preview, m) }
            Spacer(Modifier.height(12.dp))
            FadeSlideIn(260) { m ->
                Box(
                    m.fillMaxWidth()
                        .heightIn(min = 180.dp)
                        .clip(RoundedCornerShape(20.dp))
                        .border(1.dp, scheme.outlineVariant,
                            RoundedCornerShape(20.dp))
                        .background(scheme.surfaceContainerLow)
                        .padding(28.dp),
                    contentAlignment = Alignment.Center,
                ) { WidgetPreview(widget.id) }
            }
            Spacer(Modifier.height(28.dp))
            FadeSlideIn(360) { m -> CodeLabel(s.sourceCode, m) }
            Spacer(Modifier.height(12.dp))
            FadeSlideIn(440) { m -> CodeView(widget.code, m) }
            Spacer(Modifier.height(12.dp))
            AppCredit()
        }
    }
}

@Composable
private fun CodeLabel(label: String, modifier: Modifier = Modifier) {
    Row(modifier) {
        Text("// ", color = MaterialTheme.colorScheme.primary,
            fontFamily = FontFamily.Monospace, fontWeight = FontWeight.Bold,
            fontSize = 16.sp)
        Text(label, fontFamily = FontFamily.Monospace,
            fontWeight = FontWeight.Bold, fontSize = 16.sp)
    }
}
