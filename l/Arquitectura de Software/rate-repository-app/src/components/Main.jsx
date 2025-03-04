import React from "react";
import { StyleSheet, Text, View } from "react-native";

import Constants from "expo-constants";

import RepositoryList from "./RepositoryList.jsx";

const Main = () => {
  return (
    <View style={{marginTop: Constants.statusBarHeight, flexGrow: 1}}>
        <Text>Rate Repository App</Text>
        <RepositoryList/>
    </View>
  );
}

const styles = StyleSheet.create({
    container: {
      backgroundColor: '#111fff'
    },
    text: {
      color: '#fff',
    },
});

export default Main;