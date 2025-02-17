package feature.digid

import helper.TestBase
import navigator.OnboardingNavigator
import navigator.screen.OnboardingScreen
import org.junit.jupiter.api.Assertions.assertTrue
import org.junit.jupiter.api.BeforeEach
import org.junitpioneer.jupiter.RetryingTest
import screen.digid.DigidLoginMockWebPage
import screen.digid.DigidLoginStartWebPage

class MockDigidWebTests : TestBase() {

    private lateinit var digidLoginStartWebPage: DigidLoginStartWebPage

    @BeforeEach
    fun setUp() {
        OnboardingNavigator().toScreen(OnboardingScreen.DigidLoginStartWebPage)

        digidLoginStartWebPage = DigidLoginStartWebPage()
    }

    @RetryingTest(value = MAX_RETRY_COUNT, name = "{displayName} - {index}")
    fun verifyMockDigidLogin() {
        assertTrue(digidLoginStartWebPage.visible(), "digid login start web page is not visible")

        digidLoginStartWebPage.clickMockLoginButton()

        val digidLoginMockWebPage = DigidLoginMockWebPage()
        assertTrue(digidLoginMockWebPage.visible(), "digid login mock web page is not visible")

        digidLoginMockWebPage.enterBsn("999991771")
        digidLoginMockWebPage.clickLoginButton()
    }
}
