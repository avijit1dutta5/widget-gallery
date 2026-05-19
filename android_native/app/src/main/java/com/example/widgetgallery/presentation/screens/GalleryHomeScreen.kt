package com.example.widgetgallery.presentation.screens

import androidx.compose.foundation.background
import androidx.compose.foundation.border
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.grid.GridCells
import androidx.compose.foundation.lazy.grid.GridItemSpan
import androidx.compose.foundation.lazy.grid.LazyVerticalGrid
import androidx.compose.foundation.lazy.grid.itemsIndexed
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.Tune
import androidx.compose.material3.*
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.text.font.FontFamily
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextOverflow
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import com.example.widgetgallery.domain.GalleryWidget
import com.example.widgetgallery.presentation.AppCredit
import com.example.widgetgallery.presentation.anim.FadeSlideIn
import com.example.widgetgallery.presentation.components.AppSearchBar
import com.example.widgetgallery.presentation.i18n.LocalStrings
import com.example.widgetgallery.presentation.viewmodel.GalleryHomeViewModel

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun GalleryHomeScreen(
    vm: GalleryHomeViewModel,
    onOpen: (GalleryWidget) -> Unit,
    onOpenSettings: () -> Unit,
) {
    val s = LocalStrings.current
    val scheme = MaterialTheme.colorScheme
    Scaffold(
        topBar = {
            LargeTopAppBar(
                title = { Text(s.appTitle) },
                actions = {
                    AssistChip(onClick = {},
                        label = { Text(s.widgetCountLabel(vm.totalCount)) })
                    IconButton(onClick = onOpenSettings) {
                        Icon(Icons.Filled.Tune, contentDescription = s.appearance)
                    }
                    Spacer(Modifier.width(8.dp))
                },
            )
        },
    ) { padding ->
        Column(Modifier.padding(padding).fillMaxSize()) {
            Column(Modifier.padding(20.dp, 0.dp, 20.dp, 8.dp)) {
                Text(s.homeIntro, color = scheme.onSurfaceVariant,
                    style = MaterialTheme.typography.bodyMedium)
                Spacer(Modifier.height(16.dp))
                AppSearchBar(vm.query, vm::search, hint = s.searchHint)
            }
            if (!vm.hasResults) {
                Box(Modifier.fillMaxSize(), contentAlignment = androidx.compose.ui.Alignment.Center) {
                    Text(s.noResults)
                }
            } else {
                LazyVerticalGrid(
                    columns = GridCells.Adaptive(260.dp),
                    contentPadding = PaddingValues(20.dp),
                    horizontalArrangement = Arrangement.spacedBy(14.dp),
                    verticalArrangement = Arrangement.spacedBy(14.dp),
                ) {
                    vm.visibleCategories.forEach { category ->
                        item(span = { GridItemSpan(maxLineSpan) }) {
                            Text(
                                s.category(category),
                                style = MaterialTheme.typography.titleLarge,
                                fontWeight = FontWeight.Bold,
                                modifier = Modifier.padding(top = 12.dp, bottom = 4.dp),
                            )
                        }
                        val widgets = vm.widgetsIn(category)
                        itemsIndexed(widgets, key = { _, w -> w.id }) { idx, w ->
                            FadeSlideIn(delayMillis = (idx * 45).coerceAtMost(500)) { m ->
                                WidgetTile(w, scheme, m) { onOpen(w) }
                            }
                        }
                    }
                    item(span = { GridItemSpan(maxLineSpan) }) { AppCredit() }
                }
            }
        }
    }
}

@Composable
private fun WidgetTile(
    item: GalleryWidget,
    scheme: ColorScheme,
    modifier: Modifier = Modifier,
    onClick: () -> Unit,
) {
    Row(
        modifier
            .clip(RoundedCornerShape(14.dp))
            .background(scheme.surfaceContainerLow)
            .border(1.dp, scheme.outlineVariant, RoundedCornerShape(14.dp))
            .clickable(onClick = onClick)
            .height(132.dp),
    ) {
        Box(Modifier.width(3.dp).fillMaxHeight().background(scheme.primary))
        Column(Modifier.padding(14.dp)) {
            Row {
                Text("</>", color = scheme.primary,
                    fontFamily = FontFamily.Monospace,
                    fontWeight = FontWeight.Bold, fontSize = 14.sp)
                Spacer(Modifier.width(8.dp))
                Text(item.title, fontFamily = FontFamily.Monospace,
                    fontWeight = FontWeight.Bold, fontSize = 15.sp,
                    maxLines = 1, overflow = TextOverflow.Ellipsis)
            }
            Spacer(Modifier.height(10.dp))
            Text("// ${item.description}",
                fontFamily = FontFamily.Monospace, fontSize = 11.5.sp,
                color = scheme.onSurfaceVariant, maxLines = 3,
                overflow = TextOverflow.Ellipsis)
        }
    }
}
