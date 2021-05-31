# Reproduction Appium Issue 15325



This repository constains a basic iOS application to reproduce [Appium Issue 15325](https://github.com/appium/appium/issues/15325).

It has two web views, one UIWebView and one WKWebView.

The following Appium test can be used to reproduce the issue.

    @Test
    public void local() throws Exception {
        URL remoteAddress = new URL("http://0.0.0.0:4723/wd/hub");

        DesiredCapabilities caps = DesiredCapabilities.iphone();
        caps.setCapability("deviceName","iPhone 8");
        caps.setCapability("deviceOrientation", "portrait");
        caps.setCapability("platformVersion","14.5");
        caps.setCapability("automationName", "XCUITest");
        caps.setCapability("platformName", "iOS");
        caps.setCapability("browserName", "");
        caps.setCapability("app", "/Users/kylepointer/Desktop/WebViewMenagerie.ipa");

        AppiumDriver<IOSElement> driver = null;

        try {
            driver = new AppiumDriver<>(remoteAddress, caps);
            driver.findElementByName("UIWebView").click();
            
            String webViewString = null;
            
            while(webViewString == null) {
            var handles = driver.getContextHandles();
            
                for (var handle: handles) {
                    if (handle.startsWith("WEBVIEW")) {
                    webViewString = handle;
                    break;
                }
            }
        }
            
        driver.context(webViewString);
        driver.findElementById("search_form_input_homepage").sendKeys("potato");
        driver.findElementById("search_button_homepage");
        
        } finally {
            if (driver != null) {
                driver.quit();
            }
        }
    }
