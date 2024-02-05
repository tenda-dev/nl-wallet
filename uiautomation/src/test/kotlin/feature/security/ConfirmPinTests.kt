package feature.security

import helper.TestBase
import navigator.OnboardingNavigator
import navigator.OnboardingScreen
import org.junit.jupiter.api.Assertions.assertTrue
import org.junit.jupiter.api.BeforeEach
import org.junit.jupiter.api.DisplayName
import org.junitpioneer.jupiter.RetryingTest
import screen.security.PinScreen
import screen.security.SetupSecurityCompletedScreen

@DisplayName("UC 2.1 - User confirms PIN [PVW-1216]")
class ConfirmPinTests : TestBase() {

    private val onboardingNavigator = OnboardingNavigator()
    private val chosenPin = "122222"
    private val incorrectConfirmPin = "123333"

    private lateinit var pinScreen: PinScreen

    @BeforeEach
    fun setUp() {
        onboardingNavigator.toScreen(OnboardingScreen.Pin)

        pinScreen = PinScreen()
        pinScreen.enterPin(chosenPin)
    }

    @RetryingTest(MAX_RETRY_COUNT)
    @DisplayName("1. The App asks the user to re-enter their PIN.")
    fun verifyConfirmPinScreenVisible() {
        assertTrue(pinScreen.confirmPinScreenVisible(), "confirm pin screen is not visible")
        assertTrue(pinScreen.pinKeyboardVisible(), "pin keyboard is not visible")
    }

    @RetryingTest(MAX_RETRY_COUNT)
    @DisplayName("2. Upon PIN entry, the App asserts that the first and second entry are equal.")
    fun verifyConfirmPin() {
        pinScreen.enterPin(chosenPin)

        val setupSecurityCompletedScreen = SetupSecurityCompletedScreen()
        assertTrue(setupSecurityCompletedScreen.visible(), "setup security completed screen is not visible")
    }

    @RetryingTest(MAX_RETRY_COUNT)
    @DisplayName("3. Upon incorrect entry, the App displays an error message and asks the user to try again.")
    fun verifyIncorrectConfirmPin() {
        pinScreen.enterPin(incorrectConfirmPin)
        assertTrue(pinScreen.confirmPinErrorMismatchVisible(), " confirm pin error mismatch is not visible")
    }

    @RetryingTest(MAX_RETRY_COUNT)
    @DisplayName("4. The user may attempt entering their PIN in 2 attempts.")
    fun verifyIncorrectConfirmPinTwice() {
        pinScreen.enterPin(incorrectConfirmPin)
        pinScreen.enterPin(incorrectConfirmPin)
        assertTrue(pinScreen.confirmPinErrorMismatchFatalVisible(), "confirm pin error fatal mismatch is not visible")
    }

    @RetryingTest(MAX_RETRY_COUNT)
    @DisplayName("5. After 2 attempts, the App offers the user to pick a new PIN.")
    fun verifyRestartChoosePin() {
        pinScreen.enterPin(incorrectConfirmPin)
        pinScreen.enterPin(incorrectConfirmPin)
        pinScreen.clickConfirmPinErrorFatalCta()
        assertTrue(pinScreen.choosePinScreenVisible(), "choose pin screen is not visible")
    }
}
