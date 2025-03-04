import React from "react";
import { Text, View } from "react-native";
import repositories from "../data/repositories.js";
import { FlatList } from "react-native";
import RepositoryItem from "./RepositoryItem.jsx";

const RepositoryList = () => {
  return (
    <FlatList 
        data = {repositories} 
        ItemSeparatorComponent={() => <View style={{height: 5}}/>}
        renderItem = {({ item : repo}) => (
           
            <RepositoryItem {...repo}/>
            
        )}
    />
  );
}

export default RepositoryList;