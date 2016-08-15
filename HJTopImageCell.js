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

var HJTopImageCell = React.createClass({
  render: function() {
    var TouchableElement = TouchableHighlight;

    return(
      <View>
       <TouchableElement
        onPress = {this.props.onSelect}
        onShowUnderlay = {this.props.onHighlight}
        onHideUnderlay = {this.props.onUnhighlight}>

        <View style = {styles.cell_first_row_image_back}>
            <Image
              source = {getImageSource(this.props.shopData, 'thumbnail')}
              style = {styles.cell_first_row_image}>

              <View style = {styles.cell_first_row_title_back}>
                <Text style = {styles.cell_first_row_title}>
                  {this.props.shopData.title}
                </Text>
              </View>
            </Image>
        </View>

       </TouchableElement>
      </View>
    );
  },
});

module.exports = HJTopImageCell;
