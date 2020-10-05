package com.example.yodha;

import android.content.Context;
import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.ImageView;
import android.widget.TextView;

import java.util.List;

public class StoriesAdapter extends ArrayAdapter<Stories> {

    public StoriesAdapter(@NonNull Context context,  @NonNull List<Stories> objects) {
        super(context, 0, objects);
    }

    @NonNull
    @Override
    public View getView(int position, @Nullable View convertView, @NonNull ViewGroup parent) {
        View listItemView = convertView;
        if (listItemView == null) {
            listItemView = LayoutInflater.from(getContext()).inflate(
                    R.layout.stories, parent, false);
        }
        Stories currentAndroidFlavor = getItem(position);
        TextView mTextView = (TextView) listItemView.findViewById(R.id.text1);
        // Get the version name from the current AndroidFlavor object and
        // set this text on the name TextView
        mTextView.setText(currentAndroidFlavor.getmText());
        TextView mTextView2 = (TextView) listItemView.findViewById(R.id.text2);
        // Get the version name from the current AndroidFlavor object and
        // set this text on the name TextView
        mTextView2.setText(currentAndroidFlavor.getmText2());
        ImageView iconView =(ImageView) listItemView.findViewById(R.id.image);
        // Get the image resource ID from the current AndroidFlavor object and
        // set the image to iconView
        //if(currentAndroidFlavor.hasImage()) {
        iconView.setImageResource(currentAndroidFlavor.getmImageresourceid());
        return listItemView;

    }
}
