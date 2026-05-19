package com.example.widgetgallery.presentation.codeview

import androidx.compose.foundation.background
import androidx.compose.foundation.border
import androidx.compose.foundation.horizontalScroll
import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.Spacer
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.height
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.layout.size
import androidx.compose.foundation.layout.width
import androidx.compose.foundation.rememberScrollState
import androidx.compose.foundation.shape.CircleShape
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.Check
import androidx.compose.material.icons.filled.ContentCopy
import androidx.compose.material3.Icon
import androidx.compose.material3.Text
import androidx.compose.material3.TextButton
import androidx.compose.runtime.Composable
import androidx.compose.runtime.LaunchedEffect
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.runtime.setValue
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.platform.LocalClipboardManager
import androidx.compose.ui.text.AnnotatedString
import androidx.compose.ui.text.font.FontFamily
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import com.example.widgetgallery.presentation.i18n.LocalStrings
import kotlinx.coroutines.delay

@Composable
fun CodeView(code: String, modifier: Modifier = Modifier) {
    val strings = LocalStrings.current
    val clipboard = LocalClipboardManager.current
    var copied by remember { mutableStateOf(false) }
    val highlighted = remember(code) { highlightKotlin(code) }
    val lineCount = remember(code) { code.count { it == '\n' } + 1 }
    val hScroll = rememberScrollState()

    LaunchedEffect(copied) {
        if (copied) { delay(2000); copied = false }
    }

    Column(
        modifier
            .clip(RoundedCornerShape(14.dp))
            .background(CodePalette.background)
            .border(1.dp, CodePalette.surface, RoundedCornerShape(14.dp)),
    ) {
        // Window chrome
        Row(
            Modifier.fillMaxWidth().padding(start = 16.dp, end = 8.dp,
                top = 12.dp, bottom = 12.dp),
            verticalAlignment = Alignment.CenterVertically,
        ) {
            Dot(Color3.Red); Spacer(Modifier.width(8.dp))
            Dot(Color3.Yellow); Spacer(Modifier.width(8.dp))
            Dot(Color3.Green); Spacer(Modifier.width(16.dp))
            Box(
                Modifier
                    .clip(RoundedCornerShape(6.dp))
                    .background(CodePalette.surface)
                    .padding(horizontal = 10.dp, vertical = 4.dp),
            ) {
                Text("Widget.kt", color = CodePalette.text,
                    fontFamily = FontFamily.Monospace, fontSize = 12.sp)
            }
            Spacer(Modifier.weight(1f))
            TextButton(onClick = {
                clipboard.setText(AnnotatedString(code))
                copied = true
            }) {
                Icon(
                    if (copied) Icons.Filled.Check else Icons.Filled.ContentCopy,
                    contentDescription = null,
                    tint = if (copied) Color3.Accent else CodePalette.text,
                    modifier = Modifier.size(15.dp),
                )
                Spacer(Modifier.width(6.dp))
                Text(
                    if (copied) strings.copied else strings.copy,
                    color = if (copied) Color3.Accent else CodePalette.text,
                    fontFamily = FontFamily.Monospace, fontSize = 13.sp,
                )
            }
        }
        Box(Modifier.fillMaxWidth().height(1.dp).background(CodePalette.surface))
        Row {
            // gutter
            Column(
                Modifier
                    .background(CodePalette.background)
                    .padding(start = 16.dp, end = 12.dp, top = 16.dp,
                        bottom = 16.dp),
                horizontalAlignment = Alignment.End,
            ) {
                for (i in 1..lineCount) {
                    Text(
                        "$i",
                        color = CodePalette.gutter,
                        fontFamily = FontFamily.Monospace,
                        fontSize = 13.sp,
                        lineHeight = 20.sp,
                    )
                }
            }
            Box(Modifier.width(1.dp).background(CodePalette.surface))
            Box(Modifier.horizontalScroll(hScroll).padding(16.dp)) {
                Text(
                    highlighted,
                    color = CodePalette.text,
                    fontFamily = FontFamily.Monospace,
                    fontSize = 13.sp,
                    lineHeight = 20.sp,
                    fontWeight = FontWeight.Normal,
                    softWrap = false,
                )
            }
        }
    }
}

private object Color3 {
    val Red = androidx.compose.ui.graphics.Color(0xFFFF5F56)
    val Yellow = androidx.compose.ui.graphics.Color(0xFFFFBD2E)
    val Green = androidx.compose.ui.graphics.Color(0xFF27C93F)
    val Accent = androidx.compose.ui.graphics.Color(0xFFA6E3A1)
}

@Composable
private fun Dot(color: androidx.compose.ui.graphics.Color) {
    Box(Modifier.size(12.dp).clip(CircleShape).background(color))
}
