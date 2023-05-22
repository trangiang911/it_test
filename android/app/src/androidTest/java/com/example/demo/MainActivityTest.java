// Change this line to YOUR package name:
package com.example.demo;

import androidx.test.rule.ActivityTestRule;

import dev.flutter.plugins.integration_test.FlutterTestRunner;

import org.junit.Rule;
import org.junit.runner.RunWith;
// Import MainActivity from YOUR package
import com.example.demo.MainActivity;

import pl.leancode.patrol.PatrolTestRule;
import pl.leancode.patrol.PatrolTestRunner;

@RunWith(PatrolTestRunner.class)
public class MainActivityTest {
    //    @Rule
//    public ActivityTestRule<MainActivity> rule = new ActivityTestRule<>(MainActivity.class, true, false);
    @Rule
    public PatrolTestRule<MainActivity> rule = new PatrolTestRule<>(MainActivity.class);
}