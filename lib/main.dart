package com.example.purplelines;

import android.content.Context;
import android.content.pm.ActivityInfo;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.os.Bundle;
import android.view.View;
import android.view.Window;
import android.view.WindowManager;
import androidx.appcompat.app.AppCompatActivity;

public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        // 1. تحويل الشاشة إلى الوضع الأفقي
        setRequestedOrientation(ActivityInfo.SCREEN_ORIENTATION_LANDSCAPE);

        // 2. إخفاء الشريط العلوي وجعل التطبيق ملء الشاشة
        requestWindowFeature(Window.FEATURE_NO_TITLE);
        getWindow().setFlags(
            WindowManager.LayoutParams.FLAG_FULLSCREEN,
            WindowManager.LayoutParams.FLAG_FULLSCREEN
        );

        // 3. عرض الواجهة البرمجية مباشرة
        setContentView(new DarkPurpleView(this));
    }

    // كلاس داخلي لرسم الواجهة السوداء والخطوط البنفسجية
    private static class DarkPurpleView extends View {
        private final Paint linePaint;

        public DarkPurpleView(Context context) {
            super(context);

            // إعداد خصائص الخط البنفسجي
            linePaint = new Paint();
            linePaint.setColor(Color.parseColor("#9D00FF")); // لون بنفسجي زاهي
            linePaint.setStrokeWidth(6f);                    // سمك الخط
            linePaint.setAntiAlias(true);                    // تنعيم حواف الرسم
        }

        @Override
        protected void onDraw(Canvas canvas) {
            super.onDraw(canvas);

            // تلوين الخلفية بالأسود
            canvas.drawColor(Color.BLACK);

            int width = getWidth();
            int height = getHeight();
            int spacing = 90; // المسافة بين كل خط والآخر (بالبكسل)

            // رسم الخطوط العمودية
            for (int x = 0; x < width; x += spacing) {
                canvas.drawLine(x, 0, x, height, linePaint);
            }

            // رسم الخطوط الأفقية
            for (int y = 0; y < height; y += spacing) {
                canvas.drawLine(0, y, width, y, linePaint);
            }
        }
    }
}