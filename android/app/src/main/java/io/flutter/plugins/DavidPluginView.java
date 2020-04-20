package io.flutter.plugins;

import android.content.Context;
import android.view.View;
import android.widget.TextView;

import java.util.Map;

import io.flutter.plugin.common.BinaryMessenger;
import io.flutter.plugin.platform.PlatformView;

public class DavidPluginView implements PlatformView {

    private final TextView mTextView;

    public DavidPluginView(
            Context context,
            BinaryMessenger messenger,
            int id,
            Map<String, Object> params) {

        mTextView = new TextView(context);
        mTextView.setText("Android的原生TextView");

        // 從 flutter 传递过来的参数
        if (params != null && params.containsKey("key_text_string")) {
            String textString = (String) params.get("key_text_string");
            mTextView.setText(textString);
        }
    }

    @Override
    public View getView() {
        return mTextView;
    }

    @Override
    public void dispose() {

    }
}
