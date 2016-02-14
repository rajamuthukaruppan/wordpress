package com.test;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.ListView;
import android.widget.Toast;
import android.widget.AdapterView.OnItemClickListener;
 
public class MainMenuActivity extends Activity {
    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.main);
 
        setTitle("Custom Navigation Main Menu");
         
        //get the reference to the list view defined in main.xml layout.
        final ListView listView = (ListView)findViewById(R.id.ListView01);
         
        listView.setAdapter(new ArrayAdapter<String>(this, R.layout.row,
                R.id.toptext, new String[] {
                        getResources().getString(R.string.product),
                        getResources().getString(R.string.locations) }));
         
        listView.setOnItemClickListener(new OnItemClickListener() {
            public void onItemClick(AdapterView<?> parent, View view,
                    int position, long id) {
                switch(position) {
                case 0:
//                    Toast.makeText(getApplicationContext(),
//                            "Product List Item was clicked.",
//                            Toast.LENGTH_SHORT).show();
                    startActivity(new Intent(getApplicationContext(),
                            ProductMenuActivity.class));
                    break;
                case 1:
//                    Toast.makeText(getApplicationContext(),
//                            "Locations List Item was clicked.",
//                            Toast.LENGTH_SHORT).show();                            
                    startActivity(new Intent(getApplicationContext(),
                            LocationMenuActivity.class));
                    break;
                }
            }
        });
    }
}
