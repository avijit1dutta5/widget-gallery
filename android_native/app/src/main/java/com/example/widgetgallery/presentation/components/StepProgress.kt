package com.example.widgetgallery.presentation.components

import androidx.compose.foundation.background
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.shape.CircleShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.Check
import androidx.compose.material3.Icon
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp

/** Horizontal multi-step indicator for wizards / checkout. */
@Composable
fun StepProgress(
    steps: List<String>,
    currentStep: Int,
    modifier: Modifier = Modifier,
) {
    val scheme = MaterialTheme.colorScheme
    Row(modifier, verticalAlignment = Alignment.Top) {
        steps.forEachIndexed { i, step ->
            Column(
                horizontalAlignment = Alignment.CenterHorizontally,
            ) {
                Box(
                    Modifier.size(30.dp).clip(CircleShape)
                        .background(
                            if (i <= currentStep) scheme.primary
                            else scheme.surfaceContainerHighest
                        ),
                    contentAlignment = Alignment.Center,
                ) {
                    if (i < currentStep) {
                        Icon(Icons.Filled.Check, null,
                            tint = scheme.onPrimary,
                            modifier = Modifier.size(16.dp))
                    } else {
                        Text("${i + 1}",
                            color = if (i == currentStep) scheme.onPrimary
                            else scheme.onSurfaceVariant,
                            fontWeight = FontWeight.Bold)
                    }
                }
                Spacer(Modifier.height(6.dp))
                Text(step, fontSize = 11.sp,
                    color = if (i <= currentStep) scheme.primary
                    else scheme.onSurfaceVariant,
                    fontWeight = if (i == currentStep) FontWeight.Bold
                    else FontWeight.Normal)
            }
            if (i != steps.lastIndex) {
                Box(
                    Modifier
                        .weight(1f)
                        .padding(top = 14.dp)
                        .height(2.dp)
                        .background(
                            if (i < currentStep) scheme.primary
                            else scheme.outlineVariant
                        )
                )
            }
        }
    }
}
