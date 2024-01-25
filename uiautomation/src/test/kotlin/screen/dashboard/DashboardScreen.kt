package screen.dashboard

import screen.home.HomeScreen

class DashboardScreen : HomeScreen() {

    private val screen = find.byValueKey("dashboardScreen")

    private val pidIdCard = find.byValueKey("com.example.pid")
    private val pidAddressCard = find.byValueKey("com.example.address")

    private val pidIdTitleText = find.byText(l10n.getString("pidIdCardTitle"))
    private val showDetailsText = find.byText(l10n.getString("showDetailsCta"))

    fun visible() = isElementVisible(screen, false)

    fun cardsVisible() = isElementVisible(pidIdCard, false) && isElementVisible(pidAddressCard, false)

    fun cardFaceTextsInActiveLanguage() =
        isElementVisible(pidIdTitleText, false) && isElementVisible(showDetailsText, false)

    fun checkCardSorting(): Boolean {
        val (_, pidY) = getTopLeft(pidIdCard, false)!!
        val (_, addressY) = getTopLeft(pidAddressCard, false)!!
        return pidY < addressY
    }

    fun clickPidCard() = clickElement(pidIdCard, false)
}
