package com.example.widgetgallery.domain

/** Abstraction over the source of gallery widgets. */
interface GalleryRepository {
    fun getWidgets(): List<GalleryWidget>
}

/** Returns every widget in the gallery. */
class GetGalleryWidgets(private val repository: GalleryRepository) {
    operator fun invoke(): List<GalleryWidget> = repository.getWidgets()
}

/** Returns the widgets matching [query] (empty query returns all). */
class SearchGalleryWidgets(private val repository: GalleryRepository) {
    operator fun invoke(query: String): List<GalleryWidget> =
        repository.getWidgets().filter { it.matches(query) }
}

/** Returns category names in first-seen order, deduplicated. */
class GetCategories(private val repository: GalleryRepository) {
    operator fun invoke(): List<String> {
        val seen = LinkedHashSet<String>()
        repository.getWidgets().forEach { seen.add(it.category) }
        return seen.toList()
    }
}
