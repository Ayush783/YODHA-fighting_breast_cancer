package com.example.yodha;

import android.content.Intent;
import android.os.Bundle;
import androidx.appcompat.app.AppCompatActivity;
import android.view.View;

public class NavigateTo extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_navigate_to);
    }

    public void nonPatient(View view) {
        Intent intent = new Intent(NavigateTo.this, QuizActivity.class);
        startActivity(intent);
    }

    public void Patient(View view) {
        Intent intent = new Intent(NavigateTo.this, StageActivity1.class);
        startActivity(intent);
    }

    public void Surv(View view) {
        Intent intent = new Intent(NavigateTo.this, Stage2.class);
        startActivity(intent);
    }
}