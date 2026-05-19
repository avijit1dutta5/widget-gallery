package com.example.widgetgallery.di

import com.example.widgetgallery.data.GalleryLocalDataSource
import com.example.widgetgallery.data.GalleryRepositoryImpl
import com.example.widgetgallery.domain.GalleryRepository
import com.example.widgetgallery.domain.GetCategories
import com.example.widgetgallery.domain.GetGalleryWidgets
import com.example.widgetgallery.domain.SearchGalleryWidgets
import com.example.widgetgallery.presentation.viewmodel.GalleryHomeViewModel

/** Minimal manual DI container wiring data, domain and presentation. */
object ServiceLocator {
    private val repository: GalleryRepository =
        GalleryRepositoryImpl(GalleryLocalDataSource())

    private val getGalleryWidgets = GetGalleryWidgets(repository)
    private val searchGalleryWidgets = SearchGalleryWidgets(repository)
    private val getCategories = GetCategories(repository)

    fun createGalleryHomeViewModel(): GalleryHomeViewModel =
        GalleryHomeViewModel(getGalleryWidgets, searchGalleryWidgets, getCategories)
}
