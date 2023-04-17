package nl.rijksoverheid.edi.wallet.platform_support.utilities

import androidx.test.ext.junit.runners.AndroidJUnit4
import org.junit.Assert.assertNotNull
import org.junit.Assert.assertTrue
import org.junit.Before
import org.junit.Test
import org.junit.runner.RunWith

@RunWith(AndroidJUnit4::class)
class NativeUtilitiesBridgeInstrumentedTest {

    @Before
    fun setUp() {
        System.loadLibrary("platform_support")
    }

    @Test
    fun bridge_is_initialized() {
        assertNotNull(NativeUtilitiesBridge.bridge)
    }

    @Test
    fun bridge_test_storage_path() {
        assertTrue(utilities_test_storage_path())
    }

    companion object {
        @JvmStatic
        external fun utilities_test_storage_path(): Boolean
    }
}
