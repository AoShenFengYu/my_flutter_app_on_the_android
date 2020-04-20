package com.nlptech.my_flutter_app_on_the_android

import android.os.Bundle
import android.view.View
import android.view.ViewGroup

import io.flutter.app.FlutterActivity
import io.flutter.plugins.DavidPlugin
import io.flutter.plugins.GeneratedPluginRegistrant

class MainActivity : FlutterActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        GeneratedPluginRegistrant.registerWith(this)

        DavidPlugin.registerWith(registrarFor(DavidPlugin.CHANNEL_NAME))
    }
}
