package io.flutter.plugins;

import android.app.Activity;
import android.widget.Toast;

import java.lang.ref.WeakReference;

import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.PluginRegistry;

public class DavidPlugin implements MethodChannel.MethodCallHandler {

    public static final String CHANNEL_NAME = "david_plugin_channel";

    WeakReference<Activity> activityWeakReference;

    public DavidPlugin(Activity mainActivity) {
        activityWeakReference = new WeakReference<>(mainActivity);
    }

    @Override
    public void onMethodCall(MethodCall methodCall, MethodChannel.Result result) {
        if (methodCall.method.equals("showCustomTaost")) {
            Activity activity = activityWeakReference.get();
            if (activity != null) {
                Toast.makeText(activity, "成功顯示Toast", Toast.LENGTH_SHORT).show();
                result.success("這是一個返回的字串");
            }
        } else {
            result.notImplemented();
        }
    }

    public static void registerWith(PluginRegistry.Registrar registrar) {
        MethodChannel channel = new MethodChannel(registrar.messenger(), CHANNEL_NAME);
        DavidPlugin instance = new DavidPlugin(registrar.activity());
        channel.setMethodCallHandler(instance);

        // platform
        registrar.platformViewRegistry().registerViewFactory("david_plugin_view", new DavidPluginViewFactory(registrar.messenger()));
    }
}
