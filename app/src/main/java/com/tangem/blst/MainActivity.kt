package com.tangem.blst

import android.os.Bundle
import androidx.appcompat.app.AppCompatActivity
import com.tangem.blst.databinding.ActivityMainBinding
import com.tangem.blstlib.generated.P2

class MainActivity : AppCompatActivity() {

    private lateinit var binding: ActivityMainBinding

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        binding = ActivityMainBinding.inflate(layoutInflater)
        setContentView(binding.root)

        //P2.generator().hash_to(byteArrayOf(Byte.MAX_VALUE))
        // Example of a call to a native method
//        binding.sampleText.text = stringFromJNI()
    }

    /**
     * A native method that is implemented by the 'blst' native library,
     * which is packaged with this application.
     */
//    external fun stringFromJNI(): String

//    companion object {
//        // Used to load the 'blst' library on application startup.
//        init {
//            System.loadLibrary("blst")
//        }
//    }
}
