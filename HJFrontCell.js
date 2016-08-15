/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 * @flow
 */

import React, {Component} from 'react';
import {
 Image,
 PixelRatio,
 Platform,
 StyleSheet,
 Text,
 TouchableHighlight,
 TouchableNativeFeedback,
 View
} from 'react-native';

//变量
var getImageSource = require('./getImageSource');
var styles = require('./HJStyles');

var HJFrontCell = React.createClass({
  render: function() {
    var TouchableElement = TouchableHighlight;

    return(
      <View>
       <TouchableElement
        onPress = {this.props.onSelect}
        onShowUnderlay = {this.props.onHighlight}
        onHideUnderlay = {this.props.onUnhighlight}>

        <View style = {styles.cell_back}>
          <View style = {styles.cell_top_view}>
            <Image
              source = {getImageSource(this.props.shopData, 'thumbnail')}
              style = {styles.cell_top_image}
            />
            <View style = {styles.cell_top_right}>
              <Text style = {styles.cell_top_title}>
                {this.props.shopData.title}
              </Text>
            </View>

          </View>

          <View style = {styles.cell_down_view}>
            <Text
            style = {styles.cell_down_excerpt}
            numberOfLines = {2}>
              {this.props.shopData.excerpt}
            </Text>
            <Text style = {styles.cell_down_date}>
              {this.props.shopData.date}
            </Text>
          </View>
        </View>

       </TouchableElement>
      </View>
    );
  },
});

module.exports = HJFrontCell;
