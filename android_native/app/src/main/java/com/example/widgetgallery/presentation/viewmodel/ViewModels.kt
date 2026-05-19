package com.example.widgetgallery.presentation.viewmodel

import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.setValue
import com.example.widgetgallery.domain.GalleryWidget
import com.example.widgetgallery.domain.GetCategories
import com.example.widgetgallery.domain.GetGalleryWidgets
import com.example.widgetgallery.domain.SearchGalleryWidgets

/** Owns search state and exposes filtered, grouped widgets. */
class GalleryHomeViewModel(
    private val getGalleryWidgets: GetGalleryWidgets,
    private val searchGalleryWidgets: SearchGalleryWidgets,
    private val getCategories: GetCategories,
) {
    var query by mutableStateOf("")
        private set

    val totalCount: Int get() = getGalleryWidgets().size

    private val filtered: List<GalleryWidget> get() = searchGalleryWidgets(query)

    val hasResults: Boolean get() = filtered.isNotEmpty()

    val visibleCategories: List<String>
        get() {
            val present = filtered.map { it.category }.toSet()
            return getCategories().filter { it in present }
        }

    fun widgetsIn(category: String): List<GalleryWidget> =
        filtered.filter { it.category == category }

    fun search(value: String) {
        query = value
    }
}
