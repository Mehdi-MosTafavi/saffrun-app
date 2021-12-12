package ir.SOSBolghar.saffrun_app;
import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.engine.FlutterEngine;
import com.najva.najvaflutter.NajvaflutterPlugin;
import io.flutter.plugins.GeneratedPluginRegistrant;

public class MainActivity extends FlutterActivity {
    @Override
    public void configureFlutterEngine(FlutterEngine flutterEngine) {
        flutterEngine.getPlugins().add(new NajvaflutterPlugin());
        GeneratedPluginRegistrant.registerWith(flutterEngine);
    }
}
