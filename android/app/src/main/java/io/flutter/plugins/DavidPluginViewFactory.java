package io.flutter.plugins;

import android.content.Context;

import java.util.Map;

import io.flutter.plugin.common.BinaryMessenger;
import io.flutter.plugin.common.StandardMessageCodec;
import io.flutter.plugin.platform.PlatformView;
import io.flutter.plugin.platform.PlatformViewFactory;

public class DavidPluginViewFactory extends PlatformViewFactory {
    private final BinaryMessenger messenger;

    public DavidPluginViewFactory(BinaryMessenger messenger) {
        super(StandardMessageCodec.INSTANCE);
        this.messenger = messenger;
    }

    @SuppressWarnings("unchecked")
    @Override
    public PlatformView create(Context context, int id, Object args) {
        // 從 flutter 传递过来的参数
        Map<String, Object> params = (Map<String, Object>) args;

        //创建 TestTextView
        return new DavidPluginView(context, messenger, id, params);

    }
}