package util

import com.codeborne.selenide.WebDriverRunner.getWebDriver
import helper.LocalizationHelper
import io.appium.java_client.android.AndroidDriver
import io.github.ashwith.flutter.FlutterElement
import io.github.ashwith.flutter.FlutterFinder
import org.openqa.selenium.By
import org.openqa.selenium.WebElement
import org.openqa.selenium.remote.RemoteWebDriver
import org.openqa.selenium.support.ui.ExpectedConditions
import org.openqa.selenium.support.ui.WebDriverWait
import java.time.Duration

open class MobileActions {

    protected val find = FlutterFinder(getWebDriver() as RemoteWebDriver)
    protected val l10n = LocalizationHelper()

    private val driver = getWebDriver() as RemoteWebDriver

    /**
     * Checks if the given element is visible.
     * This method will wait for the element to be visible for a maximum of 5 seconds.
     *
     * By default, Flutter Driver waits until there is no pending frame scheduled in the app under test,
     * before executing an action or a test assertion.
     *
     * Do not use this method for checking if an element is absent, use the `isElementAbsent` method instead.
     *
     * @param element The element to check for visibility.
     * @param frameSync Whether to wait executing an action until no pending frames are scheduled. Defaults to `true`, set to `false` when testing a screen with a long or infinite animation.
     */
    protected fun isElementVisible(element: FlutterElement, frameSync: Boolean = true): Boolean {
        performAction(frameSync) {
            driver.executeScript("flutter:waitFor", element, WAIT_FOR_ELEMENT_MAX_WAIT_MILLIS)
        }

        // Ideally we would use `element.isDisplayed` as return value,
        // but this isn't possible due to missing `FlutterElement` implementations.
        //
        // The `driver.executeScript()` method will throw (fail test) when the element is not found,
        // therefore returning hardcode value for the sake of test assertions.
        return true
    }

    protected fun isElementAbsent(element: FlutterElement, frameSync: Boolean = true): Boolean {
        performAction(frameSync) {
            driver.executeScript("flutter:waitForAbsent", element, WAIT_FOR_ELEMENT_MAX_WAIT_MILLIS)
        }

        // Ideally we would use `!element.isDisplayed` as return value,
        // but this isn't possible due to missing `FlutterElement` implementations.
        //
        // The `driver.executeScript()` method will throw (fail test) when the element is not absent,
        // therefore returning hardcode value for the sake of test assertions.
        return true
    }

    protected fun isWebElementVisible(element: WebElement): Boolean {
        val wait = WebDriverWait(driver, Duration.ofMillis(WAIT_FOR_ELEMENT_MAX_WAIT_MILLIS))
        wait.until(ExpectedConditions.visibilityOf(element))
        return true
    }

    protected fun findElement(locator: By): WebElement = driver.findElement(locator)

    protected fun clickElement(element: FlutterElement, frameSync: Boolean = true) {
        // First wait and check if the element is visible, then perform the click action;
        // this prevents clicking on an element that is not visible, which results in a (BrowserStack) timeout.
        if (isElementVisible(element, frameSync)) {
            performAction(frameSync) { element.click() }
        }
    }

    /**
     * Resolves the top left coordinates of the given element in logical pixels (not taking into account the screen density).
     *
     * @param element The element to get the top left coordinates from.
     * @param frameSync Whether to wait executing an action until no pending frames are scheduled. Defaults to `true`, set to `false` when testing a screen with a long or infinite animation.
     * @return The top left coordinates of the given element in logical pixels, or `null` if the element is not found.
     */
    protected fun getTopLeft(element: WebElement, frameSync: Boolean = true): Pair<Double, Double>? {
        return performAction(frameSync) {

            when (val result = driver.executeScript("flutter:getTopLeft", element)) {
                is Map<*, *> -> {
                    val dx = (result["dx"] as? Number)?.toDouble() ?: return@performAction null
                    val dy = (result["dy"] as? Number)?.toDouble() ?: return@performAction null
                    Pair(dx, dy)
                }

                else -> null
            }
        }
    }

    protected fun switchToWebViewContext() {
        val platform = platformName()
        if (platform == "ANDROID") {
            val androidDriver = driver as AndroidDriver
            val context = androidDriver.context ?: ""
            if (context.contains(WEB_VIEW_CONTEXT_PREFIX).not()) {

                // Wait for the web view context to be available
                val wait = WebDriverWait(androidDriver, Duration.ofMillis(WAIT_FOR_CONTEXT_MAX_WAIT_MILLIS))
                wait.until { androidDriver.contextHandles.firstOrNull { it.contains(WEB_VIEW_CONTEXT_PREFIX) } != null }

                // Switch to the web view context
                val webViewContext = androidDriver.contextHandles.first { it.contains(WEB_VIEW_CONTEXT_PREFIX) }
                androidDriver.context(webViewContext)

                // Switch to the latest created browser tab (in case multiple tabs are open)
                val windowHandles = androidDriver.windowHandles
                androidDriver.switchTo().window(windowHandles.first())
            }
        } else {
            throw Exception("Platform $platform is not supported")
        }
    }

    protected fun switchToAppContext() {
        val platform = platformName()
        if (platform == "ANDROID") {
            val androidDriver = driver as AndroidDriver
            if (androidDriver.context != FLUTTER_APP_CONTEXT) {
                androidDriver.context(FLUTTER_APP_CONTEXT)
            }
        } else {
            throw Exception("Platform $platform is not supported")
        }
    }

    private fun <T> performAction(frameSync: Boolean = true, action: () -> T): T {
        if (!frameSync) driver.executeScript("flutter:setFrameSync", false, SET_FRAME_SYNC_MAX_WAIT_MILLIS)
        return try {
            action()
        } finally {
            if (!frameSync) driver.executeScript("flutter:setFrameSync", true, SET_FRAME_SYNC_MAX_WAIT_MILLIS)
        }
    }

    private fun platformName() = driver.capabilities.platformName.name

    companion object {
        private const val SET_FRAME_SYNC_MAX_WAIT_MILLIS = 5000L
        private const val WAIT_FOR_ELEMENT_MAX_WAIT_MILLIS = 10000L
        private const val WAIT_FOR_CONTEXT_MAX_WAIT_MILLIS = 10000L

        private const val FLUTTER_APP_CONTEXT = "FLUTTER"
        private const val WEB_VIEW_CONTEXT_PREFIX = "WEBVIEW_"
    }
}
