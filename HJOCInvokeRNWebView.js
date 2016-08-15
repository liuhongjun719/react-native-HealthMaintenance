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
 TouchableNativeFeedback,
 NativeAppEventEmitter,
 View
} from 'react-native';


var HJOCInvokeRNWebView = React.createClass({
  getInitialState: function() {
    return {
      msg: '',
    };
  },

componentDidMount(){
    console.log('开始订阅通知...');
    subscription = NativeAppEventEmitter.addListener(
         'EventReminder',
          (reminder) => {
            let errorCode=reminder.errorCode;
            if(errorCode===0){
               this.setState({msg:reminder.name});
            }else{
               this.setState({msg:reminder.msg});
            }
          }
         );
  },

  componentWillUnmount(){
     subscription.remove();
  },




  render: function() {
    return(
      <Text>
        dsjflkdsjfkldsjfkldjklfjdklsjf
      </Text>
    );
  },
});

module.exports = HJOCInvokeRNWebView;
