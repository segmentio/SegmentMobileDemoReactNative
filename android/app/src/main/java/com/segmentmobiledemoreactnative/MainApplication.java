package com.segmentmobiledemoreactnative;

import android.app.Application;

import com.facebook.react.ReactApplication;
import com.PTR.IDFA.IDFAPackage;
import com.learnium.RNDeviceInfo.RNDeviceInfo;
import com.segment.analytics.reactnative.integration.appboy.RNAnalyticsIntegration_AppboyPackage;
import com.segment.analytics.reactnative.core.RNAnalyticsPackage;
//import com.AlexanderZaytsev.RNI18n.RNI18nPackage;
import com.lugg.ReactNativeConfig.ReactNativeConfigPackage;
import com.oblador.vectoricons.VectorIconsPackage;
import com.facebook.react.ReactNativeHost;
import com.facebook.react.ReactPackage;
import com.facebook.react.shell.MainReactPackage;
import com.facebook.soloader.SoLoader;

import java.util.Arrays;
import java.util.List;

public class MainApplication extends Application implements ReactApplication {

  private final ReactNativeHost mReactNativeHost = new ReactNativeHost(this) {
    @Override
    public boolean getUseDeveloperSupport() {
      return BuildConfig.DEBUG;
    }

    @Override
    protected List<ReactPackage> getPackages() {
      return Arrays.<ReactPackage>asList(
          new MainReactPackage(),
            new IDFAPackage(),
            new RNDeviceInfo(),
            new RNAnalyticsIntegration_AppboyPackage(),
            new RNAnalyticsPackage(),
            //new RNI18nPackage(),
            new ReactNativeConfigPackage(),
            //new ReactNativeI18n(),
            new VectorIconsPackage()
      );
    }

    @Override
    protected String getJSMainModuleName() {
      return "index";
    }
  };

  @Override
  public ReactNativeHost getReactNativeHost() {
    return mReactNativeHost;
  }

  @Override
  public void onCreate() {
    super.onCreate();
    SoLoader.init(this, /* native exopackage */ false);
  }
}
