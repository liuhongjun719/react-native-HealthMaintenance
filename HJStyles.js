/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 * @flow
 */

import React, { Component } from 'react';
import {
  AppRegistry,
  StyleSheet,
  View,
  Dimensions,

} from 'react-native';

var item_width = Dimensions.get('window').width;


const styles = StyleSheet.create({
  // TODO: 首页使用
  home_header: {
    height:64,
    backgroundColor: '#293447',
  },

  home_container: {
    flex: 1,
    backgroundColor: 'rgba(216.0, 42.0, 42.0, 1.0)',
  },

  home_bgcolor: {
    backgroundColor: 'red',
  },

  home_cell_row: {
    alignItems: 'center',
    backgroundColor: 'white',
    // flexDirection: 'row',
    padding: 5,
  },

  home_cell_image: {
    backgroundColor: '#dddddd',
    height: 100,
    width: 120,
    marginRight: 10,
  },

  home_cell_textContainer: {
  flex: 1,
  },

  home_cell_title: {
    flex: 1,
    fontSize: 16,
    fontWeight: '500',
    marginTop: 2,
    height: 30,
  },

  home_cell_source: {
    color: '#999999',
    fontSize: 12,
    marginBottom: 5,
  },

  home_cell_ptime_color: {
    color: '#3EB433',
  },

  home_cell_row_separator: {
    backgroundColor: 'rgba(0, 0, 0, 0.1)',
    height: 1,
    marginLeft: 4,
  },

  home_cell_row_Separator_hide: {
    opacity: 0.0,
  },


  home_noComment_container: {
    flex: 1,
    marginTop: 64,
    backgroundColor: '#F5FCFF',
  },
  home_noComment_centerText: {
    alignItems: 'center',
  },

  home_noComment_text: {
    marginTop: 80,
    color: '#888888',
  },

  home_cell_separator: {
    height:1,
    backgroundColor:'#eeeeee',
  },



  // TODO: 发现
  container: {
  flex: 1,
  justifyContent: 'center',
  alignItems: 'stretch',
  backgroundColor: '#F5FCFF',
},
list: {
  alignItems: 'center',
  justifyContent: 'space-between',
  flexDirection: 'row',
  flexWrap: 'wrap',
  marginLeft: 10,
},
infoContainer: {
  flex: 1,
  flexDirection: 'column',
  alignItems: 'center',
  justifyContent: 'center',
  backgroundColor: '#F5FCFF',
},
infoImage: {
  borderRadius: 10,
  // backgroundColor: '#333333',
  height: 120,
  margin: 10,
  width: 120,
  resizeMode: 'contain',
},
infoRewardImage: {
  borderRadius: 10,
  // backgroundColor: '#333333',
  height: 60,
  margin: 0,
  width: 60,
  resizeMode: 'contain',
},
infoDetail: {
  fontSize: 15,
  textAlign: 'justify',
  margin: 5,
  color: '#D19A66',
},
infoLife:{
  fontSize: 15,
  textAlign: 'justify',
  margin: 5,
  color: '#A02D22',
},
infoHunger:{
  fontSize: 15,
  textAlign: 'justify',
  margin: 5,
  color: '#D9B339',
},
infoSpirit:{
  fontSize: 15,
  textAlign: 'justify',
  margin: 5,
  color: '#CB7921',
},
infoShelf:{
  fontSize: 15,
  textAlign: 'justify',
  margin: 5,
  color: 'green',
},
infoHarm:{
  fontSize: 15,
  textAlign: 'justify',
  margin: 5,
  color: 'orange',
},
infoDesc: {
  fontSize: 20,
  textAlign: 'justify',
  margin: 10,
  color: '#333333',
},
infoTitle: {
  fontSize: 20,
  textAlign: 'center',
  fontWeight: 'bold',
  marginTop: 10,
  marginRight: 10,
},

// TODO: 更多
more_row: {
// flex: 1,
fontSize: 16,
color: 'rgba(46.0, 44.0, 45.0, 1)',
// padding: 10,
paddingTop: 15,
paddingBottom: 10,
height: 40,
borderTopWidth: 1,
borderTopColor: '#DDDDDD',
borderBottomWidth: 1,
borderBottomColor: '#DDDDDD',
marginLeft: 10,
},

more_separator: {
  flex: 1,
  backgroundColor: '#d3d3d3',
  height: 1,
  marginLeft: 10,
},



more_parent: {
  flex: 1,
  flexDirection: 'column',
},
more_cell_parent: {
  flex: 1,
  alignItems: 'center',
  flexDirection: 'column',
  backgroundColor: 'white',
},

more_cell_content_view: {
  // flex: 1,
  alignItems: 'center',
  flexDirection: 'row',
  backgroundColor: 'white',
  paddingLeft: 10,
},
more_cell_content: {
  marginRight: 5,
},

more_cell_title: {
  // flex: 1,
  flexDirection: 'row',
  fontSize: 16,
  fontWeight: '100',
  marginTop: 2,
  height: 30,
  width: 290,
  marginTop: 10,
},

more_right_indicator: {
  // flex: 1,
  justifyContent: 'flex-end',
  alignItems: 'flex-end',
  height: 15,
  width: 10,
  marginTop: 15,
  marginBottom: 15,
  marginRight: 15,
  marginLeft: 5,
},



more_cell_row_separator: {
  backgroundColor: 'rgba(243.0, 243.0, 243.0, 1)',
  height: 8,
  marginLeft: 0,
},

more_cell_row_no_separator: {
  backgroundColor: 'rgba(0, 0, 0, 0.1)',
  height: 0,
  marginLeft: 0,
},
more_listView_top: {
  marginTop: 10,
  backgroundColor: 'rgba(243.0, 243.0, 243.0, 1)',
},

more_cell_top_line: {
  height: 1,
  backgroundColor: 'rgba(212.0, 212.0, 212.0, 0.5)',
  width: item_width,
},

more_cell_bottom_line: {
  height: 1,
  backgroundColor: 'rgba(212.0, 212.0, 212.0, 0.5)',
  width: item_width,
},

more_cell_highlight: {
flex: 1,
},

more_cell_content_text_color: {
    color: 'rgba(212.0, 212.0, 212.0, 0.9)',
    fontSize: 16,
    fontWeight: '100',
},
more_cell_separator_line_marginLeft: {
  marginLeft: 10,
},

// TODO: Front
cell_top_right: {
  flex: 1,
  paddingLeft: 10,
},

cell_back: {
  flex: 1,
  alignItems: 'flex-start',
  flexDirection: 'column',
  justifyContent: 'flex-start',
  backgroundColor: 'white',
  paddingTop: 10,
  paddingLeft: 10,
  paddingRight: 10,
},

cell_top_view: {
  flex: 1,
  flexDirection: 'row',
},

cell_top_image: {
  backgroundColor: '#dddddd',
  height: 100,
  width: 100,
},
cell_first_row_image: {
  height: item_width/2,
  width: item_width,
},
cell_first_row_title_back: {
  flex: 1,
  marginTop: item_width/2 -30,
  height: 30,
  backgroundColor: 'rgba(0, 0, 0, 0.1)',
},
cell_first_row_title: {
  flex: 1,
  height: 30,
  paddingLeft: 10,
  color: 'white',
  fontSize: 19,

},

cell_first_row_image_back: {
  flex: 1,
  alignItems: 'flex-start',
  justifyContent: 'flex-start',
  backgroundColor: 'white',
},



cell_top_title: {
  flex: 1,
  fontSize: 16,
  fontWeight: '500',
  height: 100,
},

cell_down_view: {
  flex: 1,
  flexDirection: 'column',
  marginTop: 40,
},

cell_down_excerpt: {
  flex: 1,
  fontSize: 14,
},

cell_down_date: {
  flex: 1,
  fontSize: 12,
  color: '#a9a9a9',
},



});

module.exports = styles;
