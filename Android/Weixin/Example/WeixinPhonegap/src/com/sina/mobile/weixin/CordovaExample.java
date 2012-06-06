package com.sina.mobile.weixin;

import org.apache.cordova.DroidGap;

import android.os.Bundle;

import com.tencent.mm.sdk.platformtools.Log;

public class CordovaExample extends DroidGap {

	@Override
	public void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);

		super.loadUrl("file:///android_asset/www/index.html");

		Log.d(TAG, "onCreate");
	}
	
	public void loadJs(String js) {
		this.appView.loadUrl(js);
	}
}
