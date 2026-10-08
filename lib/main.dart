package com.example.purplelines;

import android.app.Activity;
import android.content.Context;
import android.content.pm.ActivityInfo;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.os.Bundle;
import android.view.View;
import android.view.Window;
import android.view.WindowManager;

public class MainActivity extends Activity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        // تحويل الشاشة إلى الوضع الأفقي وجعلها ملء الشاشة
        setRequestedOrientation(ActivityInfo.SCREEN_ORIENTATION_LANDSCAPE);
        requestWindowFeature(Window.FEATURE_NO_TITLE);
        getWindow().setFlags(
            WindowManager.LayoutParams.FLAG_FULLSCREEN,
            WindowManager.LayoutParams.FLAG_FULLSCREEN
        );

        setContentView(new DarkPurpleView(this));
    }

    private static class DarkPurpleView extends View {
        private final Paint linePaint;

        public DarkPurpleView(Context context) {
            super(context);
            linePaint = new Paint();
            linePaint.setColor(Color.parseColor("#9D00FF"));
            linePaint.setStrokeWidth(6f);
            linePaint.setAntiAlias(true);
        }

        @Override
        protected void onDraw(Canvas canvas) {
            super.onDraw(canvas);
            canvas.drawColor(Color.BLACK);

            int width = getWidth();
            int height = getHeight();
            int spacing = 90;

            for (int x = 0; x < width; x += spacing) {
                canvas.drawLine(x, 0, x, height, linePaint);
            }
            for (int y = 0; y < height; y += spacing) {
                canvas.drawLine(0, y, width, y, linePaint);
            }
        }
    }
}
