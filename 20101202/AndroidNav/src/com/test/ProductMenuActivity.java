package com.test;
 
import android.app.Activity;
import android.os.Bundle;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.Button;
 
public class ProductMenuActivity extends Activity {
    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
         
        setContentView(R.layout.product);
         
        Button returnToMainButton = (Button)findViewById(R.id.productReturnToMainButton);
        if(returnToMainButton!=null) {
            returnToMainButton.setOnClickListener(new OnClickListener() {
                @Override
                public void onClick(View v) {
                    finish();
                }
            });       
        }
    }
}