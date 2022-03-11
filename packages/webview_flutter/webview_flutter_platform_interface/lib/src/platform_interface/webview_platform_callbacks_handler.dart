// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:async';

import '../types/types.dart';

/// Interface for callbacks made by [WebViewPlatformController].
///
/// The webview plugin implements this class, and passes an instance to the [WebViewPlatformController].
/// [WebViewPlatformController] is notifying this handler on events that happened on the platform's webview.
abstract class WebViewPlatformCallbacksHandler {
  /// Invoked by [WebViewPlatformController] when a navigation request is pending.
  ///
  /// If true is returned the navigation is allowed, otherwise it is blocked.
  FutureOr<bool> onNavigationRequest(
      {required String url, required bool isForMainFrame});

  /// Invoked by [WebViewPlatformController] when a page has started loading.
  void onPageStarted(String url);

  /// Invoked by [WebViewPlatformController] when a page has finished loading.
  void onPageFinished(String url);

  /// Invoked by [WebViewPlatformController] when page fire an Alert dialog from JavaScript.
  ///
  /// Return a future.
  /// Fulfill the returned future when dialog closed.
  Future<void> onJsAlert(String url, String message);

  /// Invoked by [WebViewPlatformController] when page fire an Confirm dialog from JavaScript.
  ///
  /// Return a future for dialog respond.
  /// Fulfill true if user click 'OK' button, false if user click 'Cancel' button.
  Future<bool> onJsConfirm(String url, String message);

  /// Invoked by [WebViewPlatformController] when page fire an Prompt dialog from JavaScript.
  ///
  /// Return a future for user input input text.
  /// Returns an empty strings when dialog cancelled.
  Future<String> onJsPrompt(String url, String message, String defaultText);

  /// Invoked by [WebViewPlatformController] when a page is loading.
  /// /// Only works when [WebSettings.hasProgressTracking] is set to `true`.
  void onProgress(int progress);

  /// Report web resource loading error to the host application.
  void onWebResourceError(WebResourceError error);
}
