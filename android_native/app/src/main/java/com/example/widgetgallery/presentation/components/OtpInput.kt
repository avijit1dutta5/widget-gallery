package com.example.widgetgallery.presentation.components

import androidx.compose.foundation.layout.*
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.foundation.text.KeyboardOptions
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.OutlinedTextField
import androidx.compose.runtime.Composable
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateListOf
import androidx.compose.runtime.remember
import androidx.compose.ui.Modifier
import androidx.compose.ui.focus.FocusRequester
import androidx.compose.ui.focus.focusRequester
import androidx.compose.ui.text.TextStyle
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.input.KeyboardType
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp

/** Fixed-length OTP / PIN entry with auto-advance. */
@Composable
fun OtpInput(
    modifier: Modifier = Modifier,
    length: Int = 4,
    onCompleted: (String) -> Unit = {},
) {
    val cells = remember { mutableStateListOf(*Array(length) { "" }) }
    val focus = remember { List(length) { FocusRequester() } }
    Row(modifier, horizontalArrangement = Arrangement.spacedBy(12.dp)) {
        for (i in 0 until length) {
            OutlinedTextField(
                value = cells[i],
                onValueChange = { raw ->
                    val v = raw.filter { it.isDigit() }.takeLast(1)
                    cells[i] = v
                    if (v.isNotEmpty() && i < length - 1) focus[i + 1].requestFocus()
                    if (v.isEmpty() && i > 0) focus[i - 1].requestFocus()
                    if (cells.all { it.isNotEmpty() }) onCompleted(cells.joinToString(""))
                },
                singleLine = true,
                textStyle = TextStyle(
                    textAlign = TextAlign.Center, fontSize = 20.sp,
                    fontWeight = FontWeight.Bold,
                    color = MaterialTheme.colorScheme.onSurface,
                ),
                keyboardOptions = KeyboardOptions(keyboardType = KeyboardType.Number),
                shape = RoundedCornerShape(12.dp),
                modifier = Modifier.width(56.dp)
                    .focusRequester(focus[i]),
            )
        }
    }
}
