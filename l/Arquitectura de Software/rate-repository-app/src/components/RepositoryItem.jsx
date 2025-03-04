import React from 'react';
import { View, Image, StyleSheet } from 'react-native';
import StyledText from './StyledText.jsx';

import RepositoryStats from './RepositoryStats.jsx';
import theme from '../theme.js';

const RepositoryItemHeader = ( props ) => (
    <View style={{flexDirection: 'row', paddingBottom: 2}}>
        <View style={{paddingRight: 10}}>
            <Image source={{uri: props.ownerAvatarUrl}} style={styles.image}/>
        </View>
        <View style={{paddingLeft: 10, flex: 1}}>
            <StyledText fontWeight={'bold'} color={'violet'} fontSize={'subheading'}>FullName: {props.fullName}</StyledText>
            <StyledText color={'primary'} fontSize={'body'}>Description: {props.description}</StyledText>
            <StyledText color={'primary'} fontSize={'body'} style={styles.language}>Language: {props.Language}</StyledText>
        </View>
    </View>
)

const RepositoryItem = ( props ) => (
    <View key={props.id} style={styles.container}>
        <RepositoryItemHeader {...props}/>
        <RepositoryStats {...props}/>
    </View>
)

const styles = StyleSheet.create({
    container: {
        backgroundColor: 'white',
        padding: 10,
        paddingBlock: 5
    },
    language: {
        padding: 5,
        backgroundColor: theme.colors.textViolet,
        color: theme.colors.white,
        borderRadius: 5,
        alignSelf: 'flex-start',
        marginBlock: 5
    },
    image: {
        width: 50,
        height: 50,
        borderRadius: 5
    }
});

export default RepositoryItem;